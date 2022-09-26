-- Data Database Language (DDL) ie, create, alter, drop, truncate, rename, etc.
-- Data Manipulation Language (DML): insert
-- look at last lecture (09/21) lecture notes -> referencing incomes table
select * from world.country_incomes;

-- create table that links to world cities listing recreational areas -> user can look up things to do in the city
-- things to keep track of for recreational facilities: name, type, address
-- to select a schema --> can do 'use nameOfSchema'

create table if not exists world.city_rec_centers 
(city_code int,
rec_id integer unsigned auto_increment primary key, -- can assign PK like this instead of primary key (nameOfKey)
rec_name char(50) not null,
rec_type char(10), 
rec_address char(100));

-- add a foreign key constraint after the table is created
alter table world.city_rec_centers add constraint foreign key (city_code) references city(id);

insert into world.city_rec_centers
values (400, 15, 'The Kids Museum', 'museum', '933 Museum Rd'),
(3, 'Moon Park', 'the park', 'address'),
(4, 'Sun Mall', 'sun mall', 'mall address');

-- get number of cities in city column
select count(*) as 'total cities' from world.city; -- this is called aliasing -> create a name for what you are looking up
-- will also give description of what you are showing when the query is ran
-- verify
select * from city_rec_centers;

-- a. temporary table: can be used if doesn't want to alter original table to test something
-- temporary tables disappear when query is saved and closed/when logged out -> cannot resotre
-- b. can also create another identical table with same data
create temporary table city_temp
(city_code varchar(10) primary key,
city_name varchar(50));
-- verify
select * from city_temp;

-- this is a real table, but still for testing purposes -> 'as select * from tableName' -> create copy of table
create table if not exists country_incomes_bak as select * from country_incomes;
show tables; -- shows name of all tables in the schema

-- can now run queries on the copy table
select * from country_incomes_bak;
