/*
date — дата начала поездки (день).
trips — количество поездок за этот день.
max_price_rub — максимальная стоимость поездки за день в рублях.
avg_distance_km — средняя дальность поездки за день в километрах.
*/

select 
	started_at::date as date
	, count(id) as trips
	, max(price)/100 as max_price_rub
	, avg(distance)/1000 as avg_distance_km
from 
	scooters_raw.trips
group by 
	1
--having 
--	count(id) < 1000
order by
    1