variable "tfc_workspace_name" {
  type        = string
  default     = "my-aws-workspace"
  description = "The name of the workspace that you'd like to create and connect to AWS"
}

variable "tfc_project_id" {
  type        = string
  description = "The id of your Terraform Cloud project"
}

variable "tfc_organization_name" {
  type = string
  description = "The name of your Terraform Cloud organization"
}

variable "tfc_aws_role_arn" {
  type = string
  description = "The arn of your Terraform Cloud aws role arn"
}

variable "tfc_workspace_auto_apply" {
  type = bool
  default     = "false"
  description = "Whether to automatically apply changes when a Terraform plan is successful"
}
