
# Searching for the IMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

# Security group creation
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${local.name}-sg"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]
  #ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags

}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "fl-server-keypair" {
  key_name   = "${local.name}-keypair"
  public_key = tls_private_key.pk.public_key_openssh

    provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./${local.name}-keypair.pem"
  }
  tags = local.common_tags
}

################################################################################
# EC2 Module
################################################################################

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"

  name                          = "${local.name}-ec2"
  ami                           = data.aws_ami.amazon_linux.id  #var.ami
  instance_type                 = var.instance_type
  key_name                      = aws_key_pair.fl-server-keypair.key_name
  availability_zone             = local.availability_zone
  subnet_id                     = element(module.vpc.public_subnets,0)
  vpc_security_group_ids        = [module.security_group.security_group_id]
  associate_public_ip_address   = true


  tags = {
    Owners = local.owners
    Environment = local.environment
    "Approved By" = var.approvedby
    Project = var.project
    "Use by" = 	"RDT team"
    Purpose	= "RDt Demo"
    Backup   = "true"
  }
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2.id

}

resource "aws_ebs_volume" "this" {
  availability_zone = local.availability_zone
  size              = var.ebs1_size

  tags = local.common_tags
}