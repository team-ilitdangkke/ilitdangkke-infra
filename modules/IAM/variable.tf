# 공통 변수
variable "tags" {
  description = "리소스에 추가될 태그 목록"
  type        = map(string)
  default     = {}
}

# Role 관련 변수
variable "create_role" {
  description = "IAM 역할 생성 여부"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "IAM 역할 이름"
  type        = string
  default     = null
}

variable "assume_role_policy" {
  description = "IAM 역할의 신뢰 관계 정책"
  type        = string
  default     = null
}

# User 관련 변수
variable "create_user" {
  description = "IAM 사용자 생성 여부"
  type        = bool
  default     = false
}

variable "user_name" {
  description = "IAM 사용자 이름"
  type        = string
  default     = null
}

variable "create_access_key" {
  description = "IAM 사용자 액세스 키 생성 여부"
  type        = bool
  default     = false
}

# 공통 정책 변수
variable "policy_arns" {
  description = "연결할 IAM 정책 ARN 목록"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "IAM 역할/사용자에 추가할 인라인 정책 맵"
  type        = map(string)
  default     = {}
}
