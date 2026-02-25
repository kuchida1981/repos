## 1. Google Cloud 側の準備 (完了済み)

- [x] 1.1 GCS バケット `terraform-state-kuchida1981` を作成する (ユーザー作業)
- [x] 1.2 バケットのバージョニングを有効にする (ユーザー作業)
- [x] 1.3 Terraform 実行環境で Google Cloud 認証を完了する (ユーザー作業)

## 2. Terraform 設定の変更 (完了済み)

- [x] 2.1 `main.tf` に `backend "gcs"` ブロックを追加し、バケット名 `terraform-state-kuchida1981` とプレフィックス `terraform/state` を設定する
- [x] 2.2 `terraform init -migrate-state` を実行し、既存のステートをリモートへ移行する

## 3. 完了確認 (完了済み)

- [x] 3.1 `terraform state list` を実行し、リソースが正しく認識されているか確認する
- [x] 3.2 ローカルの `terraform.tfstate` が不要であることを確認し、バックアップした後に削除する (任意)
- [x] 3.3 GCS バケットに `terraform/state/default.tfstate` が存在することを確認する
