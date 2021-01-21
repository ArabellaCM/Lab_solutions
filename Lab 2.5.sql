use sakila;
SELECT * FROM sakila.actor where first_name="Scarlett";
select count(distinct film_id) from film;
select count(distinct inventory_id) from rental;
select time_format(time(length), "%H %i") from film;
select floor(avg(length)/60) as hours, (avg(length)-60*floor(avg(length)/60)) as minutes from film;
select count(distinct last_name) from actor;
select datediff(max(rental_date), min(rental_date)) from rental;
select *, date_format(rental_date, "%M") as rental_month, date_format(rental_date, "%W") as rental_day from rental limit 20;
select *, date_format(rental_date, "%W") as rental_day, case
when date_format(rental_date, "%W") = "Saturday" or "Sunday" then "Weekend"
else "Weekday"
end as day_type 
from rental;
select count(*) where (year(rental_date) = year(max(rental_date)))and month(rental_date) = month(max(rental_date))) from rental;
-- This doesn't work