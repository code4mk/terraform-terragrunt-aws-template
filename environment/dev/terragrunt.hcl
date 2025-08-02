terraform {
  source = "../../live//dev"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  project_name = "Your project name"
}

inputs = {
  vpc_cidr_block             = "10.1.0.0/16"
  vpc_enable_dns_hostnames   = true
  vpc_enable_dns_support     = true
  vpc_name                   = "dev-vpc"
  vpc_tags                   = {
    "ProjectName" = local.project_name
  }
}
