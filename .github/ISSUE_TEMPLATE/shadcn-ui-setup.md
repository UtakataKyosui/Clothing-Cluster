---
name: shadcn/uiのセットアップ
about: UIコンポーネントライブラリshadcn/uiをセットアップする
title: '[Setup] shadcn/uiのセットアップ'
labels: enhancement, setup
assignees: ''
---

## 概要
shadcn/uiをプロジェクトにセットアップし、基本的なUIコンポーネントを利用できるようにする。

## 背景
現在、shadcn/uiが導入されていないため、UIコンポーネントを一から作成する必要がある。shadcn/uiを導入することで、高品質で一貫性のあるUIコンポーネントを迅速に実装できる。

## 実装内容

### 1. shadcn/uiの初期化
- [ ] `npx shadcn@latest init`を実行
- [ ] Tailwind CSS v4との互換性を確認
- [ ] components.jsonの設定

### 2. 必要なコンポーネントのインストール
以下のコンポーネントを優先的にインストール：

#### フォーム関連
- [ ] `button` - ボタンコンポーネント
- [ ] `input` - 入力フィールド
- [ ] `textarea` - テキストエリア
- [ ] `select` - セレクトボックス
- [ ] `label` - ラベル
- [ ] `form` - フォームコンポーネント（react-hook-form統合）

#### データ表示
- [ ] `card` - カードコンポーネント
- [ ] `table` - テーブルコンポーネント（TanStack Table統合）
- [ ] `badge` - バッジ
- [ ] `avatar` - アバター

#### ナビゲーション
- [ ] `navigation-menu` - ナビゲーションメニュー
- [ ] `tabs` - タブ
- [ ] `breadcrumb` - パンくずリスト

#### フィードバック
- [ ] `dialog` - ダイアログ/モーダル
- [ ] `alert` - アラート
- [ ] `toast` - トースト通知
- [ ] `skeleton` - スケルトンローディング

#### その他
- [ ] `dropdown-menu` - ドロップダウンメニュー
- [ ] `popover` - ポップオーバー
- [ ] `separator` - セパレーター

### 3. テーマ設定
- [ ] カラーパレットの設定
- [ ] ダークモード対応
- [ ] フォント設定

### 4. ドキュメント作成
- [ ] 使用可能なコンポーネント一覧
- [ ] カスタマイズガイド
- [ ] 使用例

## 技術的考慮事項
- Tailwind CSS v4との互換性確認
- Next.js App Routerとの統合
- TypeScript型定義の確認
- アクセシビリティ対応

## 参考資料
- [shadcn/ui公式ドキュメント](https://ui.shadcn.com/)
- [Tailwind CSS v4ドキュメント](https://tailwindcss.com/docs)
