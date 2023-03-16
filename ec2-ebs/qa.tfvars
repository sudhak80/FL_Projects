instance_type  = "t3.xlarge"
ami            = "ami-00f0abdef923519b0"
instance_count = 1
vpc_cidr_block = "10.12.0.0/16"
vpc_public_subnets = ["10.12.1.0/24", "10.12.2.0/24"]
vpc_availability_zones = ["us-west-1a", "us-west-1b"]
aws_region = "us-west-1"
environment          = "QA"