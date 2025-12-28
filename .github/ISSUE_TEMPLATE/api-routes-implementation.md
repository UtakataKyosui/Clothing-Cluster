---
name: API Routesの実装
about: 服アイテムとコーディネートのCRUD操作を行うAPI Routesを実装する
title: '[Feature] API Routesの実装'
labels: enhancement, backend
assignees: ''
---

## 概要
Next.js App RouterのRoute Handlersを使用して、服アイテムとコーディネートのCRUD操作を行うAPIエンドポイントを実装する。

## 背景
現在、フロントエンドのみが実装されており、データベースとの連携を行うAPIが存在しない。Drizzle ORMを使用してデータベース操作を行うAPI Routesを実装する必要がある。

## 実装内容

### 1. 服アイテムAPI（/api/clothing-items）

#### GET /api/clothing-items
- [ ] 服アイテム一覧取得
- [ ] クエリパラメータによるフィルタリング（カテゴリー、色、ブランド）
- [ ] ページネーション対応
- [ ] ソート機能

#### GET /api/clothing-items/[id]
- [ ] 特定の服アイテム取得

#### POST /api/clothing-items
- [ ] 新規服アイテム作成
- [ ] Zodによるバリデーション
- [ ] 画像のBase64エンコード処理

#### PUT /api/clothing-items/[id]
- [ ] 服アイテム更新

#### DELETE /api/clothing-items/[id]
- [ ] 服アイテム削除

### 2. コーディネートAPI（/api/outfits）

#### GET /api/outfits
- [ ] コーディネート一覧取得
- [ ] 関連する服アイテムも含めて取得（JOIN）
- [ ] クエリパラメータによるフィルタリング（季節）
- [ ] ページネーション対応

#### GET /api/outfits/[id]
- [ ] 特定のコーディネート取得
- [ ] 関連する服アイテムも含めて取得

#### POST /api/outfits
- [ ] 新規コーディネート作成
- [ ] 服アイテムの関連付け（outfit_items）
- [ ] トランザクション処理

#### PUT /api/outfits/[id]
- [ ] コーディネート更新
- [ ] 服アイテムの関連付け更新

#### DELETE /api/outfits/[id]
- [ ] コーディネート削除
- [ ] カスケード削除（outfit_items）

### 3. バリデーション

#### Zodスキーマ定義
- [ ] ClothingItemスキーマ
- [ ] Outfitスキーマ
- [ ] OutfitItemスキーマ
- [ ] クエリパラメータスキーマ

### 4. エラーハンドリング
- [ ] 統一されたエラーレスポンス形式
- [ ] バリデーションエラー
- [ ] データベースエラー
- [ ] 404エラー

### 5. テスト
- [ ] APIエンドポイントのテスト
- [ ] バリデーションのテスト
- [ ] エラーハンドリングのテスト

## 技術的考慮事項
- Next.js App Router Route Handlers
- Drizzle ORMのクエリビルダー
- トランザクション処理
- パフォーマンス最適化（N+1問題の回避）
- セキュリティ（SQLインジェクション対策）

## ディレクトリ構成
```
apps/web/src/app/api/
├── clothing-items/
│   ├── route.ts          # GET, POST
│   └── [id]/
│       └── route.ts      # GET, PUT, DELETE
└── outfits/
    ├── route.ts          # GET, POST
    └── [id]/
        └── route.ts      # GET, PUT, DELETE
```

## 参考資料
- [Next.js Route Handlers](https://nextjs.org/docs/app/building-your-application/routing/route-handlers)
- [Drizzle ORM Queries](https://orm.drizzle.team/docs/select)
- [Zod Validation](https://zod.dev/)
