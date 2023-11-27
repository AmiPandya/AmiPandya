WITH
  last_season_scd AS (
    SELECT
      *
    FROM
       amipandya.actors_history_scd 
    WHERE
      current_year = 2021
  ),
  current_season_scd AS (
    SELECT
      *
    FROM
      amipandya.actors
    WHERE
      current_year = 2022
  ),
  combined AS (
    SELECT
      COALESCE(ls.actor, cs.actor) AS actor,
      COALESCE(ls. actorid, cs. actorid) AS actorid,
      COALESCE(ls. quality_class, cs. quality_class) AS quality_class,
      COALESCE(ls. start_year, cs. current_year) AS start_year,
      COALESCE(ls. end_year, cs.current_year) AS end_season,
      CASE
        WHEN ls.is_active <> cs.is_active  THEN 1
        WHEN ls.is_active =  cs.is_active THEN 0
      END AS did_change,
      2022 AS current_year
    FROM
      last_season_scd ls
      FULL OUTER JOIN current_season_scd cs ON ls.actor = cs.actor and ls.quality_class = cs.quality_class 
      AND ls.end_year + 1 = cs.current_year
  )
SELECT
  *
FROM
  combined
