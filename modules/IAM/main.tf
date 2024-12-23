resource "aws_iam_role" "this" {
  count = var.create_role ? 1 : 0
  name = var.role_name
  assume_role_policy = var.assume_role_policy
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  count = var.create_role ? length(var.policy_arns) : 0
  
  role       = aws_iam_role.this[0].name
  policy_arn = var.policy_arns[count.index]
}

resource "aws_iam_role_policy" "inline" {
  for_each = var.create_role ? var.inline_policies : {}

  name   = each.key
  role   = aws_iam_role.this[0].id
  policy = each.value
}

resource "aws_iam_user" "this" {
  count = var.create_user ? 1 : 0
  
  name = var.user_name
  tags = var.tags
}

resource "aws_iam_user_policy_attachment" "user_policy" {
  count = var.create_user ? length(var.policy_arns) : 0
  
  user       = aws_iam_user.this[0].name
  policy_arn = var.policy_arns[count.index]
}

resource "aws_iam_user_policy" "inline" {
  for_each = var.create_user ? var.inline_policies : {}

  name   = each.key
  user   = aws_iam_user.this[0].name
  policy = each.value
}

resource "aws_iam_access_key" "this" {
  count = var.create_user && var.create_access_key ? 1 : 0
  
  user = aws_iam_user.this[0].name
}
