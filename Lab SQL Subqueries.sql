use sakila;
-- Question 1
select inventory.inventory_id, inventory.film_id, film.title from inventory 
join film on inventory.film_id = film.film_id
where inventory.film_id = 
(
select film_id from film where title like "Hunchback Impossible");

-- Question 2
select film_id, title, length from film
where length >
	(select avg(length) from film)
order by length desc;

-- Question 3

-- version using join
-- select actor.first_name, actor.last_name, film.title, film.film_id
-- from film 
-- join film_actor on film.film_id = film_actor.film_id
-- join actor on film_actor.actor_id = actor.actor_id
-- where film.title like "Alone Trip";


select actor.first_name, actor.last_name from actor where actor_id in
	(select actor_id from film_actor where film_id =
		(select film_id from film where title like "Alone Trip"));
        
	-- Question 4
    
select title from film where film_id in
(select film_id from film_category where category_id in
	(select category_id from category where name like "Family"));
    
-- Question 5    
select customer.first_name, customer.last_name, address.address from customer 
join address on address.address_id = customer.address_id
where customer.address_id in
	(select address_id from address where city_id in
		(select city_id from city where country_id =
			(select country_id from country where country = "Canada")));      
            
select customer.first_name, customer.last_name, address.address, city.city, country.country
from customer join address on address.address_id = customer.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id
where country.country like "Canada";

-- Question 6
select title from film where film_id in
( select film_id from film_actor where actor_id =
	(select actor_id from film_actor 
	group by actor_id
	order by count(*) desc 
    limit 1));
    
-- Question 7

select title from film where film_id in
(select film_id from inventory where inventory_id in
(select inventory_id from rental where customer_id =
(select customer_id from payment
group by customer_id
order by sum(amount) desc
limit 1)));

-- Question 8

select first_name, last_name from customer where customer_id in

	(select customer_id from payment group by customer_id having sum(amount) >
	(select avg(Total_amount) from
	(select sum(amount) as Total_amount from payment 
		group by customer_id) sub));
    



;
