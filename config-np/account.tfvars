# Root level variables that all modules can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.

tfstate_global_bucket        = "${get_aws_account_id()}-terraform-state"
tfstate_global_bucket_region = "ap-southeast-2"
