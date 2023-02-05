variable "tfc_workspace_name" {
  type        = string
  default     = "my-aws-workspace"
  description = "The name of the workspace that you'd like to create and connect to AWS"
}

variable "tfc_project_name" {
  type        = string
  default     = "Default Project"
  description = "The project under which a workspace will be created"
}

variable "tfc_organization_name" {
  type = string
  description = "The name of your Terraform Cloud organization"
}

variable "iam_oidc_tfc_provider_arn" {
  type = string
  description = "The arn of your IAM oidc provider"
}

variable "iam_oidc_tfc_provider_client_id" {
  type = string
  description = "The id of your IAM oidc provider clinet"
}

variable "tfc_iam_role_name" {
  type = string
  description = "The name of your Terraform Cloud IAM Role"
}