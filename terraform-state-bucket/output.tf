output "s3_bucket_name" {
  description = "The name of the S3 bucket created for Terraform state."
  value       = aws_s3_bucket.tf_state.bucket
}