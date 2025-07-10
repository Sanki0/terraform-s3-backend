# terraform-aws-remote-backend
This module creates a S3 bucket to be used as remote backend

## Importance

This should be initialized as an independent module, and configured only when it is required (probably just one time per project).


## Backend initialization
- First step is to initialize the project and store the `tf.state` file within our home environment. It is important that the backend block within the `providers.tf` file is commented.

```terraform
terraform {
#   backend "s3" {
#     bucket = "xxxxxxx" # REPLACE WITH YOUR BUCKET NAME
#     key = "xxxxx" # REPLACE ONLY THE FIRST TIME
#     region  = "us-east-1" # REPLACE ONLY THE FIRST TIME
#     use_lockfile = true
#     encrypt = true
#     profile = "xxxxx" # REPLACE WITH YOUR AWS PROFILE
#   }
}
```
- After we make sure we have no backend block configured we can initialize the project for the first time.
```shell
terraform init 
terraform plan 
terraform apply
```
- After the resources have been created we should be able to use the S3 bucket.
- Finally, we are able to uncomment the backend block within the `providers.tf` file. To migrate the `tfstate` file we must initialize, again, the project by executing `terraform init`.

```terraform
terraform {
backend "s3" {
  backend "s3" {
    bucket = "xxxxxxx" # REPLACE WITH YOUR BUCKET NAME
    key = "xxxxx" # REPLACE ONLY THE FIRST TIME
    region  = "us-east-1" # REPLACE ONLY THE FIRST TIME
    use_lockfile = true
    encrypt = true
    profile = "xxxxx" # REPLACE WITH YOUR AWS PROFILE
  }
   }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.42 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.42 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.terraform_state_crypto_conf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.terraform_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_s3_bucket_terraform_state_name"></a> [s3\_bucket\_terraform\_state\_name](#input\_s3\_bucket\_terraform\_state\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | Bucket name where the tfstate files are stored |
<!-- END_TF_DOCS -->