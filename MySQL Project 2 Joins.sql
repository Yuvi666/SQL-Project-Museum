-- use database 
create database pj2;
use pj2;
-- use painting;

-- show tables
select * from artist;
select * from canvas;
select * from image;
select * from museum;
select * from museum_hr;
select * from product;
select * from subject;
select * from work; 
-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.
select full_name,museum.name as museum_name ,work.name as art_name from artist left join work
on work.artist_id=artist.artist_id
left join museum
on
museum.museum_id=work.museum_id;


-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.
select full_name,count(work.name) as no_of_paintings from artist 
inner join work on
artist.artist_id=work.artist_id
group by full_name
order by no_of_paintings desc;



-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.
select museum.name,count(work.name) as work_count from museum inner join work on 
museum.museum_id=work.museum_id group by museum.name order by work_count desc limit 5;






-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.
select work.name,work.style, museum.name from work join museum on work.museum_id=museum.museum_id  order by museum.name  limit 10;





-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.
select artist.full_name, sum(sale_price) as total_sale_price from work 
left join artist on work.artist_id=artist.artist_id
left join product on work.work_id=product.work_id group by artist.full_name order by total_sale_price desc;





-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.
select a.full_name,count(w.name) as total_works from artist as a 
join work as w on a.artist_id=w.artist_id 
group by a.full_name having total_works > 3 ; 




-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
select w.name,a.full_name from work as w 
join artist as a on w.artist_id=a.artist_id 
join product as p on w.work_id=p.work_id where sale_price < regular_price; 




-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.
select avg(c.width) as avg_width, avg(c.height) as avg_height from canvas as c  
right join product as p on c.size_id=p.size_id; 




-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.
select max(p.sale_price)as max_sale_price, m.name from product as p 
right join work as w on p.work_id=w.work_id 
left join museum as m on w.museum_id=m.museum_id group by m.name order by max_sale_price desc ;   



-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.
SELECT CONCAT(first_name, ' ', last_name, ', ', nationality) AS artist_info,
       COUNT(*) AS work_count
FROM artist
JOIN work ON artist.artist_id = work.artist_id
GROUP BY artist_info
ORDER BY work_count DESC;
 




