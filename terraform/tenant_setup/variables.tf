variable "github_organization" {
  type        = string
  default     = "CBA-General"
  description = "Github organization name"
  validation {
    condition     = length(var.github_organization) > 0 && length(regexall("^CBA-[a-zA-Z0-9-]+$", var.github_organization)) > 0
    error_message = "Github organization name cannot be empty and should start with CBA-"
  }
}

variable "tenant_onboarding_yaml" {
  type        = string
  description = "Full path of the tenant onboarding yaml"
  default     = "tenant_onboarding_settings.yml"
  validation {
    condition     = fileexists(var.tenant_onboarding_yaml) && (length(regexall("^[a-zA-Z0-9_]+.yml$", var.tenant_onboarding_yaml)) > 0 || length(regexall("^[a-zA-Z0-9_]+.yaml$", var.tenant_onboarding_yaml)) > 0)
    error_message = "File not ends with yml or not found"
  }
}
variable "template_repo" {
  type = object({
    owner                = string
    repository           = string
    include_all_branches = bool
    }
  )
  description = "Template repo configuration"
  default = {
    owner                = "CBA-General"
    repository           = "groupsec-edgesecurity-tenant-repo-template"
    include_all_branches = false
  }
  validation {
    condition     = length(var.template_repo.owner) > 0 && length(regexall("^CBA-[a-zA-Z0-9-]+$", var.template_repo.owner)) > 0
    error_message = "Template repo owner cannot be empty and should start with CBA-"
  }
}

variable "default_admins" {
  type        = list(string)
  description = "Default admins for the tenant repos"
  default = [
    "Fazith-Abubacker_cba",
    "Saurav-Gupta4_cba",
    "Yeamin-Rajeev_cba",
    "David-Cottrill_cba",
    "Akalya-Nagaruban_cba"
  ]
}
