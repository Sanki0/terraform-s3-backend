variable "s3_bucket_terraform_state_name" {
  type        = string
  validation {
    condition     = length(var.s3_bucket_terraform_state_name) > 0
    error_message = "The S3 bucket name for Terraform state must be provided."
  }
}
