## ADDED Requirements

### Requirement: Repository Initialization and Standard Configuration
システムは、Terraformを使用してGitHubリポジトリを作成または管理下に置くことができ、かつ標準的な基本設定（Issue有効、Wiki無効、マージ後ブランチ削除等）を適用しなければならない (SHALL)。

#### Scenario: Apply standard basic settings
- **WHEN** Terraformモジュールを使用してリポジトリを定義し、applyを実行する
- **THEN** 対象のリポジトリで Issue が有効、Wiki が無効、マージ後のソースブランチ自動削除が有効になる

### Requirement: Branch Protection for Main Branch
システムは、`main`（または指定されたデフォルト）ブランチに対して、直接Pushを禁止し、かつプルリクエスト（PR）を必須とする保護ルールを適用しなければならない (SHALL)。

#### Scenario: Enforce PR for main branch
- **WHEN** 保護ルールが適用されたリポジトリの `main` ブランチに直接 Push を試みる
- **THEN** GitHub 側で Push が拒否され、PR 経由での変更が要求される

### Requirement: Mandatory Review Policy
システムは、プルリクエストにおいて少なくとも1つの承認（Approve）を必須とする設定を、管理者を含む全ユーザーに対して適用しなければならない (SHALL)。

#### Scenario: Block merge without approval
- **WHEN** 承認が得られていないプルリクエストを `main` ブランチにマージしようとする
- **THEN** マージボタンがロックされ、必要な承認数に達していない旨が表示される

### Requirement: Existing Repository Import
システムは、既存の GitHub リポジトリを、その現在の設定を壊すことなく Terraform の管理状態（State）に取り込めなければならない (SHALL)。

#### Scenario: Successful import of existing repository
- **WHEN** `import` ブロックを使用して既存リポジトリを指定し、`terraform plan` を実行する
- **THEN** 既存のリソースが正常に検出され、コード上の定義との差分が正しく表示される
