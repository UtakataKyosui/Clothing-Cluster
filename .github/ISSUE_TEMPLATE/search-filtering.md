---
name: Nuqsを使った検索・フィルタリング機能の実装
about: 服アイテムとコーディネートの検索・フィルタリング機能を実装する
title: '[Feature] Nuqsを使った検索・フィルタリング機能の実装'
labels: enhancement, future
assignees: ''
---

## 概要
Nuqsを活用して、服アイテムとコーディネートの検索・フィルタリング機能を実装する。URLパラメータで状態を管理することで、検索結果の共有やブックマークが可能になる。

## 背景
現在は検索・フィルタリング機能がないため、データが増えると目的のアイテムやコーディネートを見つけにくくなる。Nuqsを使ってURLパラメータで検索状態を管理することで、以下のメリットが得られる：
- 検索結果のURL共有
- ブラウザの戻る/進むボタンで検索履歴を辿れる
- ページリロード後も検索状態を保持
- SEOフレンドリーなURL

## 実装内容

### 1. 服アイテムの検索・フィルタリング

#### 検索条件
- [ ] テキスト検索（名前、ブランド、メモ）
- [ ] カテゴリーフィルター（トップス、ボトムス、靴、アクセサリー）
- [ ] 色フィルター
- [ ] ブランドフィルター
- [ ] 登録日フィルター（期間指定）

#### URLパラメータ例
```
/items?q=シャツ&category=TOPS&color=白&brand=ユニクロ&from=2024-01-01&to=2024-12-31
```

#### 実装
- [ ] Nuqsを使ったURLパラメータ管理
- [ ] 検索フォームコンポーネント
- [ ] フィルターUIコンポーネント
- [ ] TanStack Tableとの統合
- [ ] デバウンス処理（入力中の過度なAPI呼び出しを防ぐ）

### 2. コーディネートの検索・フィルタリング

#### 検索条件
- [ ] テキスト検索（名前、説明）
- [ ] 季節フィルター（春、夏、秋、冬、オールシーズン）
- [ ] 使用アイテムによる検索（特定の服を含むコーディネート）
- [ ] 登録日フィルター（期間指定）

#### URLパラメータ例
```
/outfits?q=カジュアル&season=SUMMER&item=abc123&from=2024-06-01
```

#### 実装
- [ ] Nuqsを使ったURLパラメータ管理
- [ ] 検索フォームコンポーネント
- [ ] フィルターUIコンポーネント
- [ ] 使用アイテムによる検索UI
- [ ] TanStack Tableとの統合

### 3. 高度な検索機能（将来的）

- [ ] 複数カテゴリーの組み合わせ検索
- [ ] タグ機能の追加と検索
- [ ] 保存された検索条件（お気に入り検索）
- [ ] 検索履歴の表示
- [ ] 全文検索の最適化（PostgreSQL Full Text Search）

### 4. UI/UX

- [ ] 検索結果の件数表示
- [ ] 検索条件のクリアボタン
- [ ] アクティブなフィルターの表示（タグ形式）
- [ ] ソート機能（名前順、登録日順など）
- [ ] ページネーション（無限スクロールも検討）
- [ ] 検索結果が0件の場合のUI

## 技術的考慮事項

### Nuqsの活用
```typescript
import { useQueryState, parseAsString, parseAsStringEnum } from 'nuqs';

// 検索クエリ
const [query, setQuery] = useQueryState('q', parseAsString);

// カテゴリーフィルター
const [category, setCategory] = useQueryState(
  'category',
  parseAsStringEnum(['TOPS', 'BOTTOMS', 'SHOES', 'ACCESSORIES'])
);
```

### パフォーマンス
- デバウンス処理（300-500ms）
- TanStack Queryのキャッシュ活用
- サーバーサイドでのインデックス最適化
- ページネーションによるデータ量の制限

### データベースクエリ
- Drizzle ORMの`like`、`ilike`演算子を使用
- 複数条件の組み合わせ（AND/OR）
- インデックスの追加（検索対象カラム）

## 実装例

### 服アイテム検索ページ
```typescript
'use client';

import { useQueryState, parseAsString, parseAsStringEnum } from 'nuqs';
import { useQuery } from '@tanstack/react-query';

export default function ClothingItemsPage() {
  const [query, setQuery] = useQueryState('q', parseAsString);
  const [category, setCategory] = useQueryState(
    'category',
    parseAsStringEnum(['TOPS', 'BOTTOMS', 'SHOES', 'ACCESSORIES'])
  );

  const { data, isLoading } = useQuery({
    queryKey: ['clothing-items', query, category],
    queryFn: () => fetchClothingItems({ query, category }),
  });

  return (
    <div>
      <SearchForm query={query} onQueryChange={setQuery} />
      <CategoryFilter category={category} onCategoryChange={setCategory} />
      <ItemList items={data} isLoading={isLoading} />
    </div>
  );
}
```

## 参考資料
- [Nuqs公式ドキュメント](https://nuqs.47ng.com/)
- [TanStack Query - Dependent Queries](https://tanstack.com/query/latest/docs/framework/react/guides/dependent-queries)
- [Drizzle ORM - Filters](https://orm.drizzle.team/docs/select#filtering)
