--Show all details for artists born before 01-04-1992
select * from artist_details ad 
where ad.date_of_birth < '1992-04-01';

--Show all details for artists from Germany
select * from artist_details ad 
where ad.country = 'Germany';

--Show all songs longer than 4 minutes
select * from song s 
where s.duration > '4 minutes';

--Show all explicit songs
select  * from song s 
where s.explicit = true;

--Show all genres having ‘o’ in the name
select * from genre g 
where g."name" like '%o%';

--Show all lyrics having the word ‘that’
select * from song_lyrics sl 
where sl.lyrics like '%that%';
