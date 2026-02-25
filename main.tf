terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  # GITHUB_TOKEN 環境変数から読み込まれます
}

module "my_blog" {
  source                          = "./modules/repository/github"
  name                            = "kuchida1981.github.io"
  description                     = "My personal blog/portfolio"
  visibility                      = "public"
  default_branch                  = "master"
  required_approving_review_count = 0 # 一人開発のため、PR経由を強制しつつ承認は不要に設定
}
