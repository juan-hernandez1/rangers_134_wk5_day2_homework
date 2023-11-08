-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
SELECT *
FROM payment
WHERE amount >= 3.99 AND amount <= 5.99
ORDER BY amount;

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id) AS Occurences
FROM inventory
GROUP BY film_id
ORDER BY Occurences DESC;

-- 4. How many customers have the last name ‘William’?
SELECT last_name, first_name
FROM customer
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id) AS Occurences
FROM rental
GROUP BY staff_id
ORDER BY Occurences DESC;

-- 6. How many different district names are there?
SELECT DISTINCT(district)
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id) AS Occurences
FROM film_actor
GROUP BY film_id
ORDER BY Occurences DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT *
FROM customer
WHERE last_name LIKE '%es' AND store_id = '1';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(rental_id) AS rental_count
FROM payment
WHERE rental_id IN (
    SELECT rental_id
    FROM rental
    WHERE customer_id BETWEEN 380 AND 430
)
GROUP BY amount
HAVING COUNT(rental_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating
ORDER BY movie_count DESC;