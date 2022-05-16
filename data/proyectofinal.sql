select * from total_deaths;

-- Estados con mayores tasas de mortalidad por problemas cardíacos --
select 'From_2013_to_2019',LocationAbbr, avg(Data_Value) as avg_deaths from total_deaths
group by  LocationAbbr
order by avg_deaths desc;

-- Counties con mayores tasas de mortalidad por problemas cardíacos --
select 'From_2013_to_2019',LocationAbbr, LocationDesc, avg(Data_Value) as avg_deaths from total_deaths
group by  LocationAbbr, LocationDesc
order by avg_deaths desc;

-- Counties con mayores tasas de mortalidad por problemas cardíacos --
select 'From_2013_to_2019',LocationAbbr, LocationDesc, avg(Data_Value) as avg_deaths from total_deaths
where LocationAbbr = 'NY'
group by  LocationAbbr, LocationDesc
order by LocationDesc desc;

-- Counties por año --
select Year,LocationAbbr, LocationDesc, Data_Value from total_deaths
order by Data_Value desc;

-- Obesidad por estado -- 
select LocationAbbr, LocationDesc, Topic, Question, avg(Data_Value) as avg_per_year, avg(Sample_Size) as avg_sample
from physical
where YearEnd >= 2013
and LocationDesc <> 'National'
and Class = 'Obesity / Weight Status'
and Question = 'Percent of adults aged 18 years and older who have obesity'
and Age in ('35 - 44', '45 - 54', '55 - 64')
group by LocationAbbr, LocationDesc, Topic, Question
order by avg_per_year desc;

-- Estados con menos actividad física --
select LocationAbbr, LocationDesc, Topic, Question, avg(Data_Value) as avg_per_year, avg(Sample_Size) as avg_sample
from physical
where YearEnd >= 2013
and LocationDesc <> 'National'
and Class = 'Physical Activity'
and Question = 'Percent of adults who engage in no leisure-time physical activity'
and Age in ('35 - 44', '45 - 54', '55 - 64')
group by LocationAbbr, LocationDesc, Topic, Question
order by avg_per_year desc;

select LocationAbbr, LocationDesc, Topic, avg(Data_Value) as avg_per_year, avg(Sample_Size) as avg_sample
from physical
where YearEnd >= 2013
and LocationDesc <> 'National'
and Class = 'Fruits and Vegetables'
and Age in ('35 - 44', '45 - 54', '55 - 64')
group by LocationAbbr, LocationDesc, Topic
order by avg_per_year desc;

create table nyc_rests( select count(Name) as cant, year  from nyc_restaurants
WHERE (Name like '%donal%' or Name like '%unkin%' or Name like '%Burger King%'
or Name like '%TACO BELL%' or Name like '%KFC%' or Name like '%PIZZA HUT%' or Name like '%starbucks%'
or Name like '%subway%' or Name like '%wend%' or Name like '%domino%' or Name like '%chick-fil%'
or Name like '%chipotle%' or Name like '%five gu%'  or Name like '%arby%'
 or Name like '%papa jo%'  or Name like '%baskin%' or Name like '%pollo%'
 or Name like '%anne%' or Name like '%white castle%' or Name like '%shake%' or Name like '%ray%'
or Name like '%ray%' )
group by year
order by cant desc);

select Name, count(Name) as cant from nyc_restaurants

group by Name
order by cant desc;

select Name, count(Name) as cant, year from nyc_restaurants
group by Name, year
order by cant desc;

select Name, count(Name) as cant from nyc_restaurants
where `CUISINE DESCRIPTION` = 'American'
and Name like '%unkin%'
group by Name
order by cant desc;

select Name, count(Name) as cant from nyc_restaurants
where Name like '%popey%'
group by Name
order by cant desc;

select * from nyc_restaurants;

select Name, count(Name) as cant from nyc_restaurants
group by Name
order by cant desc;

create table restaurants(
select 'New York','New York County', Name, year from nyc_restaurants
union all
select 'Chicago','Cook County', Name, year from chicago_restaurants);
