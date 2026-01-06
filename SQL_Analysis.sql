DROP DATABASE IF EXISTS train_analysis;
CREATE DATABASE train_analysis;
USE train_analysis;

-- MAIN TABLE 
DROP TABLE IF EXISTS real_train_delays;

CREATE TABLE real_train_delays (
    id INT PRIMARY KEY AUTO_INCREMENT,
    train_number VARCHAR(20),
    train_name VARCHAR(200),
    station_code VARCHAR(20),
    station_name VARCHAR(200),
    average_delay_minutes DECIMAL(8,2),
    pct_right_time DECIMAL(8,2),
    pct_slight_delay DECIMAL(8,2),
    pct_significant_delay DECIMAL(8,2),
    pct_cancelled_unknown DECIMAL(8,2),
    scraped_at DATETIME,
    source_url TEXT
);

-- NOW IMPORTED CSV INTO real_train_delays
SELECT COUNT(*) AS total_rows FROM real_train_delays;
SELECT * FROM real_train_delays LIMIT 10;

-- INDEXES FOR SPEED
CREATE INDEX idx_train_number ON real_train_delays(train_number);
CREATE INDEX idx_station_name ON real_train_delays(station_name);

-- CORE ANALYTICS

-- 1) Top 10 most delayed trains
SELECT 
    train_number,
    train_name,
    AVG(average_delay_minutes) AS avg_delay
FROM real_train_delays
GROUP BY train_number, train_name
ORDER BY avg_delay DESC
LIMIT 10;

-- 2) Worst stations by delay
SELECT 
    station_name,
    AVG(average_delay_minutes) AS avg_delay
FROM real_train_delays
GROUP BY station_name
ORDER BY avg_delay DESC
LIMIT 15;

-- 3) Best on-time trains
SELECT 
    train_number,
    train_name,
    AVG(pct_right_time) AS on_time_rate
FROM real_train_delays
GROUP BY train_number, train_name
ORDER BY on_time_rate DESC
LIMIT 10;

-- 4) Cancellation-prone trains
SELECT 
    train_number,
    train_name,
    AVG(pct_cancelled_unknown) AS cancel_rate
FROM real_train_delays
GROUP BY train_number, train_name
ORDER BY cancel_rate DESC
LIMIT 10;

-- 5) Delay category overall distribution
SELECT
    AVG(pct_right_time) AS avg_right_time,
    AVG(pct_slight_delay) AS avg_slight_delay,
    AVG(pct_significant_delay) AS avg_significant_delay,
    AVG(pct_cancelled_unknown) AS avg_cancelled
FROM real_train_delays;

-- 6) Punctual station leaderboard
SELECT 
    station_name,
    AVG(pct_right_time) AS avg_on_time
FROM real_train_delays
GROUP BY station_name
ORDER BY avg_on_time DESC
LIMIT 15;

-- Train performance summary
CREATE OR REPLACE VIEW vw_train_performance AS
SELECT 
    train_number,
    train_name,
    AVG(average_delay_minutes) AS avg_delay,
    AVG(pct_right_time) AS avg_on_time,
    AVG(pct_significant_delay) AS avg_significant_delay
FROM real_train_delays
GROUP BY train_number, train_name;

-- Station performance summary
CREATE OR REPLACE VIEW vw_station_performance AS
SELECT 
    station_name,
    AVG(average_delay_minutes) AS avg_delay,
    AVG(pct_right_time) AS avg_on_time
FROM real_train_delays
GROUP BY station_name;

SELECT * FROM vw_train_performance ORDER BY avg_delay DESC LIMIT 10;
SELECT * FROM vw_station_performance ORDER BY avg_on_time DESC LIMIT 10;
