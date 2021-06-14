use rpm;

select item,
		location,
		action_date,
		round(selling_retail,2),
		case
		when selling_retail_prev is null
			then ''
			else round(selling_retail_prev,2)
		end selling_retail_prev,
		case
		when selling_retail - selling_retail_prev is null
			then ""
			else round(selling_retail - selling_retail_prev,2)
		end difference
from
(select item,
		location,
		action_date,
		selling_retail,
		lag(selling_retail) over(partition by item, location order by action_date) as selling_retail_prev
from rpm_future_retail) t
