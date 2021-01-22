-- Lab 2.8
use sakila;
select title, length, rank() over (order by length desc) from film having not length = 0; -- not sure on how to find nulls
select title, length, rating, rank() over (partition by rating order by length desc) from film;
select category_id, count(*) from film_category group by category_id;
-- SELECT film_id.film, Customers.CustomerName, Orders.OrderDate FROM Orders INNER JOIN film_id ON film_id.film_category=film_id.film;
select actor.first_name, actor.last_name, actor.actor_id, film_actor.film_id, count(*) 
from actor inner join film_actor 
ON actor.actor_id=film_actor.actor_id 
group by actor_id order by count(*) desc;

select customer.first_name, customer.last_name, customer.customer_id, count(*) 
from rental inner join customer 
ON customer.customer_id = rental.customer_id 
group by customer_id order by count(*) desc;

select film.title, count(*) 
from film 
inner join inventory
ON film.film_id = inventory.film_id
inner join rental
on inventory.inventory_id = rental.inventory_id
group by film.title order by count(*) desc;


