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
  description = "The visibility of the repository (public, private, or internal)"
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "The visibility must be one of: public, private, internal."
  }
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

variable "has_issues" {
  description = "Set to true to enable the GitHub Issues features on the repository"
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Set to true to enable the GitHub Projects features on the repository"
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Set to true to enable the GitHub Wiki features on the repository"
  type        = bool
  default     = false
}

variable "pages" {
  description = "The repository's GitHub Pages configuration"
  type = object({
    branch = string
    path   = string
  })
  default = null
}
