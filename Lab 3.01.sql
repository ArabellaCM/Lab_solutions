-- Lab 3.01
use sakila;
select category.name, count(*)
from category
join film_category
on film_category.category_id = category.category_id
group by film_category.category_id
order by count(*) desc;

select staff.first_name, staff.last_name, address.address, address.address2, address.district, address.postal_code
from staff join address 
on staff.address_id = address.address_id;

select staff.first_name, staff.last_name, sum(payment.amount)
from staff join payment
on staff.staff_id = payment.staff_id
where month(payment.payment_date) = 8 and year(payment.payment_date) = 2005
group by staff.staff_id;

select film.title, count(*) as number_actors
from film join film_actor
on film.film_id = film_actor.film_id
group by film.film_id
order by count(*) desc;

select customer.last_name, customer.first_name, sum(amount)
from customer join payment
on customer.customer_id = payment.customer_id
group by customer.customer_id
order by customer.last_name;

