output "github_actions_role_name" {

  description = "GitHub Actions Role Name"

  value = aws_iam_role.github_actions.name
}

output "github_actions_role_arn" {

  description = "GitHub Actions Role ARN"

  value = aws_iam_role.github_actions.arn
}

output "github_oidc_provider_arn" {

  description = "Existing GitHub OIDC Provider"

  value = data.aws_iam_openid_connect_provider.github.arn
}