# GitHub Issue作成ガイド

## 概要
将来的な実装タスクをGitHub Issueとして登録するためのガイドです。

## 方法1: GitHub CLI（推奨）

### 前提条件
GitHub CLIにログインする必要があります：

```bash
gh auth login
```

### Issue作成スクリプトの実行
以下のコマンドでスクリプトを実行してください：

```bash
./scripts/create-issues.sh
```

これにより、以下の5つのIssueが自動的に作成されます：

1. **[Feature] react-dndによるドラッグ&ドロップ機能の実装**
   - ラベル: `enhancement`, `future`
   
2. **[Feature] 服カテゴリーの拡張・変更機能**
   - ラベル: `enhancement`, `future`
   
3. **[Enhancement] 画像最適化とストレージ移行**
   - ラベル: `enhancement`, `performance`, `future`
   
4. **[Feature] 認証機能の実装**
   - ラベル: `enhancement`, `security`, `future`
   
5. **[Feature] Nuqsを使った検索・フィルタリング機能の実装**
   - ラベル: `enhancement`, `future`

## 方法2: 手動でGitHub上で作成

GitHub CLIが使えない場合は、以下の手順で手動で作成してください：

### 手順
1. GitHubリポジトリ（https://github.com/UtakataKyosui/Clothing-Cluster）にアクセス
2. 「Issues」タブをクリック
3. 「New issue」ボタンをクリック
4. 以下のテンプレートファイルの内容をコピー&ペースト：

#### Issue 1: react-dndによるドラッグ&ドロップ機能
- **タイトル**: `[Feature] react-dndによるドラッグ&ドロップ機能の実装`
- **ラベル**: `enhancement`, `future`
- **本文**: [.github/ISSUE_TEMPLATE/react-dnd-implementation.md](file:///Users/taiki.amo/Documents/Clothing-Cluster/.github/ISSUE_TEMPLATE/react-dnd-implementation.md)の内容（YAML frontmatterを除く）

#### Issue 2: 服カテゴリーの拡張・変更機能
- **タイトル**: `[Feature] 服カテゴリーの拡張・変更機能`
- **ラベル**: `enhancement`, `future`
- **本文**: [.github/ISSUE_TEMPLATE/category-extension.md](file:///Users/taiki.amo/Documents/Clothing-Cluster/.github/ISSUE_TEMPLATE/category-extension.md)の内容（YAML frontmatterを除く）

#### Issue 3: 画像最適化とストレージ移行
- **タイトル**: `[Enhancement] 画像最適化とストレージ移行`
- **ラベル**: `enhancement`, `performance`, `future`
- **本文**: [.github/ISSUE_TEMPLATE/image-optimization.md](file:///Users/taiki.amo/Documents/Clothing-Cluster/.github/ISSUE_TEMPLATE/image-optimization.md)の内容（YAML frontmatterを除く）

#### Issue 4: 認証機能の実装
- **タイトル**: `[Feature] 認証機能の実装`
- **ラベル**: `enhancement`, `security`, `future`
- **本文**: [.github/ISSUE_TEMPLATE/authentication.md](file:///Users/taiki.amo/Documents/Clothing-Cluster/.github/ISSUE_TEMPLATE/authentication.md)の内容（YAML frontmatterを除く）

#### Issue 5: Nuqsを使った検索・フィルタリング機能
- **タイトル**: `[Feature] Nuqsを使った検索・フィルタリング機能の実装`
- **ラベル**: `enhancement`, `future`
- **本文**: [.github/ISSUE_TEMPLATE/search-filtering.md](file:///Users/taiki.amo/Documents/Clothing-Cluster/.github/ISSUE_TEMPLATE/search-filtering.md)の内容（YAML frontmatterを除く）

## 注意事項
- YAML frontmatter（`---`で囲まれた部分）はIssue本文には含めないでください
- ラベルは手動で追加する必要があります（存在しない場合は先に作成）

## 参考
各Issueテンプレートの詳細は、`.github/ISSUE_TEMPLATE/`ディレクトリ内のファイルを参照してください。
