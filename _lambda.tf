resource "aws_iam_role" "role-lambda-app" {
  name = "role-lambda-app-${var.environment}"

  assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
            }
        ]
    }
EOF
}

resource "aws_lambda_function" "lambda-function-app" {
  s3_bucket     = aws_s3_bucket.bucket-lambda-app.id
  function_name = "lambda-app-${var.environment}"
  role          = aws_iam_role.role-lambda-app.arn
  handler       = "exports.handler"
  runtime       = "nodejs14.x"
}

resource "aws_lambda_function_url" "lambda-function-url" {
  function_name      = aws_lambda_function.lambda-function-app.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}