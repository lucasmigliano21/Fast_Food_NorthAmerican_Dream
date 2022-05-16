create database proyecto;

select * from heart_diseases
limit 100;

select distinct Class from heart_diseases;

select LocationAbbr as State, sum(Data_Value) as Qty_per_100K from heart_diseases
where Stratification1 = 'Overall'
group by State
order by Qty_per_100K desc;

select LocationAbbr as State, LocationDesc as County, Data_Value as Qty_per_100K from heart_diseases
where Stratification1 = 'Overall'
order by Qty_per_100K desc;

 create table deaths(
select * from heart_diseases
where Stratification1 = 'Overall'
and Stratification2 = 'Overall'
and Data_Value <> 0);

select * from deaths;

select LocationAbbr as State, avg(Data_Value) as Qty_per_100K, count(distinct LocationDesc) as qty_counties from deaths
where Stratification1 = 'Overall'
group by State
order by Qty_per_100K desc;

select LocationAbbr as State, avg(Data_Value) as Qty_per_100K, count(distinct LocationDesc) as qty_counties from heart_diseases
where Stratification1 = 'Female'
group by State
order by Qty_per_100K desc;

select LocationAbbr, LocationDesc, max(Data_Value) as maximum from deaths
group by LocationAbbr, LocationDesc
order by maximum desc;

 create table deaths2(
select * from heart_diseases2
where Stratification1 = 'Overall'
and Stratification2 = 'Overall'
and Data_Value <> 0);

select * from  heart_diseases2;

select LocationAbbr as State, avg(Data_Value) as Qty_per_100K, count(distinct LocationDesc) as qty_counties from heart_diseases2
where Stratification1 = 'Female'
group by State
order by Qty_per_100K desc;

select LocationAbbr, LocationDesc, max(Data_Value) as maximum from heart_diseases
where Stratification1 = 'Female'
group by LocationAbbr, LocationDesc
order by maximum desc;

 create table deaths3(
select * from heart_diseases3
where Stratification1 = 'Overall'
and Stratification2 = 'Overall'
and Data_Value <> 0);

select * from deaths3;


create table total_deaths(
SELECT Year, LocationAbbr, LocationDesc, Data_Value, Data_Value_Unit from deaths
UNION 
SELECT Year, LocationAbbr, LocationDesc, Data_Value, Data_Value_Unit from deaths2
UNION
SELECT Year, LocationAbbr, LocationDesc, Data_Value, Data_Value_Unit from deaths3);

select * from total_deaths
where LocationAbbr = 'NY';

select * from total_deaths
where LocationAbbr = 'IL';

create table counties(
select LocationAbbr, count(distinct LocationDesc) as total from total_deaths
group by LocationAbbr
order by total desc);


select total_deaths.LocationAbbr, LocationDesc, avg(Data_Value) as avg_, counties.total from total_deaths
join counties on total_deaths.LocationAbbr = counties.LocationAbbr
group by LocationAbbr, LocationDesc, counties.total
order by avg_ desc;



select Year, LocationAbbr, LocationDesc, avg(Data_Value) as avg_ from total_deaths
group by Year, LocationAbbr, LocationDesc
order by avg_ desc;

select YearEnd, LocationAbbr, Data_Value, Sample_Size, Race_Ethnicity from physical
where Class = 'Obesity / Weight Status'
and Question = 'Percent of adults aged 18 years and older who have obesity'
order by YearEnd, LocationAbbr;

select * from physical;

select * from physical
where YearEnd >= 2013
and LocationDesc <> 'National'
and Class = 'Obesity / Weight Status'
and Question = 'Percent of adults aged 18 years and older who have obesity'
and Age in ('35 - 44', '45 - 54', '55 - 64');

select distinct YearEnd from physical;

select LocationAbbr, LocationDesc, Topic, Question, avg(Data_Value) as avg_per_year, avg(Sample_Size) as avg_sample
from physical
where YearEnd >= 2013
and LocationDesc <> 'National'
and Class = 'Obesity / Weight Status'
and Question = 'Percent of adults aged 18 years and older who have obesity'
and Age in ('35 - 44', '45 - 54', '55 - 64')
group by LocationAbbr, LocationDesc, Topic, Question
order by avg_per_year desc;

select LocationAbbr, LocationDesc, avg(Data_Value) as avg_per_state from total_deaths
group by LocationAbbr, LocationDesc
order by avg_per_state desc;

select LocationAbbr, LocationDesc, Topic, Question, avg(Data_Value) as avg_per_year, avg(Sample_Size) as avg_sample
from physical
where YearEnd >= 2013
and LocationDesc <> 'National'
and Class = 'Physical Activity'
and Question = 'Percent of adults who engage in no leisure-time physical activity'
and Age in ('35 - 44', '45 - 54', '55 - 64')
group by LocationAbbr, LocationDesc, Topic, Question
order by avg_per_year desc;

select * from physical
where Class = 'Fruits and Vegetables';

select LocationAbbr, LocationDesc, Topic, avg(Data_Value) as avg_per_year, avg(Sample_Size) as avg_sample
from physical
where YearEnd >= 2013
and LocationDesc <> 'National'
and Class = 'Fruits and Vegetables'
and Age in ('35 - 44', '45 - 54', '55 - 64')
group by LocationAbbr, LocationDesc, Topic
order by avg_per_year desc;