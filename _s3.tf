resource "aws_s3_bucket" "bucket-lambda-app" {
  bucket = "s3_lambda_app_${var.environment}"

  tags = {
    Name        = "s3_lambda_app_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_acl" "bucket-lambda-app-acl" {
  bucket = aws_s3_bucket.bucket-lambda-app.id
  acl    = "private"
}

resource "aws_s3_object" "s3-obj-lambda-app" {
  bucket = aws_s3_bucket.bucket-lambda-app.bucket
  key    = "handler.js"
  source = "extras/lambda/handler.js"

  etag = filemd5("extras/lambda/handler.js")
}