/* CASE Statements

General syntax:

CASE
	WHEN condition_1 THEN result_1
	WHEN condition_2 THEN result_2
	ELSE some_other_result
END;
*/

select customer_id,
case 
	when (customer_id <= 100) then 'Premium'
	when (customer_id between 100 and 200) then 'Plus'
	else 'Normal'
end as customer_class
from customer;

select customer_id,
case customer_id
	when 2 then 'Winner'
	when 5 then 'Second Place'
	else 'Unsuccessful'
end as raffle_results
from customer;

-- How many films are bargains, normal or premium?

select
sum(case rental_rate
	when 0.99 then 1
	else 0
end) as Bargains,
sum(case rental_rate
   when 2.99 then 1
   else 0
end) as Regular,
sum(case rental_rate
   when 4.99 then 1
   else 0
end) as Premium
from film;

-- How many films do we have that are rated r, pg and pg13.

select distinct(rating) from film;

select
sum(case rating
	when 'R' then 1
	else 0
end) as R,
sum(case rating
   when 'PG' then 1
   else 0
end) as PG,
sum(case rating
   when 'PG-13' then 1
   else 0
end) as PG13
from film;

-- COALESCE: Becomes useful when quering a table with nulls and wish to substitute the null with another value.

create table products ( 
	Product varchar(10) primary key,
	RRP integer not null,
    Discount integer);

insert into products (Product, RRP, Discount)
values ('A',100,10), ('B',250, null ), ('C',500,50);

select * from products;

select product, (rrp - COALESCE(discount,0)) as final_price from products;

-- CAST: Convert from one data type to another.

select cast('5' as integer) as new_int;

select '10'::integer;

select * FROM rental;

select char_length(cast(inventory_id as varchar)) from rental;

-- NULLIF: Retuns null if both inputs are equal, if not, it will return the first input.

create table depts(
first_name varchar(50),
department varchar(50));

insert into depts(
first_name,
department
)
values
('Vinton', 'A'),
('Lauren', 'A'),
('Claire', 'B');

select * from depts;

select (
sum(case when department = 'A' then 1 else 0 end)/
sum(case when department = 'B' then 1 else 0 end)
) as department_ratio
from depts;

delete from depts
where department = 'B';

select * from depts;

select (
sum(case when department = 'A' then 1 else 0 end)/
nullif(sum(case when department = 'B' then 1 else 0 end),0)
) as department_ratio
from depts;

-- View: A view is a database object that is of a stored query. It does store data physically, it simply stores the query.

create view customer_info as  
select first_name, last_name, address from customer
inner join address
on customer.address_id = address.address_id;

select * from customer_info;

create or replace view customer_info as 
select first_name, last_name, address, district from customer
inner join address
on customer.address_id = address.address_id;

select * from customer_info;

alter view customer_info rename to customer_information;

drop view if exists customer_info;

-- Import and Export: Allows us to import data from a csv file to an already existing table.

create table simple(
a integer,
b integer,
c integer);

select * from simple;