# Define Local Values in Terraform
locals {
  owners = var.owners
  environment = var.environment
  name = "${var.project}-${var.environment}"
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

}