instance_type  = "t3.xlarge"
ami            = "ami-0130c3a072f3832ff"
instance_count = 1
vpc_cidr_block = "10.11.0.0/16"
vpc_public_subnets = ["10.11.1.0/24", "10.11.2.0/24"]
vpc_availability_zones = ["us-east-2a", "us-east-2b"]
aws_region = "us-east-2"
environment          = "Dev"