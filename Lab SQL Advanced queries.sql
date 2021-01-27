use sakila;
-- Q1
with pairs as (
select fa1.actor_id as actor1_id, fa2.actor_id as actor2_id from film_actor fa1
join film_actor fa2
on fa1.film_id = fa2.film_id
and fa1.actor_id <> fa2.actor_id
and fa1.actor_id <  fa2.actor_id
limit 500)
select concat( a1.first_name , " ", a1.last_name) as Actor1, concat(a2.first_name , " ", a2.last_name) as Actor2
from pairs join actor a1 on pairs.actor1_id =a1.actor_id
join actor a2 on pairs.actor2_id = a2.actor_id;


-- Q2
with total_no_films as (
select actor_id as film_actor_id, count(*) as no_films from film_actor
group by film_actor_id),
ranked_by_film as (
select *, rank () over (partition by film_id order by film_id, no_films desc) as ranks 
from film_actor join total_no_films 
on film_actor.actor_id = total_no_films.film_actor_id)
select film.title, concat(actor.first_name, " ", actor.last_name) as name, ranked_by_film.no_films
from ranked_by_film join actor 
on ranked_by_film.actor_id = actor.actor_id
join film
on ranked_by_film.film_id = film.film_id
where ranks = 1
order by title
;