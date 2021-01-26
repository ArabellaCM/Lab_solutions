-- Lab 3.03
use sakila;

-- Q1
select a1.first_name, a1.last_name, a2.first_name, a2.last_name from film_actor fa1
join film_actor fa2
on fa1.film_id = fa2.film_id
join sakila.actor a1
on fa1.actor_id = a1.actor_id
join sakila.actor a2
on fa2.actor_id = a2.actor_id
where fa1.actor_id <> fa2.actor_id
order by fa1.actor_id, fa2.actor_id;


-- Q2

drop table if exists temp2;
create temporary table temp2
select r1.customer_id as c_id_1, r2.customer_id as c_id_2, r1.inventory_id, rank() over(partition by r1.customer_id order by r2.customer_id) as RANKS
from rental r1 join rental r2
on r1.inventory_id = r2.inventory_id
join inventory i1
on r1.inventory_id = i1.inventory_id
join inventory i2
on r2.inventory_id = i2.inventory_id
where r1.inventory_id = r2.inventory_id 
and r1.customer_id <> r2.customer_id;

select c_id_1 as customer_1, c_id_2 as customer_2, count(*) as times_rented_same_film from temp2
group by c_id_1, c_id_2
having count(*) >2
order by times_rented_same_film desc;



-- Q3

select actor.first_name, actor.last_name, film.title
from actor cross join film;


