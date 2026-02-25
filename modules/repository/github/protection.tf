resource "github_branch_protection" "this" {
  repository_id = github_repository.this.node_id
  pattern       = var.default_branch

  enforce_admins = var.enforce_admins

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = var.required_approving_review_count
  }
}
