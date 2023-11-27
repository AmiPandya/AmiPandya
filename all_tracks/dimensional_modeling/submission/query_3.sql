CREATE TABLE
  amipandya. actors_history_scd (
    actor VARCHAR,
    actorid VARCHAR,
    quality_class VARCHAR,
    is_active INTEGER,
    start_year INTEGER,
    end_year INTEGER,
    current_year INTEGER
  )
  WITH
  (
    FORMAT = 'PARQUET',
    partitioning = ARRAY['current_year']
  )
  
  
  
