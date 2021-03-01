-- Assessment Test 3

-- Create a new database called "School" this database should have two tables: teachers and students.
-- The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, and graduation year.
-- The teachers table should have columns for teacher_id, first_name, last_name,
-- homeroom_number, department, email, and phone.
-- The constraints are mostly up to you, but your table constraints do have to consider the following:
 -- We must have a phone number to contact students in case of an emergency.
 -- We must have ids as the primary key of the tables
 -- Phone numbers and emails must be unique to the individual.

-- Once you've made the tables, insert a student named Mark Watney (student_id=1) who has a phone number of 777-555-1234 
-- and doesn't have an email. He graduates in 2035 and has 5 as a homeroom number.
-- Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. 
-- His contact info is: jsalk@school.org and a phone number of 777-555-4321.

create table students (
	student_id serial primary key, 
	first_name varchar(100) not null, 
	last_name varchar(100) not null, 
	homeroom_number integer, 
	phone varchar(20) unique not null, 
	email varchar(200) unique, 
	graduation_year integer);
	
create table teachers ( 
	teacher_id serial primary key,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	homeroom_number integer,
	department varchar(100) not null, 
	email varchar(200) unique not null, 
	phone varchar(20) unique not null);

insert into students (student_id, first_name, last_name, homeroom_number, phone, graduation_year)
values (1,'Mark','Watney',5,7775551234,2035);

insert into teachers(teacher_id, first_name,last_name, homeroom_number, department, email, phone) 
values (1,'Jonas','Salk',5,'Biology Department','jsalk@school.org',7775554321);

-- VIEWS (We can give a name to a lengthy query, we therefore need to only select * from view_name)

CREATE VIEW view_name AS query; 
SELECT * FROM view_name;

ALTER VIEW current_view_name RENAME TO new_view_name;

DROP VIEW IF EXISTS view_name;

-- Databases and Tables

CREATE TABLE table_name (
column_1 TYPE column_1_constraint, 
column_2 TYPE column_2_constraint,
column_3 TYPE column_3_constraint,
table_contraint) 
INHERITS existing_table_name; 

CREATE DATABASE database_name;