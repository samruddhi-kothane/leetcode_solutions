# Write your MySQL query statement below
WITH cte AS
(SELECT *, SUM(weight) OVER(ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 
Total
FROM Queue)

select person_name
from cte
WHERE total <=1000
ORDER BY total DESC 
LIMIT 1