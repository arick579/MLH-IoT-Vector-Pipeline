-- 1. Create the relational metadata table
CREATE TABLE sensors(
  id SERIAL PRIMARY KEY,
  type VARCHAR(50),
  location VARCHAR(50)
);

-- 2. Create the time-series table and convert it into a hypertable
CREATE TABLE sensor_data (
  time TIMESTAMPTZ NOT NULL,
  sensor_id INTEGER,
  temperature DOUBLE PRECISION,
  cpu DOUBLE PRECISION,
  FOREIGN KEY (sensor_id) REFERENCES sensors (id)
) WITH (
  tsdb.hypertable
);

-- 3. Populate the sensors table with initial metadata
INSERT INTO sensors (type, location) VALUES
('a','floor'),
('a', 'ceiling'),
('b','floor'),
('b', 'ceiling');

-- 4. Generate and insert simulated telemetry data over a 24-hour period
INSERT INTO sensor_data (time, sensor_id, cpu, temperature)
SELECT
  time,
  sensor_id,
  random() AS cpu,
  random()*100 AS temperature
FROM generate_series(now() - interval '24 hour', now(), interval '5 minute') AS g1(time), generate_series(1,4,1) AS g2(sensor_id);

-- 5. Test Query: Calculate average temperature and CPU by 30-minute windows
SELECT
  time_bucket('30 minutes', time) AS period,
  AVG(temperature) AS avg_temp,
  AVG(cpu) AS avg_cpu
FROM sensor_data
GROUP BY period;
