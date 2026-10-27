-- Existing records retain NULL: do not guess historical roles.
ALTER TABLE trades ADD COLUMN role_id INTEGER CHECK(role_id BETWEEN 1 AND 5);
