CREATE TYPE "public"."clothing_category" AS ENUM('TOPS', 'BOTTOMS', 'SHOES', 'ACCESSORIES');--> statement-breakpoint
CREATE TYPE "public"."season" AS ENUM('SPRING', 'SUMMER', 'AUTUMN', 'WINTER', 'ALL_SEASON');--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "clothing_items" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"category" "clothing_category" NOT NULL,
	"image_base64" text,
	"color" text,
	"brand" text,
	"notes" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "outfit_items" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"outfit_id" uuid NOT NULL,
	"clothing_item_id" uuid NOT NULL,
	"category" "clothing_category" NOT NULL,
	"layer_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "outfits" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"description" text,
	"season" "season",
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "outfit_items" ADD CONSTRAINT "outfit_items_outfit_id_outfits_id_fk" FOREIGN KEY ("outfit_id") REFERENCES "public"."outfits"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "outfit_items" ADD CONSTRAINT "outfit_items_clothing_item_id_clothing_items_id_fk" FOREIGN KEY ("clothing_item_id") REFERENCES "public"."clothing_items"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "clothing_items_category_idx" ON "clothing_items" USING btree ("category");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "clothing_items_created_at_idx" ON "clothing_items" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "outfit_items_outfit_id_idx" ON "outfit_items" USING btree ("outfit_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "outfit_items_clothing_item_id_idx" ON "outfit_items" USING btree ("clothing_item_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "outfits_season_idx" ON "outfits" USING btree ("season");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "outfits_created_at_idx" ON "outfits" USING btree ("created_at");