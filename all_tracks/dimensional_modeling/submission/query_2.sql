Insert into amipandya.actors
with this_year AS (
    SELECT
      actor,
      actor_id,
      YEAR,
      ARRAY_AGG(ROW (film, votes, rating, film_id)) AS films,
    year is not null as is_active
    FROM
      bootcamp.actor_films
    WHERE
      YEAR = 2020
    GROUP BY
      actor,
      actor_id,
      YEAR
  ),

  
avg_rating as 
(select 
      actor, 
      actor_id,
       films, 
       year as current_year,
       is_active,
       round(avg(t.rating),2) as quality_class 
       from  
      this_year
      cross join  UNNEST(films) as 
      t(film, votes,   rating, film_id)
      group by 1,2,3,4,5)


select  
  actor , 
  actor_id, 
  films, 
  case when quality_class> 8 then 'Star'
  when quality_class>7 and quality_class <= 8 then     
  'Good'
  when quality_class> 6 and quality_class <= 7 then     
  'Average'
  else 'Bad' end as quality_class,
  is_active,
  current_year from avg_rating
  

Insert into amipandya.actors
with this_year AS (
    SELECT
      actor,
      actor_id,
      YEAR,
      ARRAY_AGG(ROW (film, votes, rating, film_id)) AS films,
    year is not null as is_active
    FROM
      bootcamp.actor_films
    WHERE
      YEAR = 2020
    GROUP BY
      actor,
      actor_id,
      YEAR
  ),

  
avg_rating as 
(select 
      actor, 
      actor_id,
       films, 
       year as current_year,
       is_active,
       round(avg(t.rating),2) as quality_class 
       from  
      this_year
      cross join  UNNEST(films) as 
      t(film, votes,   rating, film_id)
      group by 1,2,3,4,5)


select  
  actor , 
  actor_id, 
  films, 
  case when quality_class> 8 then 'Star'
  when quality_class>7 and quality_class <= 8 then     
  'Good'
  when quality_class> 6 and quality_class <= 7 then     
  'Average'
  else 'Bad' end as quality_class,
  is_active,
  current_year from avg_rating
  
