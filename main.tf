# VPC modules for AWS networking labs
# This module creates VPCs with public and private subnets, route tables, and internet gateways.

module "vpc_a" {
  source = "./modules/vpc"
  region = local.region
}

module "vpc_b" {
  source = "./modules/vpc"
  region = local.region
}

module "vpc_c" {
  source = "./modules/vpc"
  region = local.region
  vpc_name = local.vpc_c_name
  vpc_cidr = local.vpc_c_cidr
  private_subnet_cidr = local.vpc_c_private_subnet_cidr
  public_subnet_cidr = local.vpc_c_public_subnet_cidr
  private_subnet_name = local.vpc_c_private_subnet_name
  public_subnet_name = local.vpc_c_public_subnet_name
  availability_zones = local.availability_zones
}

# get the subnets from each vpc module
module "vpc_a_subnets" {
  source = "./modules/vpc/subnets"
  vpc_id = module.vpc_a.vpc_id
}