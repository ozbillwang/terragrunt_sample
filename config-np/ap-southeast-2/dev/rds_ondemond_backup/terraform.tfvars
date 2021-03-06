terragrunt = {
  terraform {
    source = "github.com/ozbillwang/tf_module_rds_ondemond_backup?ref=1.0.0"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# ---------------------------------------------------------------------------------------------------------------------
name_prefix="rds_backup"
daily_retention="7"
weekly_retention="4"
monthly_retention="3"
