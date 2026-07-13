# ------------------------------------------------------------------------------
# Reference the Remote State from the EKS Project
# Bootstrap platform components consume outputs from the EKS cluster.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "eks" {

  backend = "s3"

  config = {
    bucket = "tfstate-prod-us-east-1-h168du"
    key    = "eks/prod/terraform.tfstate"
    region = var.aws_region
  }

}

# ------------------------------------------------------------------------------
# Reference the Remote State from the VPC Project
#
# Used to retrieve:
# - VPC ID
# - Private Subnets
# - Public Subnets
#
# Some platform components (such as the AWS Load Balancer Controller)
# require information about the underlying VPC.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "vpc" {

  backend = "s3"

  config = {
    bucket = "tfstate-prod-us-east-1-h168du"
    key    = "vpc/prod/terraform.tfstate"
    region = var.aws_region
  }

}

# ------------------------------------------------------------------------------
# Retrieve an authentication token for the EKS cluster
# ------------------------------------------------------------------------------

data "aws_eks_cluster_auth" "eks" {

  name = data.terraform_remote_state.eks.outputs.eks_cluster_name

}

# ------------------------------------------------------------------------------
# Retrieve the current AWS account information
# ------------------------------------------------------------------------------

data "aws_caller_identity" "current" {}