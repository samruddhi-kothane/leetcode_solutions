# Write your MySQL query statement below
(SELECT name as results
from Users 
INNER JOIN MovieRating USING(user_id)
group by user_id
order by COUNT(rating) DESC, name
limit 1)

UNION ALL 

(select title as results
from Movies
INNER JOIN MovieRating USING(movie_id)
where month(created_at) = '02' and year(created_at) = '2020'
group by title
order by avg(rating) DESC, title
limit 1
) 