# --- PIPELINE REQUIRED OUTPUTS ---
output "albc_iam_role_arn" {
  description = "IAM Role ARN for AWS Load Balancer Controller"
  value       = module.albc_irsa_role.iam_role_arn
}

output "karpenter_iam_role_arn" {
  description = "IAM Role ARN for Karpenter Controller"
  value       = module.karpenter.iam_role_arn
}

output "karpenter_queue_name" {
  description = "SQS Queue Name for Karpenter Node Interruption"
  value       = module.karpenter.queue_name
}

# --- INFRASTRUCTURE OBSERVABILITY OUTPUTS ---
output "eks_cluster_name" {
  description = "The strongly typed name of the EKS Cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider"
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "eks_node_group_arn" {
  description = "ARN of the default managed EKS Node Group currently running"
  value       = aws_eks_node_group.eks_node_group.arn
}

output "eks_node_role_arn" {
  description = "IAM Role ARN assigned to EKS Managed Nodes"
  value       = aws_iam_role.eks_node_role.arn
}

output "karpenter_node_role_name" {
  description = "IAM Role utilized by Karpenter to provision new EC2 instances dynamically"
  value       = module.karpenter.node_iam_role_name
}
