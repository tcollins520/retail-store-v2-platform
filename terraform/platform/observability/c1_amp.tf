# Amazon Managed Service for Prometheus Workspace
resource "aws_prometheus_workspace" "amp" {
  alias = "${local.cluster_name}-amp"

  tags = var.tags
}
