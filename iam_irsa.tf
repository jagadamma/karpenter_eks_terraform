module "iam_assumable_role_karpenter" {
 #aws_iam_role.karpenter_controller.arn
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.7.0"
  create_role                   = true
  role_name                     = "karpenter-controller-assumable-role"
  provider_url                  = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  oidc_fully_qualified_subjects = ["system:serviceaccount:karpenter:karpenter"]
}
resource "aws_iam_instance_profile" "karpenter" {
  name = "KarpenterNodeInstanceProfile"
  role =  aws_iam_role.iam-role-eks-cluster.name
}
resource "aws_iam_role_policy" "karpenter_controller" {
  name = "karpenter-policy-controller"
  role = module.iam_assumable_role_karpenter.iam_role_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:CreateLaunchTemplate",
          "ec2:CreateFleet",
          "ec2:RunInstances",
          "ec2:CreateTags",
          "iam:PassRole",
          "ec2:TerminateInstances",
          "ec2:DescribeLaunchTemplates",
          "ec2:DescribeInstances",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeInstanceTypeOfferings",
          "ec2:DescribeAvailabilityZones",
          "ssm:GetParameter"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
