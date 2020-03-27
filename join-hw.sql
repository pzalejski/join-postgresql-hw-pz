--list all customers who live in Texas
SELECT customer.first_name,customer.last_name,address, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas'



--get all payements above $6.99 with the customer's full name
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount >= 6.99;



--using joins find all customers that have made a total of over $80.00 in payments
SELECT customer.first_name,customer.last_name,sum(payment.amount)
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name,customer.last_name
HAVING sum(payment.amount) >= 80.00;



--list all customers that live in Nepal
SELECT customer.*, address.district, country.country
FROM customer
INNER JOIN address
on address.address_id = customer.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal';



-- Which staff member has the most transactions
SELECT staff.first_name, staff.last_name, count(payment.staff_id) AS Total_Transactions
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY Total_Transactions DESC
LIMIT 1;



--How many movies of each rating are there
SELECT rating, count(rating) AS Num_of_movies
FROM film
GROUP BY rating
ORDER BY count(rating) DESC;



--how much money has customer_id 75 spend with us so far?
SELECT customer.customer_id,customer.first_name,customer.last_name, sum(payment.amount)
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.customer_id = 75
GROUP BY customer.customer_id, customer.first_name,customer.last_name;



--how many free rentals did our stores give away?
SELECT rental.*, payment.amount
FROM rental
LEFT JOIN payment
ON rental.rental_id = payment.rental_id
WHERE payment.amount = 0;

SELECT amount, count(amount)
FROM payment
WHERE amount = 0
GROUP BY amount;





