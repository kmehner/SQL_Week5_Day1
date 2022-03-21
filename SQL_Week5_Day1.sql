-- Question 1
select last_name, count(last_name)
from actor
where last_name = 'Wahlberg'
group by last_name 


-- Question 2
select COUNT (amount)
FROM payment 
WHERE amount between 3.99 and 5.99



-- Question 3
-- returning the film id for which the store has the most of and its count
select film_id, count(film_id)
from inventory  
group by film_id 
having count(film_id) = (
select max(mycount) as total
from (select film_id, count(film_id) mycount 
from inventory
group by film_id) as wow)


-- sorting by descending order and looking at the id, count at the top
select film_id, count(film_id) as filmed
from inventory 
group by film_id 
order by filmed desc



-- Question 4
-- checking for any last name with William (flexible ending)

select last_name, count(last_name)
from customer 
where last_name like 'William%'
group by last_name 

-- making sure there is no William (empty output)
select last_name, count(last_name)
from customer 
where last_name like 'William'
group by last_name 



-- Question 5
-- viewing the sales of the staff then seeing who had the most 
select staff_id, count(rental_id)
from rental
group by staff_id 
limit 1

-- returning the staff id and his count for the employee who sold the MOST 
select staff_id, count(rental_id) from rental group by staff_id 
having count(rental_id) = (
select max(mycount) 
from (select staff_id, count(rental_id) mycount from rental group by staff_id ) as wow)



-- Question 6
select count(distinct district)
from address



-- Question 7
-- grouping films by their id and listing in order of most count(actors) to least
select film_id, count(actor_id) as actor
from film_actor 
group by film_id 
order by actor desc
limit 1




-- Question 8 
select count(customer_id)
from customer
where store_id = 1 and last_name like '%es' 


-- Question 9
select amount
from payment 
where customer_id between 380 and 430
group by amount
having count(rental_id) > 250



-- Question 10

-- Counting distinct occurrences of the rating (5) ie. how many categories there are
select count(distinct rating)
from film 


select rating, count(rating)
from film
group by rating 
order by count(rating) desc
limit 1  -- limits the output to 1


-- the more complicated way 

-- selecting the ratings and count 
select rating, mycount as total
from (select rating, count(rating) mycount
from film
group by rating) as thisishelp


-- displaying the ratings and count where the count with == MAX(count(rating))
select rating, count(rating)
from film 
group by rating 
having count(rating) = (
select max(mycount) as total
from (select rating, count(rating) mycount
from film
group by rating) as thisishelp)









