terraform {
  source = "../../live//prod"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  environment = "prod"
  project_name = "Your project name"
}

inputs = {
  environment                = local.environment
  aws_region                 = "us-east-1"

  # VPC configuration
  vpc_cidr_block             = "10.2.0.0/16"
  vpc_enable_dns_hostnames   = true
  vpc_enable_dns_support     = true
  vpc_name                   = "${local.environment}-vpc"
  vpc_tags                   = {
    "ProjectName" = local.project_name
  }
}
