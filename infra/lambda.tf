resource "aws_lambda_function" "go_blockchain" {
  function_name = "go_blockchain"
  runtime = "go1.x"
  handler = "main"
  timeout = 10
  memory_size = 128
  role = "${aws_iam_role.lambda.arn}"
}

resource "aws_iam_role" "lambda" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action: "sts:AssumeRole",
        Principal: {
          Service: "lambda.amazonaws.com"
        },
        Effect: "Allow",
        Sid: ""
      }
    ]
  })
}