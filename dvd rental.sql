-- SELECT c.first_name, c.last_name, p.amount
-- FROM customer c
-- JOIN payment p ON c.customer_id = p.customer_id;

-- SELECT f.title, l.name
-- FROM film f
-- JOIN language l ON f.language_id = l.language_id;

-- SELECT c.customer_id, c.first_name, c.last_name, r.rental_date
-- FROM customer c
-- LEFT JOIN rental r ON c.customer_id = r.customer_id;

-- SELECT c.customer_id, c.first_name, c.last_name, p.payment_id, p.amount
-- FROM customer c
-- LEFT JOIN payment p ON c.customer_id = p.customer_id;

-- SELECT c.customer_id, c.first_name, c.last_name, p.payment_id, p.amount
-- FROM customer c
-- FULL OUTER JOIN payment p ON c.customer_id = p.customer_id;

-- SELECT store_id, COUNT(customer_id)
-- FROM customer
-- GROUP BY store_id;

-- SELECT customer_id, SUM(amount)
-- FROM payment
-- GROUP BY customer_id;

-- SELECT customer_id, AVG(amount)
-- FROM payment
-- GROUP BY customer_id;

-- SELECT c.first_name, c.last_name, SUM(p.amount)
-- FROM customer c
-- JOIN payment p ON c.customer_id = p.customer_id
-- GROUP BY c.customer_id, c.first_name, c.last_name;

-- SELECT c.first_name, c.last_name, SUM(p.amount)
-- FROM customer c
-- JOIN payment p ON c.customer_id = p.customer_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- ORDER BY SUM(p.amount) DESC
-- LIMIT 5;

-- select first_name , last_name ,email
-- from staff

-- select sum(amount)
-- from payment

-- select f.title ,f.rental_rate ,length ,l.name
-- from film f join language l on f.language_id = l.language_id

-- select f.title ,f.release_year ,c.name
-- from film f join film_category fc on f.film_id = fc.film_id
-- join category c on fc.category_id = c.category_id


-- select c.first_name ,c.last_name , count(r.rental_id)
-- from customer c right join rental r
-- on c.customer_id = r.customer_id
-- group by c.customer_id 
-- order by first_name



-- select c.first_name ,c.last_name , r.rental_id
-- from customer c left join rental r
-- on c.customer_id = r.customer_id
-- where c.customer_id=600
-- order by first_name

-- select * from customer
-- where customer_id=600

-- INSERT INTO customer (     store_id,     first_name,     last_name,     email,     address_id )VALUES (     1,     'Yahya',     'Afifi',     'yahya@example.com',     5);

-- alter table rental 
-- alter column customer_id drop not null

-- INSERT INTO rental (
--     rental_date,
--     inventory_id,
--     customer_id,
--     staff_id
-- )
-- VALUES
--     (NOW(), 1, NULL, 1),
--     (NOW(), 2, NULL, 1);

-- select c.first_name ,c.last_name ,co.country
-- from customer c join address d on c.address_id = d.address_id
-- join city cy on cy.city_id = d.city_id
-- join country co on co.country_id = cy.country_id




-- select c.first_name ,c.last_name ,co.country
-- from customer c join address d on c.address_id = d.address_id
-- join city cy on cy.city_id = d.city_id
-- join country co on co.country_id = cy.country_id


-- select  co.country 
-- from country co
-- left join city cy on co.country_id = cy.country_id
-- left join address d on cy.city_id = d.city_id
-- left join customer c on c.address_id = d.address_id
-- GROUP BY co.country, co.country_id
-- HAVING COUNT(c.customer_id) = 0 
--    AND co.country IS NOT NULL;

-- SELECT DISTINCT co.country
-- FROM country co
-- LEFT JOIN city cy ON co.country_id = cy.country_id
-- LEFT JOIN address a ON cy.city_id = a.city_id
-- LEFT JOIN customer c ON a.address_id = c.address_id
-- WHERE c.customer_id IS NULL;



-- SELECT co.country
-- FROM country co
-- FULL JOIN city cy ON co.country_id = cy.country_id
-- FULL JOIN address a ON cy.city_id = a.city_id
-- FULL JOIN customer c ON a.address_id = c.address_id
-- GROUP BY co.country, co.country_id
-- HAVING COUNT(c.customer_id) = 0 
--    AND co.country IS NOT NULL;

-- select * from film , staf

-- with customer_total_payment as(
-- select customer_id, sum(amount) as total_payment
-- from payment
-- group by customer_id
-- )
-- select c.customer_id, first_name, last_name, total_payment
-- from customer c join customer_total_payment ctp
-- on c.customer_id = ctp.customer_id
-- order by c.customer_id

-- with rental_rental as (select i.film_id, count(r.rental_id) as rental_count
-- from inventory i join rental r
-- on i.inventory_id = r.inventory_id
-- group by i.film_id)
-- select f.film_id, title, rental_count
-- from film f join rental_rental rr
-- on f.film_id = rr.film_id
-- where rental_count>20
-- order by f.film_id


-- select title 
-- from film 
-- where length>(select avg(length) from film)


-- select first_name, last_name, email
-- from customer
-- where customer_id in (
-- select customer_id from payment where amount>10)

-- select title, category_id, length
-- from film f join (
-- select film_id, fg category_id  
-- from film_category fg join category c
-- on fg.category_id = c.category_id
-- ) as cc
-- on f.film_id = cc.film_id
-- where length > (select avg(length) from film)


-- select f.title, fc.category_id, f.length
-- from film f
-- join film_category fc on f.film_id = fc.film_id
-- where f.length > (
--     select avg(f2.length)
--     from film f2
--     join film_category fc2 on f2.film_id = fc2.film_id
--     where fc2.category_id = fc.category_id
-- )

-- select c.customer_id, first_name, last_name, sum(amount)
-- from customer c join payment p 
-- on c.customer_id = p.customer_id
-- group by c.customer_id, first_name, last_name
-- order by c.customer_id


-- create view customer_payment as 
-- select c.customer_id, first_name, last_name, sum(amount)
-- from customer c join payment p 
-- on c.customer_id = p.customer_id
-- group by c.customer_id, first_name, last_name
-- order by c.customer_id

-- select * from customer_payment
-- select * from actor_info

-- create or replace  view film_film as
-- select f.film_id, f.title, f.rental_rate, c.name
-- from film f join film_category fc 
-- on f.film_id = fc.film_id
-- join category c
-- on c.category_id = fc.category_id
-- order by rental_rate desc


-- select * from film_film order by rental_rate desc

-- drop view film_film


-- update staff set active = true where staff_id =1

-- create procedure block_staff ()
-- language plpgsql
-- as $$
-- begin
-- update staff set active = false where staff_id =1 ;
-- end;
-- $$;

-- create or replace procedure block_staff(staffid int)
-- language plpgsql
-- as $$
-- begin
-- update staff set active = false where staff_id =staffid ;
-- end;
-- $$;

-- call block_staff(1)

-- select* from language

-- insert into language 
-- (language_id, name)
-- values
-- (
-- (7),
-- ('Arbic')
-- )

-- update language 
-- set name='Arabic'
-- where language_id = 7

-- create or replace procedure add_language(languageid int, name1 varchar(100))
-- language plpgsql
-- as $$
-- begin
-- insert into language 
-- (language_id, name)
-- values
-- (
-- (languageid),
-- (name1)
-- );

-- end ;
-- $$;

-- call add_language(9,'Ardo')

-- select * from language



create user khaled
with password '1234'

select * from pg_roles

grant select on actor to khaled


grant select, insert, delete, update on actor to khaled

revoke select, insert, delete, update on actor from khaled

grant select, insert on actor to khaled

select customer_id, sum(amount)
from payment
group by customer_id, amount
order by customer_id


select customer_id, amount, sum(amount) over( partition by customer_id) as total_amount
from payment 
order by customer_id




 
select customer.customer_id, first_name, last_name, amount, sum(amount) over( partition by payment.customer_id) as total_amount,count(customer.customer_id) over(partition by payment.customer_id) as count_payments
from payment join customer 
on payment.customer_id = customer.customer_id
order by customer.customer_id



select f.title, c.name, f.length, round(avg(length) over(partition by c.category_id),2) as category_avarge, 
count(c.category_id) over(partition by c.category_id) as count_of
from film f join film_category fc
on f.film_id = fc.film_id
join category c
on c.category_id = fc.category_id
where length > 90
order by c.category_id


select * from film where length > 90




select f.title, c.name, f.length, round(avg(length) over(partition by c.category_id),2) as category_avarge, 
count(c.category_id) over(partition by c.category_id) as count_of
from film f join film_category fc
on f.film_id = fc.film_id
join category c
on c.category_id = fc.category_id
where f.film_id in (select film_id from film where length > 90)
order by c.category_id


with film_data as (
select f.title, c.name, f.length, round(avg(length) over(partition by c.category_id),2) as category_avarge, 
count(c.category_id) over(partition by c.category_id) as count_of
from film f join film_category fc
on f.film_id = fc.film_id
join category c
on c.category_id = fc.category_id
order by c.category_id
)
select * from film_data where length > category_avarge




select customer.customer_id, first_name, last_name, amount, round(sum(amount) over( partition by payment.customer_id),2) as total_amount,
round(sum(amount) over( partition by payment.customer_id order by payment_id),2)as runing_total, count(customer.customer_id) over(partition by payment.customer_id) as count_payments
from payment join customer 
on payment.customer_id = customer.customer_id
order by customer.customer_id



select customer.customer_id, first_name, last_name, amount, round(sum(amount) over( partition by payment.customer_id),2) as total_amount,
round(sum(amount) over( partition by payment.customer_id order by payment_id),2)as runing_total,
row_number() over(partition by payment.customer_id order by amount),
rank() over(partition by payment.customer_id order by amount),
dense_rank() over(partition by payment.customer_id order by amount),
count(customer.customer_id) over(partition by payment.customer_id) as count_payments
from payment join customer 
on payment.customer_id = customer.customer_id
order by customer.customer_id, amount



with raccked_bayment as(
select customer.customer_id, first_name, last_name, amount, round(sum(amount) over( partition by payment.customer_id),2) as total_amount,
round(sum(amount) over( partition by payment.customer_id order by payment_id),2)as runing_total,
row_number() over(partition by payment.customer_id order by amount) as rn,
rank() over(partition by payment.customer_id order by amount),
dense_rank() over(partition by payment.customer_id order by amount),
count(customer.customer_id) over(partition by payment.customer_id) as count_payments
from payment join customer 
on payment.customer_id = customer.customer_id
)
select * from raccked_bayment 
where rn <=3
order by customer_id, amount, rn

















