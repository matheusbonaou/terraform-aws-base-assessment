resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]
  enabled_policy_types = [
    "BACKUP_POLICY",
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY",
  ]

  feature_set = "ALL"
}

resource "aws_organizations_account" "aws_env_account" {
  name  = "${var.environment}-account"
  email = var.aws_org_env_email

  tags = {
    "Name" = "${var.environment}-account"
    "Environment" = "${var.environment}"
  }
}