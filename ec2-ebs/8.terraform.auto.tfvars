# Generic Variables for EC2
aws_region = "us-east-1"
environment = "QA"
# business_divsion = "QA"
owners = "Suresh"
project = "Dextrus"
approvedby = "Srinivas"
instance_type = "t3.xlarge"
instance_keypair = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTFdH6gNWg+XEH2QeFTWr3v3MVzDW6SM4MKufqpU8qSGNd5fKxPE1wubNJKRjV2MY5SrSajwNrNjAkC8zSnTws6EBER8fJRmf3ZB9X0IMNk5IssK2lpMNIuTRhE+J2lN7Q6ZkbzfCyjhdSSHMQv8deFljaJbXPvDSFj1xwbfVTP6MeJ6p/gr/eRt2Pqo5z0VPNCxvwELqnGMbDfvGFzaQb8a7i5obevcaWE3R5GnY/58mAXz6FPB9WcAZmAqwoOmbdXpGXAhRerCMQaJiDN7rnq3msGSlzPeEQjXFwxo7ttAloEEFZr703ZRAQmuS7Iv02T1Gh1d7pVu1H2PwjwCXZ rsa-key-20230220"
ebs1_size = "200"

# VPC Variables
vpc_name = "myvpc1"
vpc_cidr_block = "10.10.0.0/16"
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_public_subnets = ["10.10.101.0/24", "10.10.102.0/24"]




/*
vpc_private_subnets = ["10.10.1.0/24", "10.10.2.0/24"]
vpc_database_subnets= ["10.10.151.0/24", "10.10.152.0/24"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true
*/






