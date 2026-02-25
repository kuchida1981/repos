## 1. モジュール変数の修正

- [x] 1.1 `modules/repository/github/variables.tf` に `has_issues`, `has_projects`, `has_wiki` 変数を追加（デフォルト値を設定）
- [x] 1.2 `modules/repository/github/variables.tf` の `visibility` 変数に `validation` ブロックを追加

## 2. モジュールリソースの修正

- [x] 2.1 `modules/repository/github/main.tf` に `dynamic "pages"` ブロックを実装
- [x] 2.2 `modules/repository/github/main.tf` のハードコード設定（Issues, Projects, Wiki）を変数参照に置き換え

## 3. ルート設定のクリーンアップ

- [x] 3.1 ルートの `variables.tf` から未使用の `github_token` 変数を削除

## 4. 検証とテスト

- [x] 4.1 `terraform plan` を実行し、既存リポジトリの設定に意図しない変更（ドリフト）が発生していないことを確認
- [x] 4.2 `main.tf` で `visibility = "invalid"` を指定し、`terraform plan` がバリデーションエラーで失敗することを確認
- [x] 4.3 修正内容を PR に反映（プッシュ）
