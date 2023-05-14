
locals {
  # sec_name1 = var.sec_name1
  # # secret-name from TFC
  # secret_key1 = var.secret_key1
  # # ky-name from TFC
  # secret_value1 = var.secret_value1
  # # sec-value from TFC

}

module "secrets-manager" {
  #source = "lgallard/secrets-manager/aws"
  source = "./modules-secret-manager"
  for_each = { for x in var.secrets : x.name => x }

  secrets = {

    # "${local.sec_name1}" = {
    #   description = "key/value secret"
    #   secret_key_value = {
    #     username = local.secret_key1
    #     password = local.secret_value1
    #   }

    #   recovery_window_in_days = 7
    #   policy                  = null

    #   # tags = {
    #   #   app = "web"
    #   # }
    # },

    "${each.value.name}" = {
      description = "key/value secret"
      secret_key_value = {
        db_host_ro = each.value.sec.db_host_ro
        db_host_rw = each.value.sec.db_host_rw
        db_user_ro = each.value.sec.db_user_ro
        db_user_rw = each.value.sec.db_user_rw
        db_pass_ro = var.db_pass_ro
        db_pass_rw = var.db_pass_rw
      }

      recovery_window_in_days = 7
      policy                  = null

      # tags = {
      #   app = "web"
      # }
    },

  }

  tags = merge(var.default_tags, {
    # Terraform   = true
    "managed" = "terraform"
    "app" = "web"
  })

}
