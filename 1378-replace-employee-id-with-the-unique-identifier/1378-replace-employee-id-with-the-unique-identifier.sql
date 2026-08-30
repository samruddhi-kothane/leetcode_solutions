# Write your MySQL query statement below
select EU.unique_id AS unique_id, name
from Employees E
left join EmployeeUNI EU
on E.id = EU.id
