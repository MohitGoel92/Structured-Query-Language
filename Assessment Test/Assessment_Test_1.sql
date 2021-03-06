-- Assessment Test 1 

-- Return the customer IDs of the customers who have spent at least $110 with the staff member who 
has an ID of 2 

select customer_id,sum(amount) from payment where staff_id = 2 group by customer_id having sum(amount)>=110;

-- How many films begin with the letter J?

select count(*) from film where title like 'J%';

-- What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower
than 500? 

select first_name,last_name,customer_id,address_id 
from customer 
where first_name like 'E%' and address_id < 500 
order by customer_id desc limit 1;