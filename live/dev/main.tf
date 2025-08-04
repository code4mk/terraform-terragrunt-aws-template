locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support
  name                 = var.vpc_name
  tags                 = merge(var.vpc_tags, local.common_tags)
}
