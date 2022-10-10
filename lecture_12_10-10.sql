-- import downloaded database
-- go to server > data import > import self-contained file 
-- 1. we imported from this link: https://github.com/datacharmer/test_db -> download the zip under "code"
-- 2. first, import the employees -> this will load to a database
-- 3. next, load the dump files (the data for the database) one by one (make sure
-- that the employees table is selected to import to)
-- refresh the Schemas on the left to check for the 'employees' table, and check each table to ensure that the 
-- data has properly loaded

-- explore your data; how much? how many? how are they related (reverse engineer)?
select * from employees.departments limit 5; -- check that the tables have loaded
select count(*) from employees.employees; -- find how many entries of a table you have in the table
select count(*) from dept_emp;
select count(*) from salaries;

-- try a query
select count(*) from salaries
where salaries.salary < 40000;

select * from employees
where employees.birth_date < 1990-01-01 -- check on this condition
and employees.gender = 'F' 
limit 30;

-- get 30 employees in the Sales department
select employees.first_name as "First Name", dept_emp.dept_no as "Dep. No.", departments.dept_name as "Department"
from employees join dept_emp
on employees.emp_no=dept_emp.emp_no
join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_name = 'Sales'
limit 20;
