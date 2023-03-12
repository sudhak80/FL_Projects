# Backup Plan Creation
resource "aws_backup_plan" "plan" {
  name = "aws-backup-plan"
rule {
    rule_name         = "nightly"
    target_vault_name = aws_backup_vault.backup_vault.name
    schedule          = "cron(0 20 * * ? *)"
    start_window      = 60
    completion_window = 120
lifecycle {
      cold_storage_after = 14
      delete_after       = 365
    }
  }
}

# Backup Resource (EBS) Selection
resource "aws_backup_selection" "this" {
  iam_role_arn = aws_iam_role.backup.arn
  name         = "back-selection"
  plan_id      = aws_backup_plan.plan.id
resources = [
    aws_ebs_volume.this.arn
  ]
}
