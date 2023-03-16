# Generic Variables for EC2
aws_region = "us-west-2"
environment = "QA"
# business_divsion = "QA"
owners = "Suresh"
project = "Dextrus"
approvedby = "Srinivas"
instance_type = "t3.xlarge"
#instance_keypair = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPT59+SCkocYw8tSY8uc0n3O0WE4Bp3Dsy89NhLfe3beKZ4cGan7HNSTAjyuvhWuLf05fJZSCr99ZnOji8SBGzDPQ+JCfYOMKKPYHCmRUN7tOA4OQQCfgOEw/Ac2SOMZndfoCzTYQs3WGW6Egn0DtqRxLW8oUAhsPIv2p0JcM6K8poqS0SyzK8N4CelpvbSsfsqEZfTogOdu3O/D7jhYTxauYDLll7axgBdRvlm2jQG79WMyV3eBLUbLLjKhyjHRuEOCDuuu0DaXm1qWvMo4Fm77PVckGGt7JW4l7MKr0UYo7Z4UeT4x3VC2Yv7abBEP/O8wlqQw4VxQlXyqv6vcrD hadoop"
ebs1_size = "200"
# EC2 variables
key_name      = "detrus-demo"
public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPT59+SCkocYw8tSY8uc0n3O0WE4Bp3Dsy89NhLfe3beKZ4cGan7HNSTAjyuvhWuLf05fJZSCr99ZnOji8SBGzDPQ+JCfYOMKKPYHCmRUN7tOA4OQQCfgOEw/Ac2SOMZndfoCzTYQs3WGW6Egn0DtqRxLW8oUAhsPIv2p0JcM6K8poqS0SyzK8N4CelpvbSsfsqEZfTogOdu3O/D7jhYTxauYDLll7axgBdRvlm2jQG79WMyV3eBLUbLLjKhyjHRuEOCDuuu0DaXm1qWvMo4Fm77PVckGGt7JW4l7MKr0UYo7Z4UeT4x3VC2Yv7abBEP/O8wlqQw4VxQlXyqv6vcrD hadoop"
ami           = "ami-02701bcdc5509e57b"

# VPC Variables
vpc_name = "dextrus-demo"
vpc_cidr_block = "10.20.0.0/16"
vpc_availability_zones = ["us-west-2a", "us-west-2b"]
vpc_public_subnets = ["10.10.101.0/24", "10.10.102.0/24"]




/*
vpc_private_subnets = ["10.10.1.0/24", "10.10.2.0/24"]
vpc_database_subnets= ["10.10.151.0/24", "10.10.152.0/24"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true
*/






