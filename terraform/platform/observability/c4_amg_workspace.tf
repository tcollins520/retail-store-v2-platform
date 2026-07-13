# AMAZON MANAGED GRAFANA WORKSPACE
resource "aws_grafana_workspace" "grafana" {
  name                     = "${local.cluster_name}-grafana"
  description              = "Retail Store v2 Platform Observability"
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["AWS_SSO"] # AWS Identity Center
  permission_type          = "CUSTOMER_MANAGED"
  role_arn                 = aws_iam_role.amg_iam_role.arn

  # Data sources that Grafana can query
  data_sources = ["PROMETHEUS", "CLOUDWATCH", "XRAY"]

  # Notification destinations
  notification_destinations = ["SNS"]

  # Network access: Open (as of not VPC-restricted)
  # For VPC access, add vpc_configuration block

  # Workspace configuration
  configuration = jsonencode({
    plugins = {
      pluginAdminEnabled = true
    }
    unifiedAlerting = {
      enabled = true
    }
  })
  tags = var.tags
}


