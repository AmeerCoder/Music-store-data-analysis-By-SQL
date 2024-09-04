--Q1: Who is the most senior employee based on the job title?

select * from employee 
order by levels desc limit 1

--Q2: which countries have most invoices?

select count(*) as c , billing_country 
from invoice
group by billing_country
order by c desc limit 1

--Q3: what are top 3 values of total incoice?
select total from invoice
order by total desc limit 

--Q4: which city has the best customers? We would like to throw a promotional Music Festival in the 
--city we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
--Return both the city name & sum of all invoice totals.
select sum (total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc

--Q5: Who is the best customer? the customer who has spent the most money will declared the best cutomer.
--Write a query that returns the person who has spent monsy.
select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
Join invoice on customer.customer_id =invoice.customer_id
group by customer.customer_id
order by total desc
limit 1






