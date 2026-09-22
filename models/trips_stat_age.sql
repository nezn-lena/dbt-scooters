with age_date as
	(select 
		(extract(epoch from (t.started_at-u.birth_date)) / 60/60/24/365) ::int as age
		--, extract(year from t.started_at) - extract(year from u.birth_date) as age
		, t.started_at::date as date
		, count(t.id) as trips
		--, max(t.price)/100 as max_price_rub
		--, avg(t.distance)/1000 as avg_distance_km
	from 
		scooters_raw.trips t
	join 
		scooters_raw.users u on t.user_id = u.id 
	group by 
		1,2)

select 
	age
	, avg(trips) as avg_trips_dn
from 
	age_date
group by  
	1
order by 
	1
	