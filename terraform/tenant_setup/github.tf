

locals {
  yaml = yamldecode(file(var.tenant_onboarding_yaml))
}

resource "github_repository" "tenant_repo" {
  name                   = "groupsec-edgesecurity-tenant-${lower(local.yaml.application_name)}"
  description            = "${local.yaml.application_name} self service repo for managing edge security CDN and WAF configuration"
  visibility             = "private"
  auto_init              = true
  has_issues             = true
  delete_branch_on_merge = true
  template {
    owner                = var.template_repo.owner
    repository           = var.template_repo.repository
    include_all_branches = var.template_repo.include_all_branches
  }
}

data "github_user" "admin_user" {
  for_each = { for admin_user in var.default_admins : admin_user => admin_user }
  username = each.key
}

resource "github_repository_collaborator" "repo_collaborators_admin" {
  for_each   = { for admin_user in var.default_admins : admin_user => admin_user }
  repository = github_repository.tenant_repo.name
  permission = "admin"
  username   = data.github_user.admin_user[each.key].username
}
