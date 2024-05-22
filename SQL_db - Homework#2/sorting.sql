--Show all details from artists that have ‘e’ in their full name, ordered by date of birth by the oldest one to the youngest one
select * from artist_details ad  
where ad.full_name  like '%e%'
order by ad.date_of_birth asc;

--Show all non-explicit songs sorted by duration from shortest to longest
select * from song s 
where s.explicit =false 
order by s.duration asc;

--Show albums that have ‘u’ in their name sorted by rating, with worst rating on top
select * from album a 
where a."name" like '%u%'
order by a.rating asc;
