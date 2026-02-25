variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
  default     = ""
}

variable "visibility" {
  description = "The visibility of the repository (public or private)"
  type        = string
  default     = "private"
}

variable "default_branch" {
  description = "The default branch name"
  type        = string
  default     = "master"
}

variable "required_approving_review_count" {
  description = "Number of required reviews for PRs"
  type        = number
  default     = 1
}

variable "enforce_admins" {
  description = "Enforce branch protection for admins"
  type        = bool
  default     = true
}

variable "pages" {
  description = "The repository's GitHub Pages configuration"
  type = object({
    branch = string
    path   = string
  })
  default = null
}
