# Define Local Values in Terraform
locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  availability_zone = "${local.region}a"
  region            = var.aws_region
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 