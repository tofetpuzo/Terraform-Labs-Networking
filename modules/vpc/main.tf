data "aws_region" "current" {}



# Create IPAM
resource "aws_vpc_ipam" "aws_ipam" {
  operating_regions {
    region_name = data.aws_region.current.region
  }
}

# Create an IPAM pool
resource "aws_vpc_ipam_pool" "aws_ipam_pool" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.aws_ipam.private_default_scope_id
  locale         = "eu-west-1"
}

# Assign a CIDR block to the pool
resource "aws_vpc_ipam_pool_cidr" "aws_ipam_pool_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.aws_ipam_pool.id
  cidr         = "10.0.0.0/16"
}

# Create a VPC using CIDR from the pool
resource "aws_vpc" "aws_vpc" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.aws_ipam_pool.id
  ipv4_netmask_length = 24

  depends_on = [aws_vpc_ipam_pool_cidr.aws_ipam_pool_cidr, aws_vpc_ipam.aws_ipam]
}
