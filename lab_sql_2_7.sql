USE sakila;

-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT film_category.category_id, name, COUNT(film_id) from sakila.film_category
JOIN sakila.category ON category.category_id=film_category.category_id
GROUP BY category_id;

-- 2 Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id, SUM(amount), left(payment_date,7) AS "payment_month" from sakila.payment
WHERE left(payment_date,7)="2005-08"
GROUP BY staff_id;

-- 3 Which actor has appeared in the most films?
-- Gina Degeneres

SELECT actor.actor_id, first_name, last_name, COUNT(film_actor.film_id) AS "number_of_films" FROM sakila.actor
JOIN sakila.film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor_id
ORDER BY number_of_films DESC;

-- 4 Most active customer (the customer that has rented the most number of films)
-- Eleanor Hunt
SELECT customer.customer_id, first_name, last_name, COUNT(rental_id) AS "number_of_rentals" FROM sakila.customer
JOIN sakila.rental ON rental.customer_id = customer.customer_id
GROUP BY customer_id
ORDER BY number_of_rentals DESC;

-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address FROM sakila.address
JOIN sakila.staff ON address.address_id = address.address_id;

-- 6 List each film and the number of actors who are listed for that film.
SELECT DISTINCT(title), COUNT(actor_id) AS "number_of_actors" from sakila.film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP by title;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer.
--   List the customers alphabetically by last name.
SELECT customer.customer_id, first_name, last_name, SUM(amount) AS "total_payments" FROM sakila.customer
JOIN sakila.payment ON payment.customer_id = customer.customer_id
GROUP BY customer_id
ORDER BY last_name ASC;


