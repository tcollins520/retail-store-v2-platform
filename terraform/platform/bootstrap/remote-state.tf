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

