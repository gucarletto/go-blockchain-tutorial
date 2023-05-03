resource "aws_lambda_function" "go_blockchain" {
  function_name = "go_blockchain"
  runtime = "go1.x"
  handler = "main"
  timeout = 10
  memory_size = 128

  environment = {
    variables = {
      PORT = 8080
    }
  }
}

resource "aws_iam_role" "lambda" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
      },
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    ]
  })
}