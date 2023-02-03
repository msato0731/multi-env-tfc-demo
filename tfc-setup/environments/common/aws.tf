provider "aws" {
}

# TODO: IAMの部分をmodule化
data "tls_certificate" "tfc_certificate" {
  url = "https://${var.tfc_hostname}"
}

resource "aws_iam_openid_connect_provider" "tfc_provider" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = [var.tfc_aws_audience]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}

module "stg_tfc_iam_role" {
  source = "../../module/tfc-iam-role"
  tfc_workspace_name    = "multi-env-demo-stg"
  tfc_iam_role_name = "tfc-stg-role"
  tfc_project_name        = var.tfc_project_name
  tfc_organization_name = var.tfc_organization_name
  iam_oidc_tfc_provider_arn = aws_iam_openid_connect_provider.tfc_provider.arn
  iam_oidc_tfc_provider_client_id = one(aws_iam_openid_connect_provider.tfc_provider.client_id_list)
}

module "prd_tfc_iam_role" {
  source = "../../module/tfc-iam-role"
  tfc_workspace_name    = "multi-env-demo-prd"
  tfc_iam_role_name = "tfc-prd-role"
  tfc_project_name        = var.tfc_project_name
  tfc_organization_name = var.tfc_organization_name
  iam_oidc_tfc_provider_arn = aws_iam_openid_connect_provider.tfc_provider.arn
  iam_oidc_tfc_provider_client_id = one(aws_iam_openid_connect_provider.tfc_provider.client_id_list)
}