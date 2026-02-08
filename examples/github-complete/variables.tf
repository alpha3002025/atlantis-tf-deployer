variable "github_token" {
  description = "Github token to use when creating webhook"
  type        = string
}

variable "github_owner" {
  description = "Github owner to use when creating webhook"
  type        = string
}

variable "domain" {
  description = "Route53 domain name to use for ACM certificate. Route53 zone for this domain should be created in advance"
  type        = string
}

variable "atlantis_github_user" {
  description = "GitHub user or organization name"
  type        = string
}

variable "atlantis_github_user_token" {
  description = "GitHub token of the user that is running the Atlantis command"
  type        = string
}

variable "atlantis_github_user_token_ssm_parameter_name" {
  description = "Name of SSM parameter to keep atlantis_github_user_token"
  type        = string
  default     = "/atlantis/github/user/token"
}

variable "atlantis_repo_allowlist" {
  description = "List of GitHub repositories that Atlantis will be allowed to access"
  type        = list(string)
}

variable "repositories" {
  description = "List of GitHub repositories to create webhooks for. This is just the name of the repository, excluding the user or organization"
  type        = list(string)
}
