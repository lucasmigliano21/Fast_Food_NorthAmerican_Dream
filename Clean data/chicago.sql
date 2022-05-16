select Name, count(Name) as cant, year from chicago_restaurants
group by Name, year
order by cant desc;

select count(Name) as cant, year from chicago_restaurants
group by year
order by year asc;

select count(Name) as cant, year from chicago_restaurants
where Name like '%Subway%'
group by year
order by year asc;

create table complete(
select 'diabetes', Qty_Adults, Year from diabetes
union all
select 'fruits', Qty_Adults, Year from fruits
union all
select 'hipertensión', Qty_Adults, Year from hiper
union all
select 'inactivity', Qty_Adults, Year from inactivity
union all 
select 'obesity', Qty_Adults, Year from obesity
union all
select 'soda', Qty_Adults, Year from soda
union all
select 'smoking', Qty_Adults, Year from smoking
);

select * from metrics;

select * from metricas;
DELETE FROM metricas WHERE metric='metric';

select 'Chicago', metric, 2014,2015,2016,2017,2018 from metricas;

DELETE FROM complete WHERE metric='metric';

select * from income_tabla;
DELETE FROM income_tabla WHERE City='City';

select * from           population_tabla;
DELETE FROM population_tabla WHERE City='City';

select * from chicago_restaurants;

ALTER TABLE `chicago_restaurants`
DROP COLUMN `City`;

ALTER TABLE `proyecto`.`chicago_restaurants` 
ADD COLUMN `City2` VARCHAR(45) NULL DEFAULT 'Chicago' AFTER `year`;

ALTER TABLE `proyecto`.`chicago_restaurants` 
CHANGE COLUMN `City2` `City` VARCHAR(45) NULL DEFAULT 'Chicago' ;

select * from soda
;

DELETE FROM metrics WHERE metric='metric';


ALTER TABLE `proyecto`.`complete` 
ADD COLUMN `Chicago` VARCHAR(45) NULL DEFAULT 'Chicago' after `City`;

SELECT * FROM rates;
DELETE FROM rates WHERE metric='metric';