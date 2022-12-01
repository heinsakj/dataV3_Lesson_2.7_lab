USE sakila;

-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

SELECT * -- category_id to get the category
FROM category;
SELECT *
From film_category; -- category_id to get the id and film

SELECT c.name, COUNT(c.category_id) AS 'No_films_in_category'
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.category_id
ORDER BY COUNT(c.category_id) DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.alter
-- rung up = TOTAL amount that each staff member has put into the cashier? How much money did each staff member put into the cashier. How much in money did they rent out
SELECT * 
FROM staff;
-- JOIN ON STAFF_ID
SELECT * 
FROM payment;

SELECT p.staff_id, SUM(p.amount) AS 'total_amount'
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-30'
GROUP BY staff_id
ORDER BY SUM(amount);

-- 3. Which actor has appeared in the most films?
SELECT * 
FROM film_actor;
-- JOIN ON actor_id
SELECT *
FROM actor;

SELECT fa.actor_id, COUNT(fa.film_id)
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(film_id) DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT *
FROM customer;
-- JOIN ON customer_id
SELECT *
FROM rental;

SELECT r.customer_id, COUNT(r.rental_id)
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
GROUP BY r.customer_id
ORDER BY COUNT(r.rental_id) DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT *
FROM staff;
-- JOIN ON address_id
SELECT *
FROM address;

SELECT s.first_name, s.last_name, s.address_id, a.address AS 'address'
FROM staff s
JOIN address a
ON s.address_id = a.address_id;
-- 6. List each film and the number of actors who are listed for that film.
SELECT * 
FROM film;
-- JOIN ON film_id
SELECT *
FROM film_actor;
-- JOIN ON actor_id
SELECT * 
FROM actor;

SELECT fi.title, f.film_id, COUNT(f.actor_id) AS 'no.ActorsInMovie'
FROM film fi
JOIN film_actor f
ON fi.film_id = f.film_id
JOIN actor a
ON f.actor_id = a.actor_id
GROUP BY f.film_id
ORDER BY COUNT(f.actor_id) DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT *
FROM payment;
-- JOIN ON customer_id
SELECT *
FROM customer;

SELECT p.customer_id, c.last_name, SUM(p.amount) AS 'sum_paid_p_customer'
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name ASC;

-- 8. List number of films per category.
SELECT * 
FROM film_category;
-- JOIN ON category_id
SELECT *
FROM category;

SELECT c.name, COUNT(fc.category_id) AS 'category'
FROM film_category fc
JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY COUNT(fc.category_id) DESC;
-- same as number 1