-- LAB 2.6
use sakila;
select distinct release_year from film;
select * from film where title like "%Armageddon%";
select * from film where title like "%Apollo";
select * from film order by length desc limit 10;
select * from film where special_features like "%Behind the scene%";
alter table staff drop column picture;
select * from customer where first_name = "Tammy";
insert into staff (staff_id, first_name, last_name, address_id, email, store_id, username) values (3, "TAMMY", "SANDERS", "79", "TAMMY.SANDERS@sakilacustomer.org", 2, "Tammy");
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select film_id from film where title="Academy Dinosaur";
select inventory_id from inventory where film_id=1 and store_id=1;
insert into rental (rental_date, customer_id, inventory_id, staff_id) values (curdate(), 130, 1, 1);
select distinct(active) from customer;
select * from customer where active = 0;
create table deleted_users ( custoemr_id int UNIQUE NOT NULL, email varchar(255) UNIQUE NOT NULL, delete_date date);
insert into deleted_users select customer_id, email, curdate() from customer where active = 0;
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS=1;

delete from customer wheSET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;
re active = 0;