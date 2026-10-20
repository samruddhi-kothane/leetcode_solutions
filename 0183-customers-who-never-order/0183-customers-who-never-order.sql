# Write your MySQL query statement below

select Customers.name as customers from Customers
where id not in (select customerID from Orders)