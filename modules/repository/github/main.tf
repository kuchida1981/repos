resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility

  # Standard settings
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  delete_branch_on_merge = true
  
  allow_squash_merge     = true
  allow_rebase_merge     = false
  allow_merge_commit     = false

  dynamic "pages" {
    for_each = var.pages != null ? [var.pages] : []
    content {
      source {
        branch = pages.value.branch
        path   = pages.value.path
      }
    }
  }

  lifecycle {
    ignore_changes = [
      pages,
    ]
  }
}

output "repo_id" {
  value = github_repository.this.node_id
}

output "repo_full_name" {
  value = github_repository.this.full_name
}
