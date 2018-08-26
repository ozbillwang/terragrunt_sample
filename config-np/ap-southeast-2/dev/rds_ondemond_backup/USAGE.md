# Quick start
### Pre-requisites

1. Install [Terraform](https://www.terraform.io/) and [Terragrunt](https://github.com/gruntwork-io/terragrunt).
2. Configure your AWS credentials using [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
3. A quick way to validate aws credentials

    aws s3 ls

### Deploy

Suppose you need deploy rds_ondemond_backup solution to dev environment.

1. `cd` into the module's folder (e.g. `cd config-np/ap-southeast-2/dev/rds_ondemond_backup`)
2. Adjust variables in `terraform.tfvars`
3. Run `terragrunt plan` to see the changes you're about to apply.
4. If the plan looks good, run `terragrunt apply`.

Notes: Recommend to clean terragrunt cache with command `rm -rf ~/.terragrunt`, before you run `terragrun plan|apply`
