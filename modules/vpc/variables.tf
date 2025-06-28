variable "region" {
  description = "region"
  type        = string
}

variable "vpc_a_name" {
  description = "Name of the VPC"
  type        = string
  default     = "vpc-default"
}

variable "vpc_b_name" {
  description = "Name of the VPC B"
  type        = string
  default     = "vpc-b-default"
}

variable "vpc_c_name" {
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

variable "private_subnet_cidr_a" {
  description = "CIDR block for the private subnet in VPC A"
  type        = string
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for the private subnet in VPC B"
  type        = string
}

variable "private_subnet_cidr_c" {
  description = "CIDR block for the private subnet in VPC C"
  type        = string
}

variable "public_subnet_cidr_a" {
  description = "CIDR block for the public subnet in VPC A"
  type        = string
}

variable "public_subnet_cidr_b" {
  description = "CIDR block for the public subnet in VPC B"
  type        = string
}

variable "public_subnet_cidr_c" {
  description = "CIDR block for the public subnet in VPC C"
  type        = string
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
  default     = "private-subnet"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "public-subnet"
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}