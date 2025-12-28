#!/bin/bash

# GitHub Issueを作成するスクリプト
# 使用前に `gh auth login` でGitHub CLIにログインしてください

echo "GitHub Issueを作成します..."

# 不足機能のIssue（優先度高）
echo "1/8: shadcn/uiセットアップのIssueを作成中..."
gh issue create \
  --title "[Setup] shadcn/uiのセットアップ" \
  --label "enhancement,setup" \
  --body-file .github/ISSUE_TEMPLATE/shadcn-ui-setup.md

echo "2/8: API Routes実装のIssueを作成中..."
gh issue create \
  --title "[Feature] API Routesの実装" \
  --label "enhancement,backend" \
  --body-file .github/ISSUE_TEMPLATE/api-routes-implementation.md

echo "3/8: 基本UIコンポーネントのIssueを作成中..."
gh issue create \
  --title "[Feature] 基本UIコンポーネントの実装" \
  --label "enhancement,frontend" \
  --body-file .github/ISSUE_TEMPLATE/basic-ui-components.md

# 将来的な実装タスク
echo "4/8: react-dnd機能のIssueを作成中..."
gh issue create \
  --title "[Feature] react-dndによるドラッグ&ドロップ機能の実装" \
  --label "enhancement,future" \
  --body-file .github/ISSUE_TEMPLATE/react-dnd-implementation.md

echo "5/8: カテゴリー拡張機能のIssueを作成中..."
gh issue create \
  --title "[Feature] 服カテゴリーの拡張・変更機能" \
  --label "enhancement,future" \
  --body-file .github/ISSUE_TEMPLATE/category-extension.md

echo "6/8: 画像最適化のIssueを作成中..."
gh issue create \
  --title "[Enhancement] 画像最適化とストレージ移行" \
  --label "enhancement,performance,future" \
  --body-file .github/ISSUE_TEMPLATE/image-optimization.md

echo "7/8: 認証機能のIssueを作成中..."
gh issue create \
  --title "[Feature] 認証機能の実装" \
  --label "enhancement,security,future" \
  --body-file .github/ISSUE_TEMPLATE/authentication.md

echo "8/8: 検索機能のIssueを作成中..."
gh issue create \
  --title "[Feature] Nuqsを使った検索・フィルタリング機能の実装" \
  --label "enhancement,future" \
  --body-file .github/ISSUE_TEMPLATE/search-filtering.md

echo "すべてのIssueが作成されました！"
