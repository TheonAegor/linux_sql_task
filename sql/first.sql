use rpm;
set autocommit = 0;
start transaction;
create view rpm_dupl as (
select *,
	row_number() over(partition by item, location, action_date) as dup
from rpm_future_retail f);
commit;
delete from rpm_future_retail 
where future_retail_id in (select future_retail_id
							from rpm_dupl
							where dup > 1);
commit;
