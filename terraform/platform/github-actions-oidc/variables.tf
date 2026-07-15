variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "github_repository" {
  description = "GitHub repository allowed to assume this role"
  type        = string
  default     = "tcollins520/retail-store-v2-platform-engineering"
}

variable "github_branch" {
  description = "GitHub branch allowed to assume this role"
  type        = string
  default     = "main"
}

variable "tags" {
  description = "Common tags"

  type = map(string)

  default = {
    Terraform   = "true"
    Project     = "retail-store-v2"
    Environment = "production"
  }
}