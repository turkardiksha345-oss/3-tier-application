module "karpenter" {
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "~> 20.8"

  cluster_name = aws_eks_cluster.eks_cluster.name

  enable_v1_permissions = true

  enable_pod_identity             = false
  create_pod_identity_association = false

  enable_irsa                     = true
  irsa_oidc_provider_arn          = aws_iam_openid_connect_provider.eks.arn
  irsa_namespace_service_accounts = ["kube-system:karpenter"]

  create_access_entry = true

  node_iam_role_name = "${var.cluster_name}-karpenter-node"
}



resource "aws_ec2_tag" "karpenter_subnets" {
  for_each    = toset(data.aws_subnets.default_subnets.ids)
  resource_id = each.value
  key         = "karpenter.sh/discovery"
  value       = var.cluster_name
}

resource "aws_ec2_tag" "karpenter_sg" {
  resource_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  key         = "karpenter.sh/discovery"
  value       = var.cluster_name
}
