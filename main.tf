resource "vault_github_auth_backend" "this" {
  organization      = var.organization
  path              = var.path
  token_bound_cidrs = []
  token_policies    = []
  tune {
    default_lease_ttl = var.default_lease_ttl
    max_lease_ttl     = var.max_lease_ttl
    token_type        = "default-service"
  }
}

module "teams" {
  source             = "app.terraform.io/ptonini-org/github-auth-team/vault"
  version            = "~> 1.0.0"
  backend            = vault_github_auth_backend.this.path
  for_each           = var.teams
  name               = each.key
  policies           = each.value.policies
  policy_definitions = each.value.policy_definitions
}
