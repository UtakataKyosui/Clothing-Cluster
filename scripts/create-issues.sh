#!/bin/bash

# GitHub Issueを作成するスクリプト
# 使用前に `gh auth login` でGitHub CLIにログインしてください

echo "GitHub Issueを作成します..."

# 1. react-dndによるドラッグ&ドロップ機能
echo "1/5: react-dnd機能のIssueを作成中..."
gh issue create \
  --title "[Feature] react-dndによるドラッグ&ドロップ機能の実装" \
  --label "enhancement,future" \
  --body-file .github/ISSUE_TEMPLATE/react-dnd-implementation.md

# 2. 服カテゴリーの拡張・変更機能
echo "2/5: カテゴリー拡張機能のIssueを作成中..."
gh issue create \
  --title "[Feature] 服カテゴリーの拡張・変更機能" \
  --label "enhancement,future" \
  --body-file .github/ISSUE_TEMPLATE/category-extension.md

# 3. 画像最適化とストレージ移行
echo "3/5: 画像最適化のIssueを作成中..."
gh issue create \
  --title "[Enhancement] 画像最適化とストレージ移行" \
  --label "enhancement,performance,future" \
  --body-file .github/ISSUE_TEMPLATE/image-optimization.md

# 4. 認証機能の実装
echo "4/5: 認証機能のIssueを作成中..."
gh issue create \
  --title "[Feature] 認証機能の実装" \
  --label "enhancement,security,future" \
  --body-file .github/ISSUE_TEMPLATE/authentication.md

# 5. Nuqsを使った検索・フィルタリング機能
echo "5/5: 検索機能のIssueを作成中..."
gh issue create \
  --title "[Feature] Nuqsを使った検索・フィルタリング機能の実装" \
  --label "enhancement,future" \
  --body-file .github/ISSUE_TEMPLATE/search-filtering.md

echo "すべてのIssueが作成されました！"
