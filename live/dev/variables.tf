variable "environment" {
  type = string
  description = "The environment to deploy to"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  default = ""
}

variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "The AWS region to deploy to"
}

variable "vpc_cidr_block" {
  type = string
  description = "The CIDR block for the VPC"
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
  default = true
  description = "Whether to enable DNS hostnames for the VPC"
}

variable "vpc_enable_dns_support" {
  type    = bool
  default = true
  description = "Whether to enable DNS support for the VPC"
}

variable "vpc_name" {
  type = string
  description = "The name of the VPC"
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
  description = "The tags for the VPC"
}
