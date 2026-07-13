# Output for use in collectors
output "amp_workspace_id" {
  description = "AMP Workspace ID"
  value       = aws_prometheus_workspace.amp.id
}

output "amp_endpoint" {
  description = "AMP Remote Write Endpoint"
  value       = "${aws_prometheus_workspace.amp.prometheus_endpoint}api/v1/remote_write"
}

output "amp_query_endpoint" {
  description = "AMP Query Endpoint"
  value       = "${aws_prometheus_workspace.amp.prometheus_endpoint}api/v1/query"
}

# IAM Role
output "amg_iam_role_arn" {
  description = "ARN of the AMG IAM role"
  value       = aws_iam_role.amg_iam_role.arn
}

output "amg_iam_role_name" {
  description = "Name of the AMG service role"
  value       = aws_iam_role.amg_iam_role.name
}

# AMG Workspace
output "amg_workspace_id" {
  description = "ID of the Grafana workspace"
  value       = aws_grafana_workspace.grafana.id
}

output "amg_workspace_arn" {
  description = "ARN of the Grafana workspace"
  value       = aws_grafana_workspace.grafana.arn
}

output "amg_workspace_endpoint" {
  description = "Endpoint URL for the Grafana workspace"
  value       = aws_grafana_workspace.grafana.endpoint
}


output "amg_workspace_url" {
  description = "Full URL to access Grafana workspace"
  value       = "https://${aws_grafana_workspace.grafana.endpoint}"
}

# ADOT Collector Outputs
output "adot_collector_role_arn" {
  description = "IAM Role ARN for ADOT Collector"
  value       = aws_iam_role.adot_collector.arn
}

# ADOT EKS Addon Outputs
output "adot_addon_id" {
  description = "ADOT EKS Addon ID"
  value       = aws_eks_addon.adot.id
}

output "adot_addon_version" {
  description = "ADOT EKS Addon Version"
  value       = aws_eks_addon.adot.addon_version
}



# prometheus_node_exporter EKS Addon Outputs
output "prometheus_node_exporter_addon_id" {
  description = "Prometheus Node Exporter EKS Addon ID"
  value       = aws_eks_addon.prometheus_node_exporter.id
}

output "prometheus_node_exporter_addon_version" {
  description = "Prometheus Node Exporter EKS Addon Version"
  value       = aws_eks_addon.prometheus_node_exporter.addon_version
}


# kube_state_metrics EKS Addon Outputs
output "kube_state_metrics_addon_id" {
  description = "Kube State Metrics EKS Addon ID"
  value       = aws_eks_addon.kube_state_metrics.id
}

output "kube_state_metrics_version" {
  description = "Kube State Metrics EKS Addon Version"
  value       = aws_eks_addon.kube_state_metrics.addon_version
}
