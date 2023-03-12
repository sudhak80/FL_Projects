
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

  name        = local.name
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]
  #ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags

}

resource "aws_key_pair" "fl-server-keypair" {
  key_name   = "${local.name}-${var.vpc_name}-server-keypair"
  public_key = var.instance_keypair
}

################################################################################
# EC2 Module
################################################################################

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"

  name                          = local.name
  ami                           = data.aws_ami.amazon_linux.id
  instance_type                 = var.instance_type
  key_name                      = aws_key_pair.fl-server-keypair.key_name
  availability_zone             = local.availability_zone
  subnet_id                     = element(module.vpc.public_subnets,0)
  vpc_security_group_ids        = [module.security_group.security_group_id]
  associate_public_ip_address   = true

  tags = {
    owners = local.owners
    environment = local.environment
    key   = "Backup"
    value = "true"
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


#################################################
/*
locals {
  availability_zone = "${local.region}a"
  name              = "example-ec2-volume-attachment"
  region            = "eu-west-1"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.name
  cidr = "10.99.0.0/18"

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]

  tags = local.tags
}
*/