use rpm;

select *
from
(
select	*,
		row_number() over(partition by item, location order by action_date desc) as rn
from rpm_future_retail
) t
where rn = 1
