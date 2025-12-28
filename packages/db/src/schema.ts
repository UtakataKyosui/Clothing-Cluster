import { pgTable, text, timestamp, uuid, pgEnum, integer, index } from 'drizzle-orm/pg-core';
import { relations } from 'drizzle-orm';

// 服のカテゴリーEnum
export const clothingCategoryEnum = pgEnum('clothing_category', [
    'TOPS',
    'BOTTOMS',
    'SHOES',
    'ACCESSORIES',
]);

// 季節Enum
export const seasonEnum = pgEnum('season', [
    'SPRING',
    'SUMMER',
    'AUTUMN',
    'WINTER',
    'ALL_SEASON',
]);

// 服アイテムテーブル
export const clothingItems = pgTable(
    'clothing_items',
    {
        id: uuid('id').defaultRandom().primaryKey(),
        name: text('name').notNull(),
        category: clothingCategoryEnum('category').notNull(),
        imageBase64: text('image_base64'), // Base64エンコードされた画像データ
        color: text('color'),
        brand: text('brand'),
        notes: text('notes'),
        createdAt: timestamp('created_at').defaultNow().notNull(),
        updatedAt: timestamp('updated_at').defaultNow().notNull(),
    },
    (table) => ({
        categoryIdx: index('clothing_items_category_idx').on(table.category),
        createdAtIdx: index('clothing_items_created_at_idx').on(table.createdAt),
    })
);

// コーディネートテーブル
export const outfits = pgTable(
    'outfits',
    {
        id: uuid('id').defaultRandom().primaryKey(),
        name: text('name').notNull(),
        description: text('description'),
        season: seasonEnum('season'),
        createdAt: timestamp('created_at').defaultNow().notNull(),
        updatedAt: timestamp('updated_at').defaultNow().notNull(),
    },
    (table) => ({
        seasonIdx: index('outfits_season_idx').on(table.season),
        createdAtIdx: index('outfits_created_at_idx').on(table.createdAt),
    })
);

// コーディネートと服の中間テーブル（重ね着対応）
export const outfitItems = pgTable(
    'outfit_items',
    {
        id: uuid('id').defaultRandom().primaryKey(),
        outfitId: uuid('outfit_id')
            .notNull()
            .references(() => outfits.id, { onDelete: 'cascade' }),
        clothingItemId: uuid('clothing_item_id')
            .notNull()
            .references(() => clothingItems.id, { onDelete: 'cascade' }),
        category: clothingCategoryEnum('category').notNull(),
        layerOrder: integer('layer_order').notNull().default(0), // 重ね着順序（0が一番下）
        createdAt: timestamp('created_at').defaultNow().notNull(),
    },
    (table) => ({
        outfitIdIdx: index('outfit_items_outfit_id_idx').on(table.outfitId),
        clothingItemIdIdx: index('outfit_items_clothing_item_id_idx').on(table.clothingItemId),
    })
);

// リレーション定義
export const clothingItemsRelations = relations(clothingItems, ({ many }) => ({
    outfitItems: many(outfitItems),
}));

export const outfitsRelations = relations(outfits, ({ many }) => ({
    outfitItems: many(outfitItems),
}));

export const outfitItemsRelations = relations(outfitItems, ({ one }) => ({
    outfit: one(outfits, {
        fields: [outfitItems.outfitId],
        references: [outfits.id],
    }),
    clothingItem: one(clothingItems, {
        fields: [outfitItems.clothingItemId],
        references: [clothingItems.id],
    }),
}));

// 型エクスポート
export type ClothingItem = typeof clothingItems.$inferSelect;
export type NewClothingItem = typeof clothingItems.$inferInsert;
export type Outfit = typeof outfits.$inferSelect;
export type NewOutfit = typeof outfits.$inferInsert;
export type OutfitItem = typeof outfitItems.$inferSelect;
export type NewOutfitItem = typeof outfitItems.$inferInsert;
