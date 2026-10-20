CREATE TABLE IF NOT EXISTS action_settings (
 activity_id TEXT PRIMARY KEY, submissions_open INTEGER NOT NULL DEFAULT 0,
 join_hash TEXT NOT NULL DEFAULT '', updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS action_cards (
 id TEXT PRIMARY KEY, activity_id TEXT NOT NULL, edit_hash TEXT NOT NULL,
 payload TEXT NOT NULL, consent INTEGER NOT NULL DEFAULT 0,
 status TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending','approved','hidden')),
 revision INTEGER NOT NULL DEFAULT 1, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS action_cards_activity ON action_cards(activity_id,created_at);
CREATE TABLE IF NOT EXISTS action_updates (
 id TEXT PRIMARY KEY, card_id TEXT NOT NULL, payload TEXT NOT NULL,
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS action_updates_card ON action_updates(card_id,created_at);
CREATE TABLE IF NOT EXISTS action_photos (
 id TEXT PRIMARY KEY, card_id TEXT NOT NULL, entry_id TEXT NOT NULL,
 data TEXT NOT NULL, caption TEXT NOT NULL DEFAULT ''
);
CREATE INDEX IF NOT EXISTS action_photos_card ON action_photos(card_id,entry_id);
