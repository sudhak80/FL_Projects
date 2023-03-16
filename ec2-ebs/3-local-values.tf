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

locals {
   env = {
      default = {
         instance_type  = "t2.micro"
         ami            = "ami-0ff8a91507f77f867"
         instance_count = 1
      }
      dev = {
         instance_type  = "m5.2xlarge"
         ami            = "ami-0130c3a072f3832ff"
      }
      qa = {
         instance_type  = "m5.2xlarge"
         ami            = "ami-00f0abdef923519b0"
         instance_count = 3
      }
      prod = {
         instance_type  = "c5.4xlarge"
         ami            = "ami-0422d936d535c63b1"
         instance_count = 6
      }
   }
  #  environmentvars = "${contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
  #  workspace       = "${merge(local.env["default"], local.env[local.environmentvars])}"
}

backups = {
   schedule  = "cron(0 5 ? * MON-FRI *)" /* UTC Time */
retention = 7 // days
}

}