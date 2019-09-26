-- It's important to be able to understand what code does just be looking at it,
-- because sometimes you might have to look at someone else's work and understand 
-- what it does, and use then use it.

-- Look at the following queries and describe in your own words what it does - 
-- Eg. ('Return title and film ID of films with a rental rate less than $6') 
-- Eg. ('Creates a list of films that cost less than $6 to rent.')

SELECT c.name, COUNT(f.film_id) as total
FROM film as f
JOIN film_category AS fc  ON f.film_id=fc.film_id
JOIN category AS c ON fc.category_id=c.category_id
GROUP BY c.category_id
ORDER BY total DESC ;


SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);


SELECT title, film_id
FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film);


SELECT title, film_id
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);


SELECT payment_date 
From payment
WHERE payment_date > '2007-05-01'
ORDER BY payment_date DESC;


SELECT payment_id, payment_date
From payment
WHERE amount < 3;


SELECT customer_id, email, active
From customer
WHERE store_id = 1 AND active = 0
ORDER BY last_update;


SELECT customer_id, SUM(amount)
FROM payment 
WHERE customer_id IN (SELECT customer_id
						From customer
						WHERE store_id = 1 AND active = 0
						ORDER BY last_update)
GROUP BY customer_id;


SELECT c.category_id, COUNT(f.film_id) as total
FROM film as f
    JOIN film_category as c
    ON f.film_id=c.film_id
GROUP BY c.category_id
ORDER BY total DESC ;




