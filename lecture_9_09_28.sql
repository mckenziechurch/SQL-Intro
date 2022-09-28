select * from city_rec_centers;
update city_rec_centers set rec_name='UWG Theatre' where rec_id=15;
select * from city_rec_centers;

-- delete a record -> do not use the drop function (DDL)
-- must use DML to get rid of a row
delete from city_rec_centers where rec_id=15;
select * from city_rec_centers;

insert into city_rec_centers
values (4, 0, 'Kids Museum', 'museum', '40 museum dr.'),
(22, 1, 'Aquarium', 'park', '1010 aquarium street'),
(3, 2, 'Art Museum', 'museum', '33 museum ave.');

select * from city_rec_centers;

-- select multiple variables from multiple tables where there are children and parent tables
-- must only reference parent table -> pay attention to what data is accessible from children tables
-- this query is the inner join
select country.Name, 
country_incomes.income,
country_incomes.year
from country join country_incomes 
on country.Code=country_incomes.country_id;

-- another way to do the above query -> change order of the table
-- same info returned
select country.Name, 
country_incomes.income,
country_incomes.year
from country_incomes join country 
on country.Code=country_incomes.country_id;

-- run above clause w/ where condition
select country.Name, 
country_incomes.income,
country_incomes.year
from country_incomes join country 
on country.Code=country_incomes.country_id
where country.code='USA';

-- show all cities from country aruba
select city.Name, country.Name 
from city join country 
on city.CountryCode=country.Code
where country.Name='Aruba';

-- show all languages spoken in saudi arabia
select city.Name, country.Name 
from city join country 
on city.CountryCode=country.Code
where country.Name='Malaysia'
order by city.Name; -- sort by the city name

-- put what to label columns as using an alias through 'as' clause
select city.Name as 'City Name', country.Name as 'Country Name' 
from city join country 
on city.CountryCode=country.Code
where country.Name='Aruba';

-- Show all the languages spoken in Saudi Arabia 
select countrylanguage.Language as 'Language', country.Name as 'Country'
from countrylanguage join country
on countrylanguage.CountryCode=country.Code
where country.Name='Saudi Arabia';

-- show the per capita (per citizen) income of each country 
-- (use alias, how many tables and which tables will be needed to get the required data?)

-- inner join -> will not reference all countries because can only match table w/ least amount of data
-- to table w/ most amount of data
select country.Name as 'Country', (country_incomes.income/country.Population) as 'Per Capita Income'
from country join country_incomes
on country.Code=country_incomes.country_id
order by country.Name;