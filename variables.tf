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