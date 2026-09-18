-- Verify all extensions
SELECT extname, extversion FROM pg_extension WHERE extname IN ('timescaledb', 'vector', 'vectorscale') ORDER BY extname;

-- Verify DiskANN access method
SELECT amname FROM pg_am WHERE amname = 'diskann';

-- Test TimescaleDB hypertable creation
CREATE TABLE IF NOT EXISTS metrics (
  time TIMESTAMPTZ NOT NULL, 
  value DOUBLE PRECISION
);
SELECT create_hypertable('metrics', 'time', if_not_exists => TRUE);

-- Confirm operational
SELECT 'All extensions operational!' as status;
