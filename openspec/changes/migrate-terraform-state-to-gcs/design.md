## Context

現在、Terraform のステート管理はローカルファイル (`terraform.tfstate`) で行われています。
一人の開発者の環境に依存しており、紛失や破損のリスク、および将来的な自動化への障壁となっています。

## Goals / Non-Goals

**Goals:**
- Terraform ステートを Google Cloud Storage (GCS) に安全に移行する。
- GCS の機能を活用したバージョニングとステートロックを有効にする。
- プロジェクトのリソース定義（`main.tf`）を新しいバックエンド設定で更新する。

**Non-Goals:**
- ステート移行以外の GitHub リポジトリ構成（モジュール等）の変更は行わない。
- GCS バケット自体の作成（ユーザーにより完了済み）。

## Decisions

- **Decision 1: Use GCS Backend**: 既存の GCP 環境を活用し、ネイティブなステートロックとバージョニングをサポートする GCS を選択しました。
- **Decision 2: Region Selection**: `asia-northeast1` (東京) を使用し、地理的な近接性とレイテンシを最適化します。
- **Decision 3: Prefix Strategy**: `terraform/state` をプレフィックスとして使用し、バケット内での整理を容易にします。

## Risks / Trade-offs

- **[Risk] Migration Failure**: ステート移行中にネットワークや認証エラーが発生し、ステートが不整合になる可能性がある。
  - **Mitigation**: `terraform init -migrate-state` を慎重に実行し、事前にローカルステートのバックアップを確保する。
- **[Trade-off] Extra Dependency**: Google Cloud への依存が発生し、認証（ADC）が必要になる。
  - **Mitigation**: すでに GCP プロジェクトと認証環境があるため、最小限のインパクトで導入可能。
