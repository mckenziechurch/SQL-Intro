-- Create a query that will show all the languages spoken in each country
-- show country name and language and percentage of populations speaking each language.
select countrylanguage.Language as 'Language', countrylanguage.Percentage as 'Percentage',
country.Name as 'Country' from country join countrylanguage
on countrylanguage.CountryCode=country.Code;
-- some data is returned as 0.0 percent -> this isn't necessarily wrong, this could be a population
-- that is so small that is shows at 0% rather than an actual number

-- Create a query to show all the languages spoken in a specific country like Spain.
select countrylanguage.Language as 'Language', countrylanguage.Percentage as 'Percentage',
country.Name as 'Country' from country join countrylanguage
on countrylanguage.CountryCode=country.Code 
where country.Name='Spain';

-- Create a query that will show all the languages spoken in each country - show country name and language and 
-- percentage of populations speaking each language.  
-- But this time it will show the percentage in descending order for each country
select countrylanguage.Language as 'Language', countrylanguage.Percentage as 'Percentage',
country.Name as 'Country' from country join countrylanguage
on countrylanguage.CountryCode=country.Code
order by country.Name, countrylanguage.Percentage desc;
-- for selecting by condition, must put BEFORE the order by clause

-- What is the official language of Aruba?
select countrylanguage.Language as 'Language', country.Name as 'Country'
from country join countrylanguage
on countrylanguage.CountryCode=country.Code
where countrylanguage.IsOfficial='T' and country.Name='Aruba';
-- can use AND to do more than one condition

-- Show the country names, cities belonging to each country.
select city.Name as 'City', 
country.Name as 'Country' from 
country join city on city.CountryCode=country.Code
order by country.Name;

-- Create a query that will show total cities in each country and the country names.
select country.Name as 'Country', count(city.Name) as 'Total Cities' from
country join city on country.Code=city.CountryCode
group by country.Name;