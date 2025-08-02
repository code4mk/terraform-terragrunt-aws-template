# terraform-terragrunt-aws-project

A Terraform and Terragrunt project for managing AWS infrastructure across multiple environments (dev, stage, prod).

# Directory Structure

- `modules/` — Reusable Terraform modules (`vpc`, `subnet`, etc.)
- `live/` - Terraform related code per environment
  - `common/` — Shared code across all environments
  - `dev/`, `stage/`, `prod/` — Environment-specific code
    - `modules/` — Symlinks to root-level modules
    - `common-*.tf` — Symlinks to shared `common` configs
- `environment/` — Contains per-environment `terragrunt.hcl` config
- `root.hcl` — Root-level configuration used by all environments
- `scripts/` — Utility scripts for setting up symlinks and running terragrunt

# File structure

```bash
terraform-terragrunt-aws-project/
├── root.hcl                # Root Terragrunt config (shared by all envs)
│
├── modules/                           # Reusable Terraform modules
│   ├── subnet/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── vpc/
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
│
├── live/                          # Terraform project code per environment
│   ├── common/                        # Shared Terraform configurations
│   │   └── common-*.tf              # e.g., common-tags.tf, common-provider.tf
│   ├── dev/
│   │   ├── modules/                   # 🔗 Symlinks to ../../modules/*
│   │   ├── common-*.tf                # 🔗 Symlinks to ../common/*
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   ├── stage/
│   │   ├── modules/                   # 🔗 Symlinks to ../../modules/*
│   │   ├── common-*.tf                # 🔗 Symlinks to ../common/*
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   └── prod/
│       ├── modules/                   # 🔗 Symlinks to ../../modules/*
│       ├── common-*.tf                # 🔗 Symlinks to ../common/*
│       ├── main.tf
│       ├── variables.tf
│       └── output.tf
│
├── environment/                       # Terragrunt HCL configs per environment
│   ├── dev/
│   │   └── terragrunt.hcl
│   ├── stage/
│   │   └── terragrunt.hcl
│   └── prod/
│       └── terragrunt.hcl
│
└── scripts/                           # Setup automation scripts
    ├── run.sh                     # ✅ Run scripts
    ├── symlink-common.sh          # 🔁 Symlinks common tf files into all envs
    └── symlink-modules.sh         # 🔁 Symlinks shared modules into all envs
```

---

## Usage

1. add symlink for modules and common files
```bash
./scripts/symlink-modules.sh
./scripts/symlink-common.sh
```

2. add .env file to the root of the project

```bash
TERRAFORM_ORG_NAME=
TERRAFORM_WORKSPACE_TAGS=
```
3. update config.json file

4. run terragrunt with the following command
```bash
./scripts/run.sh
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
  "terraform_version": "1.12.2",
  "terragrunt_version": "0.83.2",
  "environments": {
    "main": {
      "TF_WORKSPACE": "infra-aws-prod",
      "TG_WORKDIR": "environment/prod"
    },
    "stage": {
      "TF_WORKSPACE": "infra-aws-stage",
      "TG_WORKDIR": "environment/stage"
    },
    "dev": {
      "TF_WORKSPACE": "infra-aws-dev",
      "TG_WORKDIR": "environment/dev"
    },
    "default": {
      "TF_WORKSPACE": "default",
      "TG_WORKDIR": "environment/default"
    }
  }
}
```
---

## 💼 Professional Services

### Need Help with Your Infrastructure?

I'm available for hire to help with your Terraform, Terragrunt, and AWS infrastructure projects.

**Services offered:**
- Infrastructure as Code (IaC) development
- AWS cloud architecture and deployment
- Terraform/Terragrunt consulting and best practices
- CI/CD pipeline setup and optimization
- Infrastructure troubleshooting and optimization

**📧 Contact:** hiremostafa@gmail.com

---


