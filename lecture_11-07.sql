-- EMPLOYEES DATABASE PRACTICE - creating ERD Diagram in draw.io
-- cardinality: the number of distinct values in a table column relative to the number of rows in the table
-- cardinality in data modeling (relationship cardinality): whether a relationship is one-to-one, many-to-one, or many-to-many

-- ER diagram:
	-- many to many relationship: crow's foot or the letter "m"
    -- one to many relationship: use "|" or the digit "1"
    -- zero relationship: empty circle or the digit "0"
-- Rules: 
	-- Employees works on 1 or more projects
	-- A project has 0 or more employees working on it.
	-- Employees are managed by a manager who is employee him/herself
	-- Employees also belong to a specific department.
	-- A department may or may not have any employees.
    
-- tables/entities:
	-- employees - id, firstname, ssn, last name, dob, employee id, manager (manager is an employee), dept id
	-- departments - id, dept code, department name,  manager (FK to employees table)
	-- Projects - id, project name, location, start date, end date, total_budget, project manager (Fk to employees) 

CREATE SCHEMA `employees_2` ; -- use this schema for this practice
create table if not exists employees (
id int(7),
firstname varchar(10),
lastname varchar(10),
ssn int(10),
dob Date,
manager varchar(20),
department_id int(7),
primary key (id)
);


