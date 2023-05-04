data "archive_file" "archive-lambda" {
  type        = "zip"
  output_path = "./go-blockchain.zip"
  source_dir  = "src"
}

resource "aws_lambda_function" "go_blockchain" {
  function_name = "go_blockchain"
  runtime = "go1.x"
  handler = "main"
  timeout = 10
  memory_size = 128
  filename = data.archive_file.archive-lambda.output_path
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