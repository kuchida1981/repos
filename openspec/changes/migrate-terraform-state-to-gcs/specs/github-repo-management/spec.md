## ADDED Requirements

### Requirement: Remote State Management via GCS
システムは、Terraform の実行状態（State）を安全に共有し、かつ同時実行を防止するために、Google Cloud Storage (GCS) をリモートバックエンドとして使用しなければならない (SHALL)。また、バケットのバージョニングが有効であることを前提とし、不慮のデータ消失から復旧可能でなければならない (SHALL)。

#### Scenario: Verify GCS backend configuration
- **WHEN** `terraform init` を実行する
- **THEN** バックエンドとして `gcs` が正しく構成され、指定されたバケット `terraform-state-kuchida1981` に接続される

#### Scenario: State Locking enforcement
- **WHEN** 同時に複数のプロセスから `terraform apply` を試みる
- **THEN** GCS バックエンドによりステートロックが機能し、二重実行が防止される
