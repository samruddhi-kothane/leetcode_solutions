# Write your MySQL query statement below
select x.employee_id 
from  (
    select e.employee_id, e.name, s.salary
    from employees e left join Salaries s 
    on e.employee_id = s.employee_id
    union
    select s.employee_id, e.name, s.salary
    from employees e right join Salaries s 
    on e.employee_id = s.employee_id
) x
where x.name is null or x.salary is null
order by x.employee_id