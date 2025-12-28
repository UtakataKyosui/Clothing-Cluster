---
name: 画像最適化とストレージ移行
about: 画像のパフォーマンス最適化とS3などのオブジェクトストレージへの移行を検討する
title: '[Enhancement] 画像最適化とストレージ移行'
labels: enhancement, performance, future
assignees: ''
---

## 概要
現在はBase64エンコードした画像をPostgreSQLに保存しているが、パフォーマンスとスケーラビリティを考慮して、画像最適化とオブジェクトストレージへの移行を検討する。

## 背景
Base64エンコードによるDB保存は以下の課題がある：
- データベースサイズの肥大化
- クエリパフォーマンスの低下
- 画像の最適化（リサイズ、圧縮）が困難
- CDNによる配信が不可能

## 実装内容

### 1. 画像最適化
- [ ] アップロード時の画像リサイズ（複数サイズの生成）
  - サムネイル（200x200）
  - 中サイズ（800x800）
  - オリジナル
- [ ] 画像圧縮（WebP形式への変換）
- [ ] 遅延読み込み（Lazy Loading）の実装
- [ ] Next.js Image Optimizationの活用

### 2. ストレージ移行
- [ ] ストレージ選択肢の検討
  - AWS S3
  - Cloudflare R2
  - Vercel Blob Storage
  - その他
- [ ] ストレージSDKのセットアップ
- [ ] アップロードAPIの実装
- [ ] 署名付きURL生成（プライベート画像の場合）

### 3. データベーススキーマの変更
- [ ] `imageBase64`カラムから`imageUrl`カラムへの変更
- [ ] 複数サイズの画像URLを保存する構造
  ```typescript
  {
    thumbnail: string;
    medium: string;
    original: string;
  }
  ```
- [ ] マイグレーション戦略（既存のBase64データの移行）

### 4. 画像管理機能
- [ ] 画像のアップロード/削除
- [ ] 未使用画像の自動削除
- [ ] 画像のバックアップ戦略

### 5. パフォーマンス測定
- [ ] 移行前後のパフォーマンス比較
- [ ] データベースサイズの比較
- [ ] ページロード時間の測定

## 技術的考慮事項
- コスト（ストレージ料金、転送料金）
- セキュリティ（画像へのアクセス制御）
- バックアップとリカバリー
- 画像処理ライブラリ（sharp、imagemagickなど）
- CDN設定

## 段階的な移行計画
1. **Phase 1**: 新規アップロードのみストレージに保存（Base64と並行運用）
2. **Phase 2**: 既存画像の段階的移行
3. **Phase 3**: Base64カラムの削除

## 参考資料
- [Next.js Image Optimization](https://nextjs.org/docs/app/building-your-application/optimizing/images)
- [Vercel Blob Storage](https://vercel.com/docs/storage/vercel-blob)
- [AWS S3](https://aws.amazon.com/s3/)
- [Cloudflare R2](https://www.cloudflare.com/products/r2/)
