# terraform-terragrunt-aws-project

# File structure

```bash
terrafrom-terragrunt-aws-project
├── terragrunt.hcl
├── modules
│   ├── subnet
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
├── projects
│   ├── common
│   │   └── common-resources.tf
│   ├── stage
│   │   ├── modules (symlink with root modules via script)
│   │   ├── common-*.tf (symlink with common via script)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   └── prod
│       ├── modules (symlink with root modules via script)
│       ├── common-*.tf (symlink with common)
│       ├── main.tf
│       ├── variables.tf
│       └── output.tf
└── environment
    ├── stage
    │   └── terragrunt.hcl
    └── prod
        └── terragrunt.hcl
```

---

# Run locally

## update config file
The `config.json` file contains essential configurations for Terraform and Terragrunt. You should update this file to match your environment and branch-specific settings.

## cli command

```bash
./run.sh
```

# Run GitHub Action (Terragrunt Plan and Apply)

## Setting Up GitHub Secrets

To ensure that the GitHub Action workflow runs correctly, you need to set up the following GitHub secret:

- **`TF_API_TOKEN`**: This is a Terraform Cloud API token used for authentication.

## Update Config File

The `config.json` file contains essential configurations for Terraform and Terragrunt. You should update this file to match your environment and branch-specific settings.

### Config File Structure

Here is the format for `config.json`:

```json
{
  "terraform_version": "1.8.0",
  "terragrunt_version": "0.57.0",
  "branches": {
    "main": {
      "TF_WORKSPACE": "prod-project",
      "TG_WORKDIR": "environment/stage"
    },
    "stage": {
      "TF_WORKSPACE": "stage-project",
      "TG_WORKDIR": "environment/stage"
    },
    "dev": {
      "TF_WORKSPACE": "dev-project",
      "TG_WORKDIR": "environment/dev"
    },
    "default": {
      "TF_WORKSPACE": "default",
      "TG_WORKDIR": "environment/default"
    }
  }
}


* https://claude.ai/chat/1e10bc36-44ea-4ca7-b471-7526b4fbba7d
* https://github.com/hashicorp/terraform/pull/26796
* https://github.com/hashicorp/terraform/issues/26797
* https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html
* https://github.com/Clivern/Lynx
* https://gitlab.com/silvarion/python/flask/tf-http-mysql-backend/-/tree/main?ref_type=heads
* https://terrakube.org/
* https://www.reddit.com/r/Terraform/comments/13kzaip/reminder_there_are_alternatives_to_terraform/


* https://hiremostafa.scalr.io/ ***
* https://hiremostafa.scalr.io/v2/environment/personal-access-tokens/?environmentId=env-v0ogj8dl0e1b3tl9l



