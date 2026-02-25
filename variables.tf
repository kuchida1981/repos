variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
  default     = null # 環境変数 GITHUB_TOKEN があれば不要
}
