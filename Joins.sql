-- Joins 

-- AS Statements

SELECT column_name AS new_column_name FROM table_name;

-- Joins: INNER JOIN / OUTER JOIN

-- In the below example, column_a and column_c are the primary and foreign key respectively
(i.e. that rows match in order for us to join the table on that column).
 
SELECT table_a.column_a, table_a.column_b, table_b.column_c, table_b.column_d,
FROM table_a
INNER JOIN table_b ON table_a.column_a = table_b.column_c; 

-- Example Question: We wish to find out the quantity of each movie store 1 holds, display the 
information in a single table:
 
select title, count(title) as Copies
from film
inner join inventory on film.film_id = inventory.film_id
where store_id = 1
group by title
order by count(title) desc; 

-- UNION Statements 

SELECT column_1, columns_2
FROM table_name_1
UNION
SELECT column_1, column_2
from table_name_2; 

-- Advanced SQL Commands 
-- Overview: Mathematical functions, Timestamps and the extract function, string functions and operators,
-- subquery, self-joins

-- Timestamp 
-- In the below query UFD stands for Unit From Date, e.g. day/dow/doy/week/year

SELECT column_1_name 
EXTRACT(UFD from column_2_name)
FROM table_name;

-- Example Question: In what month did we have our highest revenue? What was the total revenue for that month?

SELECT sum(amount) AS total, extract(month from payment_date) AS month
FROM payment
GROUP BY month
ORDER BY total DESC
LIMIT 1;

-- Mathematical Functions (for numerical column types)
-- 'operator' in the below query will be a mathematical operator such as + , - , x , / ... etc 

SELECT column_1_name operator column_2_name AS column_new FROM table_name;

-- String functions and operators 

SELECT first_name || ' ' || last_name AS Full_Name FROM customer;
SELECT first_name, char_length(first_name) FROM customer;
SELECT upper(first_name), upper(last_name) FROM customer;

-- Subquery (A query within a query)
-- Example Questions: Find the films whose rental rate is higher than the average rental rate 

SELECT title, rental_rate FROM film WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

-- Example Question: Extract all the films that were returned between the dates of 29th May and 30th May

select film_id, title
from film 
where film_id IN 
(select inventory.film_id
from rental 
inner join inventory on inventory.inventory_id = rental.inventory_id 
where 
return_date between '2005-05-29' and '2005-05-30') order by film_id;

-- SELF JOIN (Combining rows with other rows in the same table)

SELECT alias1.column_1_name
FROM table_name AS alias1, table_name AS alias2
WHERE alias1.column_2_name= alias2.column_2_name
AND alias2.column_1_name = 'string/number';

-- Example Question: Find the customers who share the same first name with other customers last name

select x.customer_id, x.first_name, x.last_name, y.customer_id, y.first_name, y.last_name 
from customer as x, customer as y
where x.first_name = y.last_name;

select x.customer_id, x.first_name, x.last_name, y.customer_id, y.first_name, y.last_name 
from customer as x
join customer as y
on x.first_name = y.last_name;