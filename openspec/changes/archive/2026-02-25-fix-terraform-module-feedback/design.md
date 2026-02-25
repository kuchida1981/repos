## Context

PR レビューにおいて Gemini Code Assist から指摘された、Terraform モジュールの設計上の不備（未使用変数、不十分な抽象化、バリデーションの欠如）を修正します。これにより、モジュールの堅牢性と再利用性を向上させ、将来の拡張を容易にします。

## Goals / Non-Goals

**Goals:**
- `pages` 変数を `main.tf` で動的ブロックとして実装し、GitHub Pages の管理を可能にする。
- ルートの `variables.tf` から未使用のデッドコード（`github_token`）を削除する。
- ハードコードされているリポジトリの機能フラグ（Issues, Projects, Wiki）を変数化する。
- `visibility` 変数にバリデーションを追加し、誤った設定を未然に防ぐ。

**Non-Goals:**
- 新しい GitHub プロバイダー機能の追加。
- 既存の `kuchida1981.github.io` リポジトリの現在の運用設定（Actions等）を変更すること。

## Decisions

### 1. `dynamic "pages"` ブロックの実装
**決定:** `modules/repository/github/main.tf` において、`pages` 変数に基づいた `dynamic` ブロックを実装する。
**理由:** これまで変数は定義されていたが実装が漏れていたため。併せて `lifecycle { ignore_changes = [pages] }` を維持することで、Terraform による初期設定は行いつつ、その後の GitHub Actions 等による自動更新を許容する。

### 2. リポジトリ設定の変数化
**決定:** `has_issues`, `has_projects`, `has_wiki` を `modules/repository/github/variables.tf` で定義し、デフォルト値を現在の標準値（`true`, `false`, `false`）に設定する。
**理由:** 特定のリポジトリで Wiki や Projects を使いたい場合に対応できるようにするため。

### 3. `visibility` のバリデーション追加
**決定:** `contains` 関数を使用した `validation` ブロックを `visibility` 変数に追加する。
**理由:** GitHub が受け付ける値（`public`, `private`, `internal`）以外が指定された場合、`terraform plan` の段階でエラーとして検出できるようにするため。

## Risks / Trade-offs

- **[Risk] 既存設定への影響**: 設定の変数化により、意図せず既存リポジトリの設定（Wikiの有効化など）が変更される可能性がある。
  - **Mitigation**: 現在の実装と同じ値を `default` に設定し、`terraform plan` で差分が出ないことを確認する。
- **[Trade-off] バリデーションによる制限**: 将来的に GitHub が新しい `visibility` の値（例: `confidential` 等）を導入した場合、Terraform モジュール側のバリデーションも更新が必要になる。
  - **Rationale**: 頻繁に変わる値ではないため、安全性を優先する。
