--Show all album names and it’s rating
select a.name as album_name, a.rating as album_rating from album a ;

--Show all artists with their name and full name side by side
select a.name as artist_name, ad.full_name as artist_fullname from artist a 
join artist_details ad 
on a.id=ad.artist_id ;

--Show all songs with their lyrics side by side
select s.name as sdong_name, sl.lyrics as song_lyrics from song s 
join song_lyrics sl 
on s.id = sl.song_id ;

--Show artist names with album names side by side
select a.name as artist_name, a2.name as album_name from artist a 
join song s 
on s.artist_id =a.id 
join album a2 
on s.artist_id =a2.id;


--Show the artist names and their spouse name for all artists including ones that don’t have details
select a.name as artist_name, ad.spouse_name as spouse_name from artist a 
left join artist_details ad 
on a.id = ad.artist_id ;

--Show artist names and list of countries for all, including missing artist and missing details info
select a.name as artist_name, ad.country as artist_country from artist a 
full join artist_details ad 
on a.id = ad.artist_id ;

--List all song names with genre names
select s.name as song_name, g.name as genre_name from song s 
cross join genre g ;

--List all song names with playlist names
select s.name as song_name, p.title as playlist from song s 
join playlists_songs ps 
on s.id =ps.song_id 
join playlist p 
on p.id = ps.playlist_id ;

--List all album names and rating that have rating above 4 with the artist name
select a.name as artist_name, a2.name as album_name, a2.rating as album_rating from artist a 
join song s 
on s.artist_id =a.id 
join album a2 
on s.artist_id =a2.id
where a2.rating <4;

--List all explicit song names and artist names without missing data
select  s.name as song_name, a.name as artist_name from song s 
join artist a 
on a.id =s.artist_id 
where s.explicit =true;



