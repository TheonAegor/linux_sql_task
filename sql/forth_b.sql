use rpm;

with tab as (select item,
					zone_id,
					selling_retail
from 
(select item,
		t.location,
		selling_retail,
		zone_id,
		row_number() over(partition by item, t.location order by action_date desc) as rn
from rpm_future_retail t inner join rpm_zone_location z
on t.location = z.location) t
where rn = 1
group by item, zone_id 
)
select distinct *,
		price_zone_1 - price_zone_2 as difference
from (
select	item,
		(select selling_retail
		from tab inner_tab
		where inner_tab.zone_id = 1
		and inner_tab.item = outer_tab.item) as PRICE_ZONE_1,
		(select selling_retail
		from tab inner_tab
		where inner_tab.zone_id = 2
		and inner_tab.item = outer_tab.item) as PRICE_ZONE_2
from tab outer_tab
) t
where price_zone_1 is not null and price_zone_2 is not null;
