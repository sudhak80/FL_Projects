# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"
  #version = "~> 3.11"

  # VPC Basic Details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  #private_subnets = var.vpc_private_subnets

  # Database Subnets
  #database_subnets = var.vpc_database_subnets
  #create_database_subnet_group = var.vpc_create_database_subnet_group
  #create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  # create_database_internet_gateway_route = true
  # create_database_nat_gateway_route = true
  
  # NAT Gateways - Outbound Communication
  #enable_nat_gateway = var.vpc_enable_nat_gateway
  #single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = local.common_tags
  vpc_tags = local.common_tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "terra_igw1" {
  vpc_id = module.vpc.vpc_id
  tags = local.common_tags
}

# Route table: attach Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = module.vpc.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw1.id
  }
  tags = local.common_tags
}

# Route table association with public subnets
resource "aws_route_table_association" "a" {
  count = length(var.vpc_cidr_block)
  subnet_id      = element(module.vpc.public_subnets,0)
  route_table_id = aws_route_table.public_rt.id
}