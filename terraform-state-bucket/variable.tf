variable "aws_region" {
  description = "The AWS region to deploy the bucket in."
  type        = string
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "The globally unique name for the S3 state bucket."
  type        = string
  # A default is helpful, but you can also remove it
  # and provide the name at runtime.
  default     = "poormans-kubernetes-terraform-state-32412"
}