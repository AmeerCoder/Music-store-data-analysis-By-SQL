Question Set 2

--Q1:Write a query to return the email , first name ,last name,& Genre of all Rock Music listeners.
--Return your list ordered alphabetically by email starting with A.

select distinct email,first_name,last_name
from customer
Join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id IN(
	select track_id from track 
	join genre on track.genre_id=genre.genre_id
	where genre.name like 'Rock'
)
Order by email;

--Q2: lets invite the artists who have writtenthe most rock musi in our dataset. 
--Write a query that returns the Artist name and total track count of the top 10 rock  bands.

select artist.artist_id ,artist.name,count(artist.artist_id )As number_of_songs
From track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
Where genre.name LIKE 'Rock'
Group by artist.artist_id
order by number_of_songs desc
limit 10;

--Q3: Return all the track names that have a song length longer than the average song length.
--Return the Name and miliseconds for each track. Order by the song length with the longest songs listed first.

select name,milliseconds 
from track 
where milliseconds >(
	select avg (milliseconds )As avg_track_length
	From track)
Order by milliseconds Desc;










	