provider "tfe" {
  hostname = var.tfc_hostname
}

resource "tfe_project" "this" {
  name         = var.tfc_project_name
  organization = var.tfc_organization_name
}

module "stg_tfc_workspace" {
  source                = "../../module/tfc-workspace"
  tfc_workspace_name    = "multi-env-demo-stg"
  tfc_project_id        = tfe_project.this.id
  tfc_aws_role_arn      = module.prd_tfc_iam_role.arn
  tfc_organization_name = var.tfc_organization_name
  # STGは自動apply
  tfc_workspace_auto_apply = true
}

module "prd_tfc_workspace" {
  source                = "../../module/tfc-workspace"
  tfc_workspace_name    = "multi-env-demo-prd"
  tfc_project_id        = tfe_project.this.id
  tfc_aws_role_arn      = module.prd_tfc_iam_role.arn
  tfc_organization_name = var.tfc_organization_name
}
