variable "organization" {}

variable "path" {
  default = null
}

variable "default_lease_ttl" {
  default = "8h"
  nullable = false
}

variable "max_lease_ttl" {
  default = "768h"
  nullable = false
}

variable "teams" {
  type = map(object({
    policies = optional(list(string))
    policy_definitions = optional(list(string))
  }))
  default = {}
  nullable = false
}
