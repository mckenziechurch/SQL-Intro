-- september 21 --
-- find amount for country per year --
-- scenario -> country_id, income, year columns; PK will be country_id + year
-- must either double click on database or specify where making database to insert into correct schema
-- use databaseName.tableName to add to database

create table if not exists world.country_incomes 
(country_id varchar(3),
income decimal(15,2),
year int,
primary key (country_id, year),
foreign key (country_id) references country(code));
alter table country_incomes modify country_id varchar(3) not null unique;

insert into country_incomes
(country_id, income, year)
values
('USA', 1234567890.99, 2019);

-- inserting multiple columns 
insert into country_incomes
(country_id, income, year)
values
('MEX', 33333322.00, 2010),
('ESP', 332098584.12, 2022);

-- can also use this notation
insert into world.country_incomes
values
('RUS', 34839384.01, 2020);

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`world`.`country_incomes`, CONSTRAINT `country_incomes_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`Code`))
-- this error ^ means that the child key does not exist in the parent table
select * from world.country_incomes;

alter table world.country_incomes add column  comments varchar(500);
select * from world.country_incomes;

-- add comment/new col value for previously created row (created before new col existed) -> use update to change actual case/tuple/row
update world.country_incomes set comments='pandemic started' where country_id='RUS' and year=2020; -- can be more specific with 'and'
select * from world.country_incomes;

-- show table for only one case using the 'where' clause; case insensitive
select * from world.country_incomes where country_id='MEX';

-- can use the 'like' after 'where' to get values that include or are similar to what was typed
-- does char by char -> not recommended to use often; % means this value can be anything, it'll just check for what's before %
select * from world.country_incomes where country_id like 'M%'; -- still returns the 'Mex' value

-- can aggregate the column values, ie, find total sum for a specific country; also works with like
select sum(income) from world.country_incomes where country_id='USA';
select avg(income) from world.country_incomes where country_id like 'M%';
select MAX(year) from world.country_incomes; -- gives you the most recent year
