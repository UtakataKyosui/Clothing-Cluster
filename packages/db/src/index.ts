import postgres from 'postgres';
import { drizzle } from 'drizzle-orm/postgres-js';
import * as schema from './schema';

// PostgreSQL接続
const connectionString = process.env.DATABASE_URL || 'postgresql://postgres:postgres@localhost:5432/clothing_cluster';

// クエリクライアント
export const client = postgres(connectionString);

// Drizzleインスタンス
export const db = drizzle(client, { schema });

// スキーマとテーブルのエクスポート
export * from './schema';
