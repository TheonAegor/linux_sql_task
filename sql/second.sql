use rpm;
with zone_loc(item, zone) as
(select 
		r.item,
		z.zone_id as zone
from rpm_future_retail r inner join rpm_zone_location z
on r.location = z.location)

select * 
from rpm_zone_future_retail zr
where item not in (select item
				from zone_loc z
				where z.zone = zr.zone);
