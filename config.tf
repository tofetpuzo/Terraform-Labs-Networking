# this file defines the variable that wil be referenced outside this module` 
locals {

  # Define the name of the VPC
  vpc_a_name = "vpc_a"
  vpc_b_name = "vpc_b"
  vpc_c_name = "vpc_c"

  # Define the CIDR block for VPC A
  vpc_a_cidr = "10.1.0.0/16"
  vpc_b_cidr = "10.2.0.0/16"
  vpc_c_cidr = "10.3.0.0/16"

  # define the subnet for each cidr block 
  vpc_a_private_subnet_cidr = "10.1.0.0/24" ## "where actual workload resides"
  vpc_a_public_subnet_cidr  = "10.1.1.0/24" ## "where NAT gateway resides"

  vpc_b_private_subnet_cidr = "10.2.0.0/24" ## "where NAT gateway resides"  
  vpc_b_public_subnet_cidr  = "10.2.1.0/24" ## "where NAT gateway resides"


  vpc_c_private_subnet_cidr = "10.3.0.0/24" ## "where actual workload resides"
  vpc_c_public_subnet_cidr  = "10.3.1.0/24" ## "where NAT gateway resides"

  #   vpc names
  vpc_a_private_subnet_name = "private_subnet_a"
  vpc_a_public_subnet_name  = "public_subnet_a"

  vpc_b_private_subnet_name = "private_subnet_b"
  vpc_b_public_subnet_name  = "public_subnet_b"

  vpc_c_private_subnet_name = "private_subnet_c"
  vpc_c_public_subnet_name  = "public_subnet_c"

  # Define the availability zones for each VPC
  availability_zones = ["eu-west-1a"]

  # Define the region for the VPCs
  region = "eu-west-1"


}