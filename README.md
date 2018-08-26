# Infrastructure-live with terraform and terragrunt

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Quick start](#quick-start)
    - [Pre-requisites](#pre-requisites)
    - [Deploy](#deploy)
    - [How is the code in this repo organized?](#how-is-the-code-in-this-repo-organized)
    - [Creating and using root (account) level variables](#creating-and-using-root-account-level-variables)
    - [Available templates](#available-templates)
    - [Fork and reference:](#fork-and-reference)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This repo shows an example file/folder structure you can use with [Terragrunt](https://github.com/gruntwork-io/terragrunt) to keep your
[Terraform](https://www.terraform.io) code DRY. For background information, check out the [Keep your Terraform code
DRY](https://github.com/gruntwork-io/terragrunt#keep-your-terraform-code-dry) section of the Terragrunt documentation.

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

### How is the code in this repo organized?

The code in this repo uses the following folder hierarchy:

```
account
 └ _global
 └ region
    └ _global
    └ environment
       └ resource
```

Where:

* **Account**: At the top level are each of your AWS accounts, such as `stage-account`, `prod-account`, `mgmt-account`,
  etc. If you have everything deployed in a single AWS account, there will just be a single folder at the root (e.g.
  `main-account`).

* **Region**: Within each account, there will be one or more [AWS
  regions](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html), such as
  `us-east-1`, `eu-west-1`, and `ap-southeast-2`, where you've deployed resources. There may also be a `_global`
  folder that defines resources that are available across all the AWS regions in this account, such as IAM users,
  Route 53 hosted zones, and CloudTrail.

* **Environment**: Within each region, there will be one or more "environments", such as `qa`, `stage`, etc. Typically,
  an environment will correspond to a single [AWS Virtual Private Cloud (VPC)](https://aws.amazon.com/vpc/), which
  isolates that environment from everything else in that AWS account. There may also be a `_global` folder
  that defines resources that are available across all the environments in this AWS region, such as Route 53 A records,
  SNS topics, and ECR repos.

* **Resource**: Within each environment, you deploy all the resources for that environment, such as EC2 Instances, Auto
  Scaling Groups, ECS Clusters, Databases, Load Balancers, and so on. 

### Creating and using root (account) level variables

In the situation where you have multiple AWS accounts or regions, you often have to pass common variables down to each of your modules. Rather than copy/pasting the same variables into each `.tfvars` file, in every region, and in every environment, you can inherit them from the root `terraform.tfvars` file and corresponding `account.tfvars` file (see the files of the same name in this repo for the example config).

### Available templates

* `rds_ondemond_backup` - [config-np/ap-southeast-2/dev/rds_ondemond_backup](config-np/ap-southeast-2/dev/rds_ondemond_backup)

### Fork and reference:

This repo is forked from https://github.com/gruntwork-io/terragrunt-infrastructure-live-example
