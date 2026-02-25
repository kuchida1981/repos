## Why

Terraform のステート管理をローカルファイルから Google Cloud Storage (GCS) へ移行することで、ステートの耐久性、共有性、および同時実行時の整合性（ステートロック）を確保します。これにより、将来的な CI/CD 導入や複数環境からの安全な管理が可能になります。

## What Changes

- Terraform バックエンドをローカルから `gcs` に変更します。
- GCS バケット `terraform-state-kuchida1981` をステート保存先として使用します。
- `terraform init -migrate-state` を実行し、既存のステートをリモートへ移行します。

## Capabilities

### New Capabilities
<!-- なし -->

### Modified Capabilities
- `github-repo-management`: ステート管理の信頼性と共有性の要件を、リモートバックエンド（GCS）による管理に更新します。

## Impact

- `main.tf` の `terraform` ブロックに `backend "gcs"` が追加されます。
- `terraform.tfstate` ローカルファイルが不要になります。
- 実行環境に Google Cloud への認証権限（Application Default Credentials）が必要になります。
