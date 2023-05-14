############################# main : var #######################################
variable "project" { type = string }
variable "env" { type = string }
# variable "aws_profile" { type = string }
variable "aws_region" { type = string }
variable "default_tags" { default     = {} }

###############################################################################
# sec-v
###############################################################################

# variable "sec_name1" { type = string }
# variable "secret_key1" { type = string }
# variable "secret_value1" { type = string }

# pw 는 tfc 콘솔상에 기재
variable "db_pass_ro" { type = string }
variable "db_pass_rw" { type = string }

variable "secrets" {
  description = "secrets for secret-manager"
  type = list(object({
    name            = string
    sec = object({
      # is_need                = optional(bool, false)
      # exist_managed_policies = optional(list(string), [])
      db_host_ro                 = optional(string, "")
      db_host_rw                 = optional(string, "")
      db_user_ro                 = optional(string, "")
      db_user_rw                 = optional(string, "")
      # db_pass_ro                 = optional(string, "")
      # db_pass_rw                 = optional(string, "")
    })
  }))
}

