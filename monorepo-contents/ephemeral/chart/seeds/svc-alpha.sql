-- Seed data for svc-alpha. Applied once per ephemeral environment as a PostSync
-- hook. Must be idempotent: the Job can be retried.
BEGIN;

CREATE TABLE IF NOT EXISTS alpha_item (
    id          uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    code        text NOT NULL UNIQUE,
    name        text NOT NULL,
    created_at  timestamptz NOT NULL DEFAULT now()
);

INSERT INTO alpha_item (code, name) VALUES
    ('ALPHA-001', 'First example item'),
    ('ALPHA-002', 'Second example item'),
    ('ALPHA-003', 'Third example item')
ON CONFLICT (code) DO NOTHING;

COMMIT;
