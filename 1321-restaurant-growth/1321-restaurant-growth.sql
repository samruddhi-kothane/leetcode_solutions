# Write your MySQL query statement below
select visited_on,
       (
        select SUM(amount)
        from Customer
        where visited_on between DATE_SUB(c.visited_on, INTERVAL 6 Day)
        AND c.visited_on
       ) AS amount,
       ROUND((
        select SUM(amount)/7
        from Customer
        where visited_on between DATE_SUB(c.visited_on, INTERVAL 6 Day)
        AND c.visited_on
       ),2) AS average_amount
from Customer c
where visited_on >= (
    select DATE_ADD(MIN(visited_on), INTERVAL 6 Day)
    from Customer
)
group by visited_on
order by visited_on