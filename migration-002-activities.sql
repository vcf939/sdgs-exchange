ALTER TABLE settings ADD COLUMN active_activity TEXT NOT NULL DEFAULT 'legacy';
ALTER TABLE trades ADD COLUMN activity_id TEXT NOT NULL DEFAULT 'legacy';
CREATE TABLE activities(id TEXT PRIMARY KEY,name TEXT NOT NULL,event_date TEXT NOT NULL,phase TEXT NOT NULL DEFAULT 'setup',groups_json TEXT NOT NULL,archived INTEGER NOT NULL DEFAULT 0,created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now')),archived_at TEXT);
CREATE TABLE activity_cards(activity_id TEXT NOT NULL,id INTEGER NOT NULL,name TEXT NOT NULL,economy INTEGER NOT NULL,environment INTEGER NOT NULL,society INTEGER NOT NULL,PRIMARY KEY(activity_id,id));
INSERT INTO activities(id,name,event_date,phase,groups_json) SELECT 'legacy','原有活動（可修改名稱與日期）',COALESCE((SELECT date(min(created_at),'+8 hours') FROM trades),date('now','+8 hours')),phase,groups_json FROM settings WHERE id=1;
INSERT INTO activity_cards SELECT 'legacy',id,name,economy,environment,society FROM cards;
CREATE INDEX trades_activity_order ON trades(activity_id,id);
