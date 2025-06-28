# VPC modules for AWS networking labs
# This module creates VPCs with public and private subnets, route tables, and internet gateways.

module "vpc_a" {
  source = "./modules/vpc"
  region = local.region

}