# Clothing Cluster

服の組み合わせ管理Webアプリケーション

## 技術スタック

- **フロントエンド**: Next.js (App Router), TypeScript, Tailwind CSS v4
- **状態管理**: TanStack Query (v5), Nuqs
- **データ管理**: TanStack Table, Zod, Axios
- **データベース**: PostgreSQL, Drizzle ORM
- **モノレポ管理**: Moonrepo + pnpm

## プロジェクト構成

```
.
├── apps/
│   └── web/          # Next.jsアプリケーション
├── packages/
│   └── db/           # データベースパッケージ（Drizzle ORM）
├── docker-compose.yml
└── package.json
```

## セットアップ

### 1. 依存関係のインストール

```bash
pnpm install
```

### 2. データベースの起動

```bash
docker compose up -d
```

### 3. マイグレーションの実行

```bash
pnpm db:generate
pnpm db:migrate
```

### 4. 開発サーバーの起動

```bash
pnpm dev
```

アプリケーションは http://localhost:3000 で起動します。

## 開発コマンド

- `pnpm dev` - 開発サーバーの起動
- `pnpm build` - プロダクションビルド
- `pnpm db:generate` - Drizzleマイグレーションファイルの生成
- `pnpm db:migrate` - マイグレーションの実行
- `pnpm db:studio` - Drizzle Studioの起動（データベースGUI）

## データモデル

### 服アイテム（ClothingItem）
- カテゴリー: トップス、ボトムス、靴、アクセサリー
- 画像: Base64エンコードしてDB保存
- その他: 色、ブランド、メモなど

### コーディネート（Outfit）
- 名前、説明、季節
- 複数の服アイテムを組み合わせ可能（重ね着対応）

### コーディネートアイテム（OutfitItem）
- コーディネートと服アイテムの中間テーブル
- 重ね着順序（layerOrder）で管理

## ライセンス

Private
