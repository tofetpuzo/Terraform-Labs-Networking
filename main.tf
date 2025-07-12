# VPC modules for AWS networking labs
# This module creates VPCs with public and private subnets, route tables, and internet gateways.

module "vpc" {
  source = "./modules/vpc"
  region = local.region

  # Define the names of the VPCs
  vpc_a = local.vpc_a_name
  vpc_b = local.vpc_b_name
  vpc_c = local.vpc_c_name

  availability_zones = local.availability_zones

  # Define the CIDR blocks for each VPC
  vpc_cidr_a = local.vpc_a_cidr
  vpc_cidr_b = local.vpc_b_cidr
  vpc_cidr_c = local.vpc_c_cidr

  # Define the CIDR blocks for the private and public subnets in each VPC
  vpc_a_private_subnet_cidr = local.vpc_a_private_subnet_cidr
  vpc_b_private_subnet_cidr = local.vpc_b_private_subnet_cidr
  vpc_c_private_subnet_cidr = local.vpc_c_private_subnet_cidr

  vpc_a_public_subnet_cidr = local.vpc_a_public_subnet_cidr
  vpc_b_public_subnet_cidr = local.vpc_b_public_subnet_cidr
  vpc_c_public_subnet_cidr = local.vpc_c_public_subnet_cidr


  # Define the names of the private and public subnets in each VPC
  vpc_a_private_subnet_name = local.vpc_a_private_subnet_name
  vpc_a_public_subnet_name  = local.vpc_a_public_subnet_name

  vpc_b_private_subnet_name = local.vpc_b_private_subnet_name
  vpc_b_public_subnet_name  = local.vpc_b_public_subnet_name

  vpc_c_private_subnet_name = local.vpc_c_private_subnet_name
  vpc_c_public_subnet_name  = local.vpc_c_public_subnet_name

}

