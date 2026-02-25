## 1. プロジェクトの初期設定

- [x] 1.1 Terraformプロバイダー設定（`main.tf`, `variables.tf`）の作成
- [x] 1.2 `.gitignore` の設定（`.terraform`, `*.tfstate`, `.env` 等の除外）
- [x] 1.3 `terraform init` の実行と初期化の確認

## 2. 共通モジュールの作成

- [x] 2.1 `modules/repository` ディレクトリ構造の作成
- [x] 2.2 リポジトリ基本設定（Issue, Wiki, ブランチ削除等）の実装
- [x] 2.3 `main` ブランチ保護ルール（PR必須, 直接Push禁止）の実装
- [x] 2.4 モジュールの変数（`name`, `visibility`, `required_reviews` 等）の定義

## 3. 既存リポジトリのインポート

- [x] 3.1 対象リポジトリを `main.tf` でモジュール呼び出しとして定義
- [x] 3.2 `import.tf` を作成し、既存リポジトリとブランチ保護ルールの紐付けを記述
- [x] 3.3 `terraform plan` を実行し、既存設定の検出とインポート準備を確認
- [x] 3.4 `terraform apply` を実行し、インポートを完了させる

## 4. 標準設定の適用と検証

- [x] 4.1 インポート後の `terraform plan` で、標準設定との差分がない（または意図した変更のみである）ことを確認
- [x] 4.2 GitHub 上で対象リポジトリの設定（PR必須化等）が正しく反映されているか目視で確認
- [x] 4.3 不要になった `import.tf` の整理またはコメントアウト
