-- learning about INDEXES/INDECES/JOINS
-- downloading a database -> create new Schema -> Data Import -> Import from Self Contained File > Select Target Schema

-- see how many rows in a specified table; compare num of rows btwn tables in one schema
select count(*) from employees;

-- salaries has more rows than employees. how can this be? (this is not an error)
select count(*) from salaries;

-- compare loading time btwn queries
-- very quick 90.0 secs):
select * from employees;

-- slower (0.219 seconds) due to more condition through a large database due to data not being ordered -> this makes db need to check 
-- entire db for conditional
-- time is paid, therefore creating queries that can load quicker are better
select * from employees where first_name='john';

-- indexes are used to organize the data, since db randomly orders data by default

-- good for when we need to frequently query the data w/ conditionals, and will take less time = less $

-- NON-CLUSTER INDEX: when data inserted into db, db will separates data structure created where data is SORTED
-- allows for quicker access to information since has a better idea of where to look to access information

-- CLUSTERED INDEX: 

-- indexes take up space as well
-- PKs automatically have indexes
-- INDEX NAMING CONVENTION: 'idx_tableName_colName'

-- EXAMPLE: let's create index for first name
-- create index [name] on [table_name](col_name); > takes 1.3 seconds
create index idx_emp_fname
on employees(first_name);

-- now try running our previous query on first name > this now takes LESS TIME due to index (0.016 secs)
select * from employees where first_name='john';

-- EXPLAIN: used in front of query to allow db to show how it will process/run the query
-- shows possible keys (indexes used in the query), key, key_len, ref, and num rows to check

-- example: explain
explain select * from employees where first_name='Parto';

-- EXAMPLE 2: needs to check a lot more rows since hire_date does not have an index
explain select * from employees
where hire_date > '2000-01-01';

-- now let's create a hire_date index:
create index idx_emp_hdate 
on employees(hire_date);

-- now compare the time to select the hire date: -> now only needs to check 12 rows, and processes in less time (0.015 secs)
explain select * from employees
where hire_date > '2000-01-01';

-- these seconds can add up when a db is processing multiple queries at the same time (multiple people accessing at the same time)
-- indexes are also expensive, but can save money by cutting costs in processing time
-- when changing data, the indexes must also change (automatic by the db)
-- if has to check two cols, will check the indexed col first then the last one

-- COMPOSITE INDEX: create index based on two index; order matters, in that it will sort by which col comes first
-- will call that index IF AND ONLY IF both cols are being used for condition 
create index idx_fname_lname
on employees(first_name, last_name);

-- indexes only work for search queries, not for sorting or other methods

-- JOIN QUERIES
-- find all managers of all departments of all time (even previous managers)
select first_name, dept_name, from_date, to_date
 from employees
join dept_manager
on employees.emp_no=dept_manager.emp_no
join departments 
on departments.dept_no=dept_manager.dept_no; -- this will also return cols from departments to include dept name