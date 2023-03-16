# Backup KMS key
resource "aws_kms_key" "backup_key" {
  description             = "Backup KMS key"
  deletion_window_in_days = 10
}

# Backup Vault
resource "aws_backup_vault" "backup_vault" {
  name        = "${local.name}-ebs-backup-vault"
  kms_key_arn = aws_kms_key.backup_key.arn
}

# Backup IAM Policy
# data "aws_iam_policy_document" "backup" {
#   statement {
#     actions = ["sts:AssumeRole"]
#     effect  = "Allow"
#     principals {
#       type        = "Service"
#       identifiers = ["backup.amazonaws.com"]
#     }
#   }
# version = "2012-10-17"
# }
# data "aws_iam_policy" "backup" {
#   name = "AWSBackupServiceRolePolicyForBackup"
# }
# resource "aws_iam_role" "backup" {
#   name               = "backup_iam_role"
#   assume_role_policy = data.aws_iam_policy_document.backup.json
# }
# resource "aws_iam_role_policy_attachment" "backup" {
#   policy_arn = data.aws_iam_policy.backup.arn
#   role       = aws_iam_role.backup.name
# }