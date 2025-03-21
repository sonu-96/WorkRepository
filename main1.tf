provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = var.aws_region
}

data "aws_s3_bucket" "existing_lambda_bucket" {
  bucket = "your-existing-bucket-name"
}

data "archive_file" "lambda_WorkRepository" {
  type        = "zip"
  source_dir  = "${path.module}/WorkRepository"
  output_path = "${path.module}/WorkRepository.zip"
}

resource "aws_s3_object" "lambda_WorkRepository" {
  bucket = data.aws_s3_bucket.existing_lambda_bucket.id
  key    = "WorkRepository.zip"
  source = data.archive_file.lambda_WorkRepository.output_path
  etag   = filemd5(data.archive_file.lambda_WorkRepository.output_path)
}

data "aws_iam_role" "existing_lambda_role" {
  name = "your-existing-lambda-role-name"  
}

resource "aws_lambda_function" "hello_world" {
  function_name    = "HelloWorld"
  s3_bucket       = data.aws_s3_bucket.existing_lambda_bucket.id
  s3_key          = aws_s3_object.lambda_WorkRepository.key
  runtime         = "nodejs20.x"
  handler         = "hello.handler"
  source_code_hash = data.archive_file.lambda_WorkRepository.output_base64sha256
  role            = data.aws_iam_role.existing_lambda_role.arn
}

resource "aws_cloudwatch_log_group" "hello_world" {
  name              = "/aws/lambda/${aws_lambda_function.hello_world.function_name}"
  retention_in_days = 3
}
