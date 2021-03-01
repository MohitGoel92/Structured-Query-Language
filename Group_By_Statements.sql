-- GROUP BY Statements

-- Aggeregate Functions: MIN,MAX,AVG,SUM,ROUND

-- In the example below 'Function' will be replaced by an aggeragate function such as 
'MIN','MAX','AVG' OR 'SUM'

SELECT Function(column_name) from table_name; 

-- In the example below 'Function' will be replaced by an aggeragate function such as 
'MIN','MAX','AVG' OR 'SUM' and 'X' is an integer representing the number of decimal places
we are rounding to

SELECT ROUND(Function(column_name),X) from table_name;

-- GROUP BY Statements 
-- In the example below 'Function' will be replaced by an aggeragate function such as 
'MIN','MAX','AVG' OR 'SUM'

SELECT column1_name, Function(Column2_name) FROM table_name GROUP BY column1_name;

-- We have two staff members with staff IDs 1 and 2. We want to give a bonus to 
the staff member that handled the most payments. Which staff member gets the bonus?

select staff_id, count(amount), round(sum(amount),0) from payment group by staff_id;

-- Corprate HQ is auditing our store. They want to know the average replacement cost of
movies by rating

select rating,round(avg(replacement_cost),2) from film group by rating order by avg(replacement_cost);

-- We want to send coupons to the 5 top spending customers, find their customer ids

select customer_id, round(sum(amount),2) from payment group by customer_id order by sum(amount) desc limit 5;

-- HAVING Statements
-- In the example below 'Function' will be replaced by an aggeragate function such as 
'MIN','MAX','AVG' OR 'SUM'. 'condition' are such as column1_name > a number 

SELECT column1_name, Function(column2_name) FROM table_name GROUP BY column1_name HAVING condition;

-- We wish to provide customers that have at least 40 transaction payments wish a platinum credit card,
find the customer ids that are eligible. 

select customer_id,count(amount) from payment group by customer_id having count(amount)>=40;

-- What movies ratings have an average rental duration of more than 5 days?

select rating, round(avg(rental_duration),2) from film group by rating 
having avg(rental_duration)>5 order by avg(rental_duration);