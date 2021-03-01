-- Worksheet I 

-- How many payment transactions were greater than $5?
select count(*) from payment where amount >5;

-- How many actors have a first name that starts with the letter P?
select count(*) from actor where first_name ilike 'P%';

-- How many unique districts are our customers from?
select count(distinct district) from address;

-- Retrieve the list of names for those distinct districts from the previous question
select distinct district from address order by district asc;

-- How many films have a rating R and a replacement cost between $5 and $15
select count(*) from film where rating = 'R' and replacement_cost between 5 and 15;

-- How many films have the word Truman somewhere in the title 
select count(*) from film where title ilike '%truman%';