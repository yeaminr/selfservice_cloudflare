#Ref: https://registry.terraform.io/providers/integrations/github/latest/docs

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.3.0"
    }
  }
}
provider "github" {
  owner = var.github_organization
  app_auth {
    #id              = var.app_id              # or `GITHUB_APP_ID`
    #installation_id = var.app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
    #pem_file        = var.app_pem_file        # or `GITHUB_APP_PEM_FILE`
  }
}
