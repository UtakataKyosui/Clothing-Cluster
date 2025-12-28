---
name: 基本UIコンポーネントの実装
about: 服アイテムとコーディネート管理のための基本UIコンポーネントを実装する
title: '[Feature] 基本UIコンポーネントの実装'
labels: enhancement, frontend
assignees: ''
---

## 概要
服アイテムとコーディネート管理のための基本的なUIコンポーネントを実装する。shadcn/uiをベースに、アプリケーション固有のコンポーネントを作成する。

## 背景
現在、ホームページのみが実装されており、実際のアプリケーション機能を提供するUIコンポーネントが存在しない。

## 実装内容

### 1. レイアウトコンポーネント

#### ヘッダー
- [ ] ナビゲーションメニュー
- [ ] ロゴ
- [ ] ダークモード切り替え

#### サイドバー（オプション）
- [ ] ナビゲーションリンク
- [ ] カテゴリーフィルター

#### フッター
- [ ] コピーライト
- [ ] リンク

### 2. 服アイテム関連コンポーネント

#### ClothingItemCard
- [ ] 服アイテムのカード表示
- [ ] 画像表示（Base64）
- [ ] 名前、カテゴリー、色、ブランド表示
- [ ] 編集・削除ボタン

#### ClothingItemList
- [ ] 服アイテムの一覧表示
- [ ] グリッドレイアウト
- [ ] ページネーション
- [ ] ローディング状態

#### ClothingItemForm
- [ ] 服アイテムの作成・編集フォーム
- [ ] 画像アップロード（Base64変換）
- [ ] カテゴリー選択
- [ ] 色、ブランド、メモ入力
- [ ] バリデーション表示

#### ClothingItemDetail
- [ ] 服アイテムの詳細表示
- [ ] 画像拡大表示
- [ ] 使用しているコーディネート一覧

### 3. コーディネート関連コンポーネント

#### OutfitCard
- [ ] コーディネートのカード表示
- [ ] 含まれる服アイテムのサムネイル
- [ ] 名前、説明、季節表示
- [ ] 編集・削除ボタン

#### OutfitList
- [ ] コーディネートの一覧表示
- [ ] グリッドレイアウト
- [ ] フィルタリング（季節）
- [ ] ページネーション

#### OutfitForm
- [ ] コーディネートの作成・編集フォーム
- [ ] 名前、説明、季節入力
- [ ] 服アイテム選択UI
- [ ] カテゴリー別のアイテム選択
- [ ] 重ね着順序の調整

#### OutfitDetail
- [ ] コーディネートの詳細表示
- [ ] 含まれる服アイテムの一覧
- [ ] カテゴリー別・重ね着順序別の表示

### 4. 共通コンポーネント

#### SearchBar
- [ ] テキスト検索
- [ ] デバウンス処理
- [ ] クリアボタン

#### FilterPanel
- [ ] カテゴリーフィルター
- [ ] 色フィルター
- [ ] ブランドフィルター
- [ ] 季節フィルター

#### ImageUpload
- [ ] ドラッグ&ドロップ対応
- [ ] プレビュー表示
- [ ] Base64変換
- [ ] ファイルサイズ制限

#### ConfirmDialog
- [ ] 削除確認ダイアログ
- [ ] カスタマイズ可能なメッセージ

#### EmptyState
- [ ] データがない場合の表示
- [ ] アクション誘導

### 5. ページコンポーネント

#### /items
- [ ] 服アイテム一覧ページ
- [ ] 検索・フィルタリング
- [ ] 新規作成ボタン

#### /items/[id]
- [ ] 服アイテム詳細ページ
- [ ] 編集・削除機能

#### /items/new
- [ ] 服アイテム作成ページ

#### /outfits
- [ ] コーディネート一覧ページ
- [ ] 検索・フィルタリング
- [ ] 新規作成ボタン

#### /outfits/[id]
- [ ] コーディネート詳細ページ
- [ ] 編集・削除機能

#### /outfits/new
- [ ] コーディネート作成ページ

## 技術的考慮事項
- TanStack Queryを使ったデータフェッチング
- Nuqsを使ったURL状態管理
- レスポンシブデザイン
- アクセシビリティ対応
- パフォーマンス最適化（画像の遅延読み込みなど）

## ディレクトリ構成
```
apps/web/src/
├── app/
│   ├── items/
│   │   ├── page.tsx
│   │   ├── [id]/
│   │   │   └── page.tsx
│   │   └── new/
│   │       └── page.tsx
│   └── outfits/
│       ├── page.tsx
│       ├── [id]/
│       │   └── page.tsx
│       └── new/
│           └── page.tsx
└── components/
    ├── layout/
    │   ├── header.tsx
    │   └── footer.tsx
    ├── clothing-items/
    │   ├── clothing-item-card.tsx
    │   ├── clothing-item-list.tsx
    │   ├── clothing-item-form.tsx
    │   └── clothing-item-detail.tsx
    ├── outfits/
    │   ├── outfit-card.tsx
    │   ├── outfit-list.tsx
    │   ├── outfit-form.tsx
    │   └── outfit-detail.tsx
    └── common/
        ├── search-bar.tsx
        ├── filter-panel.tsx
        ├── image-upload.tsx
        ├── confirm-dialog.tsx
        └── empty-state.tsx
```

## 依存関係
- shadcn/uiのセットアップが完了していること
- API Routesが実装されていること

## 参考資料
- [shadcn/ui Components](https://ui.shadcn.com/docs/components)
- [TanStack Query](https://tanstack.com/query/latest)
- [Nuqs](https://nuqs.47ng.com/)
