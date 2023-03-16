instance_type  = "t3.xlarge"
ami            = "ami-0422d936d535c63b1"
instance_count = 1
vpc_cidr_block = "10.13.0.0/16"
vpc_public_subnets = ["10.13.1.0/24", "10.13.2.0/24"]
vpc_availability_zones = ["us-west-2a", "us-west-2b"]
aws_region = "us-west-2"
environment          = "Prod"