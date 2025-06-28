variable "region" {
  description = "region"
  type        = string
}

variable "vpc_a" {
  description = "Name of the VPC"
  type        = string
  default     = "vpc-default"
}

variable "vpc_b" {
  description = "Name of the VPC B"
  type        = string
  default     = "vpc-b-default"
}

variable "vpc_c" {
  description = "Name of the VPC C"
  type        = string
  default     = "vpc-c-default"
}

variable "vpc_cidr_a" {
  description = "CIDR block for the VPC A"
  type        = string
}

variable "vpc_cidr_b" {
  description = "CIDR block for the VPC B"
  type        = string
}

variable "vpc_cidr_c" {
  description = "CIDR block for the VPC C"
  type        = string
}

variable "vpc_a_private_subnet_cidr" {
  description = "CIDR block for the private subnet in VPC A"
  type        = string
}

variable "vpc_a_public_subnet_cidr" {
  description = "CIDR block for the public subnet in VPC A"
  type        = string
}


variable "vpc_b_private_subnet_cidr" {
  description = "CIDR block for the private subnet in VPC B"
  type        = string
}

variable "vpc_b_public_subnet_cidr" {
  description = "CIDR block for the public subnet in VPC B"
  type        = string
}

variable "vpc_c_private_subnet_cidr" {
  description = "CIDR block for the private subnet in VPC C"
  type        = string
}

variable "vpc_c_public_subnet_cidr" {
description = "CIDR block for the public subnet in VPC C"
type        = string
}


variable "vpc_a_private_subnet_name" {
  description = "Name of the private subnet in VPC A"
  type        = string
  default     = "private-subnet"
}

variable "vpc_a_public_subnet_name" {
  description = "Name of the public subnet in VPC A"
  type        = string
  default     = "public-subnet"
}

variable "vpc_b_private_subnet_name" {
  description = "Name of the private subnet in VPC B"
  type        = string
  default     = "private-subnet-b"
}
variable "vpc_b_public_subnet_name" {
  description = "Name of the public subnet in VPC B"
  type        = string
  default     = "public-subnet-b"
}

variable "vpc_c_private_subnet_name" {
  description = "Name of the private subnet in VPC C"
  type        = string
  default     = "private-subnet-c"
}

variable "vpc_c_public_subnet_name" {
  description = "Name of the public subnet in VPC C"
  type        = string
  default     = "public-subnet-c"
}

variable "availability_zones" {
  description = "List of availability zones for he VPC"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

