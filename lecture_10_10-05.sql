-- Show the capital cities of each country along with the population in that city
-- look at the country table and see if there is an indicator for how we can find the capital city
select * from country;
select * from city;

-- notice that the capital has code numbers -> we can use this code num to find the capital for each country
select city.Name as 'Capital', country.Name as 'Country', city.Population as 'Population'
from country join city on city.ID=country.Capital;

-- Show the most populated city of each country with country and city name and the population.
select city.Name as 'City', country.Name as 'Country', MAX(city.Population) as 'Population'
from country join city on city.CountryCode=country.Code
group by country.Name;

-- Show the countries from the only caribbean region with a population higher than 100000
select country.Name as 'Country', country.Population as 'Population', country.Region as 'Region' 
from country
where country.Region='Caribbean' and country.Population>100000;

-- Show the country name, population and their incomes in 2019 
-- but show only those countries which have life expectancy less than 50
select country.Name as 'Country', country.Population as 'Population', country_incomes.income as 'Income'
from country join country_incomes
on country_incomes.country_id=country.Code
where country_incomes.year=2019 and country.LifeExpectancy<50;

-- Show only the countries that are either in Asia or Africa 
select country.Name as 'Country', country.Continent as 'Continent'
from country
where country.Continent='Asia' or country.Continent='Africa';

-- same thing, different operator
select country.Name as 'Country', country.Continent as 'Continent'
from country
where country.Continent in ('Asia', 'Africa');

-- Create a view for the following- show the country name, city name and all the recreation facilities in those cities 
-- (how many tables and which tables will be needed to get the required data?
select country.Name as 'Country', city.Name as 'City', city_rec_centers.rec_name as 'Rec Name', city_rec_centers.rec_type as 'Rec Type'
from country
join city 
on country.Code=city.CountryCode
join city_rec_centers
on city.ID=city_rec_centers.city_code
Order by country.Name;
