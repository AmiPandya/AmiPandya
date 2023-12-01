
CREATE TABLE
  amipandya.actors (
    actor VARCHAR,
    actorid VARCHAR,
    films ARRAY (
    ROW (
    film VARCHAR,
    votes DOUBLE,
    rating DOUBLE,
    film_id VARCHAR
    )
    ),
    quality_class VARCHAR,
    is_active BOOLEAN,
    current_year INTEGER
  )
  WITH
  (
    FORMAT = 'PARQUET',
    partitioning = ARRAY['current_year']
  )
