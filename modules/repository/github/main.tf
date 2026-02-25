resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility

  # Standard settings
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  delete_branch_on_merge = true
  
  allow_squash_merge     = true
  allow_rebase_merge     = false
  allow_merge_commit     = false

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
