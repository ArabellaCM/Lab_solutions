

-- Lab Q1

create or replace view user_activity as
select customer_id, date(rental_date),
date_format(rental_date, '%m') as Activity_Month,
date_format(convert(rental_date,date), '%Y') as Activity_year
from rental;

select activity_year, activity_month, count(distinct customer_id) as monthly_users
FROM user_activity
group by 1, 2
order by 1, 2;

-- Lab Q2

with cte_activity as (
  select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month, Activity_year, Activity_month
  from Monthly_active_users
)
select * from cte_activity
where last_month is not null;

-- Lab Q3

with cte_activity as (
  select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month, Activity_year, Activity_month
  from Monthly_active_users
)
select *, round(((Active_users - last_month) / active_users)*100)  as percentage_change from cte_activity
where last_month is not null;

-- Lab Q4


with distinct_users as (
  select distinct customer_id , Activity_month, Activity_year, Activity_month +1
  from user_activity
)
select count(distinct d1.customer_id) as Retained_customers, d1.Activity_month, d1.Activity_year
from distinct_users d1
join distinct_users d2
on d1.customer_id = d2.customer_id and d1.activity_month = d2.activity_month + 1
group by d1.Activity_month, d1.Activity_year
order by d1.Activity_year, d1.Activity_month;