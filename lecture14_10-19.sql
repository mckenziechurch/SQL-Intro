-- Homework 3

-- Department manager w/ employee number 111784 has just quit on the spot - 
-- we must notify all employees under this manager. 
-- Find all employees who are under this manager to organize a meeting
select employees.emp_no as 'Employee Num', dept_emp.dept_no as 'Department'
from employees 
join dept_emp
on employees.emp_no=dept_emp.emp_no
join dept_manager
on dept_manager.dept_no=dept_emp.dept_no
where dept_manager.emp_no=111784;

-- To ensure that we are following laws regarding child labor, 
-- we must check the hours for all minor/underage employees. 
-- Get all employees who are under 18 years of age so we can contact them
select * from employees
where employees.birth_date < 2004-10-18;

-- Get all employees in the sales department:
select employees.first_name as "First Name", dept_emp.dept_no as "Dep. No.", departments.dept_name as "Department"
from employees join dept_emp
on employees.emp_no=dept_emp.emp_no
join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_name = 'Sales';

-- Our company wants to celebrate the anniversary of employees who have worked for 10 years (since 2012) 
-- by offering them a raise and a card that says “Thank you [First Name] [Last Name] for your work with us since [hire date]!”. 
-- Find all employees who celebrate their 10 year anniversary this year.
select employees.first_name as 'First Name', employees.last_name as 'Last Name', employees.hire_date as 'Hire Date', salaries.salary as 'Salary'
from employees
join salaries
on employees.emp_no=salaries.emp_no
where employees.hire_date < 2012-10-18; -- there aren't employees who match this criteria
-- so I tried switching the < sign; this returns employees, but some have changed
-- salaries throughout the years so it returns every entry for the salary change,
-- creating duplicates.

-- Company success has allowed us to offer raises in order to raise the minimum salary in response to inflation. 
-- Check all departments and get employees whose salary lies below $50,000:
select employees.emp_no as 'Employee Num', departments.dept_name as 'Department', salaries.salary as 'Salary' 
from employees 
join dept_emp
on employees.emp_no=dept_emp.emp_no
join departments 
on dept_emp.dept_no=departments.dept_no
join salaries
on employees.emp_no=salaries.emp_no;
-- this has the same problem as the issue above -> duplicate entries due to salary
-- changes over time
