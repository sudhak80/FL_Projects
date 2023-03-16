# Define Local Values in Terraform
locals {
  owners = var.owners
  environment = var.environment
  name = "${var.project}-${terraform.workspace}"
  #name = "${local.owners}-${local.environment}"
  availability_zone = "${local.region}a"
  region            = var.aws_region

  common_tags = {
    Owner = local.owners
    Environment = local.environment
    "Approved By" = var.approvedby
    Project = var.project
    "Use by" = 	"RDT team"
    # Name	= RDt-demo-rds-required
    Purpose	= "RDt Demo"
    # "Created By" = Gowtham
    # "Requested By" =	Srinivas

  }
  backups = {
   schedule  = "cron(0 5 ? * MON-FRI *)" /* UTC Time */
  retention = 7 // days
  }
  #  environmentvars = "${contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
  #  workspace       = "${merge(local.env["default"], local.env[local.environmentvars])}"
}

# locals {
#   default_workspace = {
#     instance_type        = "t3.xlarge"
#     # ami                  = "ami-0ff8a91507f77f867"
#     instance_count       = 1
#     vpc_cidr_block       = "10.10.0.0/16"
#     vpc_public_subnets   = ["10.10.1.0/24", "10.10.2.0/24"]
#     vpc_availability_zones = ["us-east-1a", "us-east-1b"]
#     aws_region           = "us-east-1"
#     key_name             = "default"
#     environment          = "Demo"
#   }
# }

# # Define the workspaces
# workspace "default" {
#   # Use the default workspace
#   variables = local.default_workspace
# }

# workspace "dev" {
#   # Define the dev workspace
#   variables = {
#     instance_type        = "t3.xlarge"
#     # ami                  = "ami-0130c3a072f3832ff"
#     instance_count       = 1
#     vpc_cidr_block       = "10.11.0.0/16"
#     vpc_public_subnets   = ["10.11.1.0/24", "10.11.2.0/24"]
#     vpc_availability_zones = ["us-east-2a", "us-east-2b"]
#     aws_region           = "us-east-2"
#     key_name             = "dev"
#     environment          = "Dev"
#   }
# }

# workspace "qa" {
#   # Define the qa workspace
#   variables = {
#     instance_type        = "t3.xlarge"
#     # ami                  = "ami-00f0abdef923519b0"
#     instance_count       = 1
#     vpc_cidr_block       = "10.12.0.0/16"
#     vpc_public_subnets   = ["10.12.1.0/24", "10.12.2.0/24"]
#     vpc_availability_zones = ["us-west-1a", "us-west-1b"]
#     aws_region           = "us-west-1"
#     key_name             = "qa"
#     environment          = "QA"
#   }
# }

# workspace "prod" {
#   # Define the prod workspace
#   variables = {
#     instance_type        = "t3.xlarge"
#     # ami                  = "ami-0422d936d535c63b1"
#     instance_count       = 1
#     vpc_cidr_block       = "10.13.0.0/16"
#     vpc_public_subnets   = ["10.13.1.0/24", "10.13.2.0/24"]
#     vpc_availability_zones = ["us-west-2a", "us-west-2b"]
#     aws_region           = "us-west-2"
#     key_name             = "prod"
#     environment          = "Prod"
#   }
# }



