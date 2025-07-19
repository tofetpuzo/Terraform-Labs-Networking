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


# Create a VPC A
resource "aws_vpc" "aws_vpc_a" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.aws_ipam_pool.id
  ipv4_netmask_length = 24

  depends_on = [aws_vpc_ipam_pool_cidr.aws_ipam_pool_cidr, aws_vpc_ipam.aws_ipam]
}


# create subnet for VPC A
resource "aws_subnet" "aws_subnet_a" {
  vpc_id            = aws_vpc.aws_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "aws_subnet_a"
  }
}

# Subnets In Secondary VPC A CIDR Blocks
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr_vpc_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.20.0.0/16"
}

resource "aws_subnet_vpc_a" "in_secondary_cidr_vpc_a" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = "172.20.0.0/24"
}

# association of Subnet A
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr_vpc_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.20.0.0/16"
}


###################################################################################
# # Create a VPC B
################################################################################### 

resource "aws_vpc" "aws_vpc_b" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.aws_ipam_pool.id
  ipv4_netmask_length = 24
  depends_on          = [aws_vpc_ipam_pool_cidr.aws_ipam_pool_cidr, aws_vpc_ipam.aws_ipam]
}

# create subnet for VPC B
resource "aws_subnet" "aws_subnet_b" {
  vpc_id            = aws_vpc.aws_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "aws_subnet_b"
  }
}

# Subnets In Secondary VPC B CIDR Blocks
resource "aws_subnet_vpc_b" "in_secondary_cidr" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = "172.20.1.0/24"

  tags = {
    Name = "aws_subnet_b"
  }
}

# association of Subnet B
resource "aws_vpc_b_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.20.0.0/16"
}


######################################################################################
# Create a VPC C
######################################################################################

resource "aws_vpc" "aws_vpc_c" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.aws_ipam_pool.id
  ipv4_netmask_length = 24
  depends_on          = [aws_vpc_ipam_pool_cidr.aws_ipam_pool_cidr, aws_vpc_ipam.aws_ipam]
}

# create subnet for VPC C
resource "aws_subnet" "aws_subnet_c" {
  vpc_id            = aws_vpc.aws_vpc_c.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    Name = "aws_subnet_c"
  }
}

# Subnets In Secondary VPC C CIDR Blocks
resource "aws_subnet_vpc_c" "in_secondary_cidr" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = "172.20.2.0/24"

  tags = {
    Name = "aws_subnet_c"
  }
}

# association of Subnet C
resource "aws_vpc_c_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.20.0.0/16"
}
