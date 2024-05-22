--List all artist names and artist full names without duplicates
select  "name" from artist a 
union
select full_name from artist_details ad;

--List all artist names and artist full names with duplicates
select "name" as artist_name from artist a 
union all
select full_name as artist_fullname from artist_details ad ;

--List all common artist names and artist full names
select "name" from artist a 
intersect
select full_name from artist_details ad; 
