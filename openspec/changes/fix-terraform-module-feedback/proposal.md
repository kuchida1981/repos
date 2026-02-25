## Why

GitHubリポジトリ管理モジュールに対するGemini Code Assistからのフィードバックを反映し、モジュールの堅牢性、保守性、および再利用性を向上させるため。現状のデッドコードの削除やバリデーションの追加により、より安全で柔軟なリポジトリ管理を実現します。

## What Changes

- **修正**: `modules/repository/github/main.tf` において、`pages` 設定を `dynamic` ブロックで実装し、変数と同期させます。
- **削除**: ルートの `variables.tf` から、未使用かつ混乱を招く `github_token` 変数を削除します。
- **機能強化**: リポジトリの基本設定（`has_issues`, `has_projects`, `has_wiki`）をハードコードから変数へと変更し、カスタマイズ可能にします。
- **バリデーション**: `visibility` 変数に対して、許可された値（`public`, `private`, `internal`）のみを受け付けるバリデーションを追加します。

## Capabilities

### New Capabilities
<!-- なし -->

### Modified Capabilities
- `github-repo-management`: リポジトリ設定の柔軟な制御、バリデーションの強化、および Pages 設定の統合。

## Impact

- `variables.tf` (ルート): 未使用変数の削除。
- `modules/repository/github/main.tf`: 動的ブロックの実装と設定の変数化。
- `modules/repository/github/variables.tf`: 新規変数の追加とバリデーションの実装。
