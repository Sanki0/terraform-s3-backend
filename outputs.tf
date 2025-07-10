output "s3_bucket_name" {
  description = "Bucket name where the tfstate files are stored"
  value       = aws_s3_bucket.terraform_state.id
}
