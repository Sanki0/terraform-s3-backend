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