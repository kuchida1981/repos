## Why

現在、GitHubのリポジトリ設定（ブランチ保護、マージ戦略、Issueの有効無効など）が手動で行われており、リポジトリ間での設定のばらつきや設定漏れが発生しやすい状態にあります。これをTerraformによるIaC（Infrastructure as Code）管理下に置くことで、設定の標準化と一貫性を確保し、運用の手間を削減します。

## What Changes

- GitHubプロバイダーを用いたTerraformプロジェクトの初期構成。
- リポジトリの標準設定（PR必須、直接Push禁止、マージ後のブランチ自動削除など）をカプセル化した共通モジュールの作成。
- 既存のアクティブなリポジトリをTerraformの管理下に取り込み（Import）、標準設定を適用。
- 将来的なGitLab等の他プラットフォーム対応を見据えたディレクトリ構造の準備。

## Capabilities

### New Capabilities
- `github-repo-management`: GitHubリポジトリの作成、設定、およびブランチ保護ルールを共通モジュール経由で管理する機能。

### Modified Capabilities
<!-- なし -->

## Impact

- GitHubリポジトリの設定（`main`ブランチへのPush制限、PRレビュー必須化、マージ後のブランチ削除設定などが自動的に更新されます）。
- TerraformのStateファイル（初期はローカル管理）。
