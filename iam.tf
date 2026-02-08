#
# overtake administrator
#

## (1)
resource "aws_iam_role" "atlantis_overtake_admin" {
  name = "atlantis-overtake-admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id.id}:root" # 1. 계정 전체를 신뢰 (순환 참조 회피)
        }
        Action = "sts:AssumeRole"
        Condition = {
          StringLike = {
            # 2. 조건문으로 역할을 후검증 (보안 유지)
            "aws:PrincipalArn" : "arn:aws:iam::${var.account_id.id}:role/*ecs_task_execution"
          }
        }
      }
    ]
  })
}
## end of (1)

resource "aws_iam_role_policy" "atlantis_overtake_admin" {
  name = "atlantis-overtake-admin-passrole"
  role = aws_iam_role.atlantis_overtake_admin.id

  policy = jsonencode({
    "Statement" : [
      {
        "Sid" : "AllowIAMPassRole",
        "Action" : [
          "iam:PassRole"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "atlantis_overtake_admin" {
  role       = aws_iam_role.atlantis_overtake_admin.id
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy_document" "atlantis_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    resources = [
      aws_iam_role.atlantis_overtake_admin.arn
    ]
  }
}

resource "aws_iam_role_policy" "atlantis_assume_role" {
  name   = "atlantis-assume-role"
  role   = aws_iam_role.ecs_task_execution.id
  policy = data.aws_iam_policy_document.atlantis_assume_role.json
}
