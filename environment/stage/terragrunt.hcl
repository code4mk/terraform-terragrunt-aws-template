terraform {
  source = "../../live//stage"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr_block             = "10.0.0.0/16"
  vpc_enable_dns_hostnames   = true
  vpc_enable_dns_support     = true
  vpc_name                   = "stage-vpc"
  vpc_tags                   = {
    "Environment" = "stage updated"
  }
}
