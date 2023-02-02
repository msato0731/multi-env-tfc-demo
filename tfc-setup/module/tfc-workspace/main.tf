resource "tfe_workspace" "workspace" {
  name         = var.tfc_workspace_name
  organization = var.tfc_organization_name
  project_id = var.tfc_project_id
}

resource "tfe_variable" "enable_aws_provider_auth" {
  workspace_id = tfe_workspace.workspace.id

  key      = "TFC_AWS_PROVIDER_AUTH"
  value    = "true"
  category = "env"

  description = "Enable the Workload Identity integration for AWS."
}

resource "tfe_variable" "tfc_aws_role_arn" {
  workspace_id = tfe_workspace.workspace.id

  key      = "TFC_AWS_RUN_ROLE_ARN"
  value    = var.tfc_aws_role_arn
  category = "env"

  description = "The AWS role arn runs will use to authenticate."
}
