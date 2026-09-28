-- Seed data for svc-beta. The reindex Job runs after this and pushes these
-- rows into Elasticsearch.
BEGIN;

CREATE TABLE IF NOT EXISTS beta_record (
    id          uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    reference   text NOT NULL UNIQUE,
    description text,
    created_at  timestamptz NOT NULL DEFAULT now()
);

INSERT INTO beta_record (reference, description) VALUES
    ('BETA-1000', 'Example record one'),
    ('BETA-1001', 'Example record two')
ON CONFLICT (reference) DO NOTHING;

COMMIT;
