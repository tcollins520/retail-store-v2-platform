# ------------------------------------------------------------------------------
# IAM Policy for the Orders microservice
#
# Grants read-only access to the PostgreSQL credentials stored in
# AWS Secrets Manager.
# ------------------------------------------------------------------------------

resource "aws_iam_policy" "orders_secretsmanager_policy" {

  name = "${var.environment}-orders-secretsmanager-policy"

  description = "Allows the Orders microservice to retrieve PostgreSQL credentials from AWS Secrets Manager."

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "secretsmanager:GetSecretValue",

          "secretsmanager:DescribeSecret"

        ]

        Resource = aws_db_instance.orders_postgresql.master_user_secret[0].secret_arn

      }

    ]

  })

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-orders-secretsmanager-policy"
    }
  )

}