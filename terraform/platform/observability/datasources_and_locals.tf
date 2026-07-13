locals {
  owners      = var.business_division
  environment = var.environment_name

  name = "${local.owners}-${local.environment}"

  cluster_name = var.cluster_name

  account_id = data.aws_caller_identity.current.account_id
}