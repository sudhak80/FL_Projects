instance_type  = "t3.xlarge"
ami            = "ami-0ff8a91507f77f867"
instance_count = 1
vpc_cidr_block = "10.10.0.0/16"
vpc_public_subnets = ["10.10.1.0/24", "10.10.2.0/24"]
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
aws_region = "us-east-1"
environment          = "Demo"