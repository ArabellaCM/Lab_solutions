-- Lab Aggregation Revisited - Sub queries

use sakila;

select first_name, last_name, email from customer;

select concat(c.first_name, " ", c.last_name) as full_name, avg(p.amount) as average_amt from customer c
join payment p
on c.customer_id = p.customer_id
group by c.customer_id;

select concat(c.first_name, " ", c.last_name) as full_name, c.email
from customer c
join rental r
on c.customer_id = r.customer_id
join inventory i
on i.inventory_id = r.inventory_id
join film_category fc
on i.film_id = fc.film_id
join category ca
on fc.category_id = ca.category_id
where ca.name = "Action"
group by c.email;

select concat(first_name, " ", last_name) as full_name, email
from customer where customer_id in(
select customer_id from rental where inventory_id in
(select inventory_id from inventory where film_id in
(select film_id from film_category where category_id in
(select category_id from category where name ="Action"))));

select *,
case 
when amount between 0 and 2 then "low"
when amount between 2 and 4 then "medium"
when amount > 4 then "high" 
else "unknown" 
end as trans_value 
from payment;

with cte_trans as (
select *,
case 
when avg_amount between 0 and 2 then "low"
when avg_amount between 2 and 4 then "medium"
when avg_amount > 4 then "high" 
else "unknown" 
end as trans_value 
from(
select customer_id, avg(amount) as avg_amount from payment 
group by customer_id) sub1)
select concat(c.first_name, " ", c.last_name) as full_name, c.email, ct.trans_value 
from customer c
join cte_trans ct on c.customer_id = ct.customer_id where c.customer_id in(
select customer_id from rental where inventory_id in
(select inventory_id from inventory where film_id in
(select film_id from film_category where category_id in
(select category_id from category where name ="Action"))))
;