variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "us-east-1"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key ID for all resources."
  default = "value"
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret access key for all resources."
  default = "value"
  type = string
}

variable "existing_lambda_bucket_name" {
  description = "Name of the existing S3 bucket to use for the Lambda function."
  type        = string
  default     = "your-existing-bucket-name"
}

variable "existing_lambda_role_name" {
  description = "Name of the existing IAM role to use for the Lambda function."
  type        = string
  default     = "your-existing-lambda-role-name"
}

variable "existing_layer_name" {
  description = "Name of the existing Lambda layer to use for the Lambda function."
  type        = string
  default     = "your-existing-layer-name"
}

variable "existing_load_balancer_name" {
  description = "Name of the existing load balancer to use for the Lambda function."
  type        = string
  default     = "your-existing-load-balancer-name"
}