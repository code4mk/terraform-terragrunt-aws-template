# Define the Terraform backend configuration to use Terraform Cloud
locals {
  organization = get_env("TERRAFORM_ORG_NAME")
  workspace_tags = get_env("TERRAFORM_WORKSPACE_TAGS")
}


generate "backend" {
  path      = "auto_generated_backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  cloud {
    organization = "${local.organization}"
    workspaces {
      tags = ["${local.workspace_tags}"]
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
EOF
}
