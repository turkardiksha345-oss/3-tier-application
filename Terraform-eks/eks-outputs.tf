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
