-- Seed data for svc-gamma. Runs AFTER the PreSync migration Job has created
-- the schema, so this file only inserts.
BEGIN;

INSERT INTO gamma_config (key, value) VALUES
    ('feature.example', 'enabled'),
    ('limits.max_items', '100')
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;

COMMIT;
