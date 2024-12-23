output "role_arn" {
  description = "생성된 IAM 역할 ARN"
  value       = var.create_role ? aws_iam_role.this[0].arn : null
}

output "role_name" {
  description = "생성된 IAM 역할 이름"
  value       = var.create_role ? aws_iam_role.this[0].name : null
}

output "access_key_id" {
  description = "생성된 액세스 키 ID"
  value       = var.create_user && var.create_access_key ? aws_iam_access_key.this[0].id : null
}

output "secret_access_key" {
  description = "생성된 시크릿 액세스 키"
  value       = var.create_user && var.create_access_key ? aws_iam_access_key.this[0].secret : null
  sensitive   = true
}

output "user_arn" {
  description = "생성된 IAM 사용자 ARN"
  value       = var.create_user ? aws_iam_user.this[0].arn : null
}
