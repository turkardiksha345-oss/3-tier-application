module "albc_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.39"

  role_name                              = "${var.cluster_name}-albc-role"
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = aws_iam_openid_connect_provider.eks.arn
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }
}

resource "aws_ec2_tag" "albc_subnets" {
  for_each    = toset(data.aws_subnets.default_subnets.ids)
  resource_id = each.value
  key         = "kubernetes.io/role/elb"
  value       = "1"
}
