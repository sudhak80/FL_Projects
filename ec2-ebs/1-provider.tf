
# Terraform Block
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "rightdata-tfstate"
    key    = "test/eks"
    region = "us-east-1"
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

