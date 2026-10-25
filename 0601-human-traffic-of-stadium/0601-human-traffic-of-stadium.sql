# Write your MySQL query statement below
with t1 as (
select * from Stadium where people >= 100
)
, t2 as (
select *, row_number() over(order by id ) as rn
from t1
)
, t3 as (
select *, id - rn as grp
from t2
)
select id, visit_date, people from t3 where grp in (
select grp 
from t3 
group by grp
having count(*) >= 3)