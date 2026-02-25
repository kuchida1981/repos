## MODIFIED Requirements

### Requirement: Repository Initialization and Standard Configuration
システムは、Terraformを使用してGitHubリポジトリを作成または管理下に置くことができ、かつ標準的な基本設定（Issue有効、Wiki無効、マージ後ブランチ削除等）を適用しなければならない (SHALL)。これらの設定（`has_issues`, `has_projects`, `has_wiki`）は個別にカスタマイズ可能であり、かつ GitHub Pages の設定も動的に統合できなければならない (SHALL)。

#### Scenario: Apply customized basic settings
- **WHEN** Terraformモジュールで `has_wiki = true` を設定して apply を実行する
- **THEN** 対象のリポジトリで Wiki が有効になる

#### Scenario: Synchronize Pages configuration
- **WHEN** モジュールで `pages` 設定を定義し、apply を実行する
- **THEN** GitHub 側の Pages 設定が更新され、かつその後の GitHub 側での手動変更（Actions等）が Terraform の `plan` で `ignore_changes` により無視される

## ADDED Requirements

### Requirement: Input Validation for Visibility
システムは、リポジトリの公開範囲（Visibility）に対して、許可された値（public, private, internal）のみを受け付け、それ以外の値が設定された場合は実行前にエラーを返さなければならない (SHALL)。

#### Scenario: Block invalid visibility
- **WHEN** `visibility` に `secret` などの不正な値を設定して `terraform plan` を実行する
- **THEN** Terraform がバリデーションエラーを返し、実行を停止する
