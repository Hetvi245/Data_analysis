-- making the data uniform
with cte as 
(
SELECT *
from bike_share_yr_0
union 
select *
from bike_share_yr_1
)

select 
DATE_FORMAT(STR_TO_DATE(dteday, '%m/%d/%Y'), '%Y-%m-%d') as dteday, season, t1.yr, `weekday`, hr, rider_type, riders, price, COGS, riders*price as revenue, riders*price - COGS as profit
from cte as t1
left join cost_table as t2
on t1.yr = t2.yr;
