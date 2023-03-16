
resource "aws_backup_vault" "example-backup-vault" {
  name = "backup-vault-1"
  tags = {
    Project = var.project
    Role    = "backup-vault"
  }
}

resource "aws_backup_plan" "ec2-backup-plan" {
  name = "ec2-backup-plan"

  rule {
    rule_name         = "weekdays-every-2-hours-${local.backups.retention}-day-retention"
    target_vault_name = aws_backup_vault.backup_vault.name
    schedule          = local.backups.schedule
    start_window      = 60
    completion_window = 300

    lifecycle {
      delete_after = local.backups.retention
    }

    recovery_point_tags = {
      Project = var.project
      Role    = "backup"
      Creator = "aws-backups"
    }
  }

  tags = {
    Project = var.project
    Role    = "backup"
  }
}

resource "aws_backup_selection" "example-server-backup-selection" {
  iam_role_arn = aws_iam_role.aws-backup-service-role.arn
  name         = "${local.name}-ec2-server-resources"
  plan_id      = aws_backup_plan.ec2-backup-plan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "true"
  }
}