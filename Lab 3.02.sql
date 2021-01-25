-- Lab 3.02

use sakila;

select store.store_id, address.address, city.city, country.country
from store join address
on store.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id;

select store.store_id, sum(payment.amount)
from staff join payment
on staff.staff_id = payment.staff_id
join store
on store.store_id = staff.store_id
group by store.store_id;

select category.name, round(avg(film.length), 2) as avg_length
from category join film_category
on category.category_id = film_category.category_id
join film
on film_category.film_id = film.film_id
group by category.category_id
order by avg_length desc;

-- Sports films are the longest

select film.title, count(rental.inventory_id) as times_rented
from film join inventory
on film.film_id = inventory.film_id
join rental
on rental.inventory_id = inventory.inventory_id
group by rental.inventory_id
order by times_rented desc;

select category.name, sum(payment.amount) as total_amount
from category join film_category
on category.category_id = film_category.category_id
join film
on category.category_id = film.film_id
join inventory
on film.film_id = inventory.film_id
join rental
on rental.inventory_id = inventory.inventory_id
join payment
on rental.rental_id = payment.rental_id
group by category.name
order by total_amount desc
limit 5;

select film.title, count(*) as Total_copies
from film join inventory
on film.film_id = inventory.film_id
where film.title like "Academy Dinosaur" and inventory.store_id=1;

