-- Select everything and run the script
DROP TABLE IF EXISTS artist_details, song_lyrics, playlists_songs, songs_genres, song, playlist, genre, artist, album;

-- Artist table
CREATE TABLE artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Artist Details table (One-to-One relationship with artist)
CREATE TABLE artist_details (
    id SERIAL PRIMARY KEY,
    date_of_birth DATE NOT NULL,
    full_name VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    is_married BOOLEAN DEFAULT false NOT NULL,
    spouse_name VARCHAR(100),
    artist_id INT UNIQUE REFERENCES artist(id)
);

-- Album table
CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    rating DECIMAL CHECK(rating >= 0 AND rating <= 5)
);

-- Song table
CREATE TABLE song (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INTERVAL NOT NULL,
    explicit BOOLEAN DEFAULT false NOT NULL,
    artist_id INT REFERENCES artist(id),
    album_id INT REFERENCES album(id)
);

-- Song Lyrics table (One-to-One relationship with songs)
CREATE TABLE song_lyrics (
    id SERIAL PRIMARY KEY,
    lyrics TEXT NOT NULL,
    song_id INT UNIQUE REFERENCES song(id)
);

-- Playlist table
CREATE TABLE playlist (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100)
);

-- Playlist_Songs table (Many-to-Many relationship between playlists and songs)
CREATE TABLE playlists_songs (
    playlist_id INT REFERENCES playlist(id),
    song_id INT REFERENCES song(id),
    PRIMARY KEY (playlist_id, song_id)
);

-- Genre table
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Songs_Genres table (Many-to-Many relationship between songs and genres)
CREATE TABLE songs_genres (
    song_id INT REFERENCES song(id),
    genre_id INT REFERENCES genre(id),
    PRIMARY KEY (song_id, genre_id)
);

INSERT INTO artist (name) VALUES 
('Eminem'),
('Dua Lipa'),
('Tose Proeski'),
('Rihanna'),
('Taylor Swift'),
('David Guetta'),
('Shakira'),
('Drake'),
('Severina'),
('Zdravko Colic'),
('Adele'),
('The Weeknd'),
('Goran Bregovic'),
('Ceca'),
('Jelena Karleusa'),
('Saban Saulic'),
('Beyonce'),
('Coldplay'),
('Ed Sheeran'),
('Sia'),
('Bruce Springsteen'),
('Ariana Grande'),
('Miles Davis'),
('Sezen Aksu'),
('Saban Bajramovic'),
('Iron Maiden'),
('Lepa Brena'),
('Kygo'),
('Moby'),
('Arctic Monkeys'),
('Hozier'),
('Nina Simone'),
('Halid Beslic'),
('Dino Merlin'),
('Amira Medunjanin'),
('Kendrick Lamar'),
('Billie Eilish'),
('Daft Punk'),
('Lewis Capaldi'),
('Post Malone'),
('Edyta Bartosiewicz'),
('Mela Koteluk'),
('Monika Brodka'),
('Maria Peszek'),
('Doda');

INSERT INTO artist_details (date_of_birth, full_name, country, city, is_married, spouse_name, artist_id) VALUES 
('1972-10-17', 'Marshall Bruce Mathers III', 'USA', 'St Joseph', false, NULL, 1),
('1995-08-22', 'Dua Lipa', 'England', 'London', false, NULL, 2),
('1981-01-25', 'Todor Tose Proeski', 'Macedonia', 'Prilep', false, NULL, 3),
('1988-02-20', 'Robyn Rihanna Fenty', 'Barbados', 'Saint Michael', true, 'ASAP Rocky', 4),
('1989-12-13', 'Taylor Alison Swift', 'USA', 'Reading', false, NULL, 5),
('1967-11-07', 'Pierre David Guetta', 'France', 'Paris', true, 'Jessica Ledon', 6),
('1977-02-02', 'Shakira Isabel Mebarak Ripoll', 'Colombia', 'Barranquilla', true, 'Gerard Pique', 7),
('1986-10-24', 'Aubrey Drake Graham', 'Canada', 'Toronto', false, NULL, 8),
('1972-04-21', 'Severina Vuckovic', 'Croatia', 'Split', true, 'Igor Kojic', 9),
('1951-05-30', 'Zdravko Colic', 'Bosnia and Herzegovina', 'Sarajevo', false, NULL, 10),
('1988-05-05', 'Adele Laurie Blue Adkins', 'England', 'London', false, NULL, 11),
('1990-02-16', 'Abel Makkonen Tesfaye', 'Canada', 'Toronto', false, NULL, 12),
('1950-03-22', 'Goran Bregovic', 'Bosnia and Herzegovina', 'Sarajevo', true, 'Dzenana Sudzuka', 13),
('1973-06-14', 'Svetlana Raznatovic', 'Serbia', 'Belgrade', false, NULL, 14),
('1978-08-17', 'Jelena Karleusa Tosic', 'Serbia', 'Belgrade', true, 'Dusko Tosic', 15),
('1951-09-06', 'Saban Saulic', 'Serbia', 'Sabac', true, 'Gordana Saulic', 16),
('1981-09-04', 'Beyonce Giselle Knowles-Carter', 'USA', 'Houston', true, 'Jay-Z', 17),
('1977-03-02', 'Christopher Anthony John Martin', 'England', 'Exeter', false, NULL, 18),
('1991-02-17', 'Edward Christopher Sheeran', 'England', 'Halifax', true, 'Cherry Seaborn', 19),
('1975-12-18', 'Sia Kate Isobelle Furler', 'Australia', 'Adelaide', false, NULL, 20),
('1949-09-23', 'Bruce Frederick Joseph Springsteen', 'USA', 'Long Branch', true, 'Patti Scialfa', 21),
('1993-06-26', 'Ariana Grande Butera', 'USA', 'Boca Raton', false, NULL, 22),
('1926-05-26', 'Miles Dewey Davis III', 'USA', 'Alton', true, 'Cicely Tyson', 23),
('1954-07-13', 'Fatma Sezen Yildirim', 'Turkey', 'Denizli', false, NULL, 24),
('1936-04-16', 'Saban Bajramovic', 'Serbia', 'Nis', true, 'Stamenka Bajramovic', 25),
('1957-12-25', 'Stephen Percy Harris', 'England', 'Leytonstone', true, 'Lorraine Harris', 26),
('1960-10-20', 'Fahreta Zivojinovic', 'Bosnia and Herzegovina', 'Tuzla', true, 'Bobo Zivojinovic', 27),
('1991-09-11', 'Kyrre Gorvell Dahll', 'Norway', 'Singapore', false, NULL, 28),
('1965-09-11', 'Richard Melville Hall', 'USA', 'Harlem', false, NULL, 29),
('2002-01-06', 'Alex Turner', 'England', 'Sheffield', false, NULL, 30),
('1990-03-17', 'Andrew John Hozier Byrne', 'Ireland', 'Bray', false, NULL, 31),
('1933-02-21', 'Eunice Kathleen Waymon', 'USA', 'Tryon', false, NULL, 32),
('1953-11-20', 'Halid Beslic', 'Bosnia and Herzegovina', 'Knezina', true, 'Sejda Beslic', 33),
('1962-09-12', 'Edin Dervishalidovic', 'Bosnia and Herzegovina', 'Sarajevo', true, 'Amela Dervishalidovic', 34),
('1972-03-23', 'Amira Medunjanin', 'Bosnia and Herzegovina', 'Sarajevo', false, NULL, 35),
('1987-06-17', 'Kendrick Lamar Duckworth', 'USA', 'Compton', true, 'Whitney Alford', 36),
('2001-12-18', 'Billie Eilish Pirate Baird OConnell', 'USA', 'Los Angeles', false, NULL, 37),
('1974-01-03', 'Thomas Bangalter', 'France', 'Paris', true, 'Elodie Bouchez', 38),
('1996-10-07', 'Lewis Capaldi', 'Scotland', 'Bathgate', false, NULL, 39),
('1995-07-04', 'Austin Richard Post', 'USA', 'Syracuse', false, NULL, 40),
('1980-01-13', 'Artur Rojek', 'Poland', 'Warsaw', false, NULL, null),
('1990-02-01', 'Peter Fox', 'Germany', 'Berlin', false, NULL, null);


INSERT INTO album (name, rating) VALUES 
('The Eminem Show', 4.5),
('Future Nostalgia', 4.7),
('The Hardest Way', 4.8),
('Good Girl Gone Bad', 4.6),
('Folklore', 4.9),
('Nothing but the Beat', 4.3),
('Oral Fixation', 4.2),
('Scorpion', 4.8),
('Halo', 3.9),
('Ti si mi u krvi', 4.7),
('25', 4.8),
('After Hours', 4.9),
('Silent Wedding', 4.1),
('Autogram', 4.0),
('Diva', 3.7),
('Dva galeba bela', 4.5),
('Lemonade', 4.9),
('A Head Full of Dreams', 4.4),
('Divide', 4.8),
('This Is Acting', 4.5),
('Born in the U.S.A.', 4.8),
('Thank U, Next', 4.7),
('Kind of Blue', 4.9),
('Gulumse', 4.5),
('A Gypsy Legend', 4.6),
('Fear of the Dark', 4.7),
('Mile voli disko', 4.3),
('Cloud Nine', 4.4),
('Play', 4.5),
('AM', 4.6),
('Hozier', 4.7),
('I Put a Spell on You', 4.8),
('Romanija', 4.1),
('Sredinom', 4.5),
('Amulette', 4.2),
('DAMN.', 4.9),
('When We All Fall Asleep, Where Do We Go?', 4.8),
('Discovery', 4.7),
('Divinely Uninspired to a Hellish Extent', 4.3),
('Hollywoods Bleeding', 4.5),
('Fados do Fado', 4.2),
('O Melhor de Amalia Rodrigues', 4.7),
('Fado em Mim', 4.5),
('Desfado', 4.3),
('Canta Fado', 4.0),
('Senhora da Noite', 4.6),
('Fado Tradicional', 4.4),
('Pelo Dia Dentro', 4.1),
('Rumo ao Sul', 4.3),
('Mulher do Norte', 4.2);


-- Updating the songs table to include album_id
INSERT INTO song (name, duration, explicit, artist_id, album_id) VALUES 
('Lose Yourself', '5 minutes 26 seconds', true, 1, 1),
('New Rules', '3 minutes 31 seconds', false, 2, 2),
('Jedina', '4 minutes 4 seconds', false, 3, 3),
('Umbrella', '4 minutes 35 seconds', false, 4, 4),
('Love Story', '3 minutes 55 seconds', false, 5, 5),
('Titanium', '4 minutes 5 seconds', false, 6, 6),
('Hips Dont Lie', '3 minutes 38 seconds', false, 7, 7),
('Gods Plan', '3 minutes 19 seconds', true, 8, 8),
('Italiana', '4 minutes 13 seconds', false, 9, 9),
('Ti si mi u krvi', '5 minutes 46 seconds', false, 10, 10),
('Hello', '4 minutes 55 seconds', false, 11, 11),
('Blinding Lights', '3 minutes 22 seconds', false, 12, 12),
('Kalashnikov', '4 minutes 22 seconds', false, 13, 13),
('Trepni', '4 minutes 6 seconds', false, 14, 14),
('Insomnia', '4 minutes 28 seconds', true, 15, 15),
('Dva Galeba Bela', '4 minutes 15 seconds', false, 16, 16),
('Halo', '3 minutes 45 seconds', false, 17, 17),
('Paradise', '4 minutes 38 seconds', false, 18, 18),
('Shape of You', '3 minutes 54 seconds', false, 19, 19),
('Chandelier', '3 minutes 36 seconds', false, 20, 20),
('Born to Run', '4 minutes 31 seconds', false, 21, 21),
('7 Rings', '2 minutes 58 seconds', true, 22, 22),
('So What', '9 minutes 22 seconds', false, 23, 23),
('Tukenecegiz', '5 minutes 2 seconds', false, 24, 24),
('Djelem Djelem', '3 minutes 45 seconds', false, 25, 25),
('Fear of the Dark', '7 minutes 18 seconds', false, 26, 26),
('Jugoslovenka', '4 minutes 47 seconds', false, 27, 27),
('Firestone', '4 minutes 33 seconds', false, 28, 28),
('Porcelain', '4 minutes 1 second', false, 29, 29),
('Do I Wanna Know', '4 minutes 32 seconds', false, 30, 30),
('Take Me to Church', '4 minutes 1 second', false, 31, 31),
('Feeling Good', '2 minutes 53 seconds', false, 32, 32),
('Miljacka', '3 minutes 50 seconds', false, 33, 33),
('Sve je laz', '4 minutes 11 seconds', false, 34, 34),
('Moj Dilbere', '3 minutes 15 seconds', false, 35, 35),
('HUMBLE.', '2 minutes 57 seconds', true, 36, 36),
('Bad Guy', '3 minutes 14 seconds', true, 37, 37),
('One More Time', '5 minutes 20 seconds', false, 38, 38),
('Someone You Loved', '3 minutes 2 seconds', false, 39, 39),
('Circles', '3 minutes 35 seconds', false, 40, 40),
('Without Me', '4 minutes 50 seconds', true, 1, 1),
('Stan', '6 minutes 44 seconds', true, 1, 1),
('Beautiful', '4 minutes 05 seconds', true, 1, 1),
('Break My Heart', '3 minutes 42 seconds', false, 2, 2),
('Physical', '3 minutes 13 seconds', false, 2, 2),
('Hallucinate', '3 minutes 29 seconds', false, 2, 2),
('Karolina', '4 minutes 15 seconds', false, 3, 3),
('Pratim te', '4 minutes 22 seconds', false, 3, 3),
('Soba za tugu', '4 minutes 08 seconds', false, 3, 3),
('We Found Love', '3 minutes 35 seconds', false, 4, 4),
('Diamonds', '3 minutes 45 seconds', false, 4, 4),
('Rude Boy', '3 minutes 42 seconds', false, 4, 4),
('You Belong With Me', '3 minutes 52 seconds', false, 5, 5),
('Cardigan', '4 minutes 00 seconds', false, 5, 5),
('Wildest Dreams', '3 minutes 40 seconds', false, 5, 5),
('She Wolf', '3 minutes 12 seconds', false, 6, 6),
('Memories', '3 minutes 30 seconds', false, 6, 6),
('Flames', '3 minutes 15 seconds', false, 6, 6),
('Whenever, Wherever', '3 minutes 16 seconds', false, 7, 7),
('Waka Waka', '3 minutes 22 seconds', false, 7, 7),
('La Tortura', '3 minutes 33 seconds', false, 7, 7),
('One Dance', '2 minutes 54 seconds', true, 8, 8),
('Hotline Bling', '4 minutes 27 seconds', true, 8, 8),
('In My Feelings', '3 minutes 38 seconds', true, 8, 8),
('Brad Pitt', '3 minutes 20 seconds', false, 9, 9),
('Tarapana', '3 minutes 36 seconds', false, 9, 9),
('Gas Gas', '3 minutes 28 seconds', false, 9, 9),
('Kao Moja Mati', '4 minutes 46 seconds', false, 10, 10),
('Stanica Podlugovi', '4 minutes 30 seconds', false, 10, 10),
('Dajte Da Pijemo', '4 minutes 48 seconds', false, 10, 10),
('Set Fire to the Rain', '4 minutes 02 seconds', false, 11, 11),
('Rolling in the Deep', '3 minutes 48 seconds', false, 11, 11),
('Water Under the Bridge', '4 minutes 00 seconds', false, 11, 11),
('Save Your Tears', '3 minutes 36 seconds', false, 12, 12),
('The Hills', '4 minutes 03 seconds', false, 12, 12),
('Can''t Feel My Face', '3 minutes 34 seconds', false, 12, 12),
('In the Deathcar', '4 minutes 18 seconds', false, 13, 13),
('Ederlezi', '4 minutes 45 seconds', false, 13, 13),
('Maki Maki', '3 minutes 55 seconds', false, 13, 13),
('Zuta Minuta', '3 minutes 25 seconds', false, 14, 14),
('Nagovori', '4 minutes 05 seconds', false, 14, 14),
('Maskarada', '3 minutes 59 seconds', false, 14, 14),
('Jednom Kad Nam Dodju Svi', '3 minutes 58 seconds', false, 15, 15),
('Magla', '4 minutes 16 seconds', false, 15, 15),
('Nije Mi Nista', '3 minutes 56 seconds', false, 15, 15),
('Samo Me Nebo Rastavit Moze', '4 minutes 24 seconds', false, 16, 16),
('Iza Njih', '4 minutes 06 seconds', false, 16, 16),
('Sve Sto Znam', '4 minutes 28 seconds', false, 16, 16),
('Formation', '3 minutes 26 seconds', false, 17, 17),
('Single Ladies', '3 minutes 13 seconds', false, 17, 17),
('Crazy in Love', '3 minutes 56 seconds', false, 17, 17),
('Fix You', '4 minutes 55 seconds', false, 18, 18),
('The Scientist', '5 minutes 10 seconds', false, 18, 18),
('Yellow', '4 minutes 28 seconds', false, 18, 18),
('Perfect', '4 minutes 23 seconds', false, 19, 19),
('Castle on the Hill', '4 minutes 21 seconds', false, 19, 19),
('Galway Girl', '2 minutes 50 seconds', false, 19, 19),
('Cheap Thrills', '3 minutes 44 seconds', false, 20, 20),
('Elastic Heart', '4 minutes 17 seconds', false, 20, 20),
('Unstoppable', '3 minutes 38 seconds', false, 20, 20),
('Dancing in the Dark', '4 minutes 02 seconds', false, 21, 21),
('Glory Days', '4 minutes 15 seconds', false, 21, 21),
('Born in the U.S.A.', '4 minutes 39 seconds', false, 21, 21),
('No Tears Left to Cry', '3 minutes 25 seconds', true, 22, 22),
('Breathin', '3 minutes 18 seconds', true, 22, 22),
('Positions', '2 minutes 52 seconds', true, 22, 22),
('So What', '9 minutes 22 seconds', false, 23, 23),
('Blue in Green', '5 minutes 37 seconds', false, 23, 23),
('Freddie Freeloader', '9 minutes 49 seconds', false, 23, 23),
('Vazgecemem', '4 minutes 35 seconds', false, 24, 24),
('Gulumse', '4 minutes 14 seconds', false, 24, 24),
('Keske', '3 minutes 55 seconds', false, 24, 24),
('I Can See You', '4 minutes 12 seconds', false, 25, 25),
('Hey Boy Hey Girl', '5 minutes 20 seconds', false, 25, 25),
('El Camino', '3 minutes 48 seconds', false, 25, 25),
('The Trooper', '4 minutes 11 seconds', false, 26, 26),
('Run to the Hills', '3 minutes 54 seconds', false, 26, 26),
('Aces High', '4 minutes 31 seconds', false, 26, 26),
('Mile voli disko', '3 minutes 26 seconds', false, 27, 27),
('Jorgovani', '4 minutes 16 seconds', false, 27, 27),
('Nema vise vremena', '3 minutes 46 seconds', false, 27, 27),
('Firestone', '4 minutes 33 seconds', false, 28, 28),
('Stole the Show', '3 minutes 41 seconds', false, 28, 28),
('Born to be Yours', '3 minutes 12 seconds', false, 28, 28),
('Porcelain', '4 minutes 01 seconds', false, 29, 29),
('Natural Blues', '4 minutes 13 seconds', false, 29, 29),
('Lift Me Up', '3 minutes 57 seconds', false, 29, 29),
('Do I Wanna Know', '4 minutes 32 seconds', false, 30, 30),
('Arabella', '3 minutes 29 seconds', false, 30, 30),
('Snap Out of It', '3 minutes 13 seconds', false, 30, 30),
('Take Me to Church', '4 minutes 01 seconds', false, 31, 31),
('From Eden', '4 minutes 43 seconds', false, 31, 31),
('Cherry Wine', '4 minutes 00 seconds', false, 31, 31),
('Feeling Good', '2 minutes 53 seconds', false, 32, 32),
('I Put a Spell on You', '2 minutes 35 seconds', false, 32, 32),
('Sinnerman', '10 minutes 22 seconds', false, 32, 32),
('Miljacka', '3 minutes 50 seconds', false, 33, 33),
('Ja sam jarac', '4 minutes 05 seconds', false, 33, 33),
('Romanija', '4 minutes 10 seconds', false, 33, 33),
('Sredinom', '4 minutes 45 seconds', false, 34, 34),
('Kokuzna Vremena', '4 minutes 22 seconds', false, 34, 34),
('Lazu Me', '4 minutes 18 seconds', false, 34, 34),
('Amulette', '4 minutes 02 seconds', false, 35, 35),
('Dare', '3 minutes 40 seconds', false, 35, 35),
('Stani Zora', '4 minutes 13 seconds', false, 35, 35),
('HUMBLE.', '2 minutes 57 seconds', true, 36, 36),
('DNA.', '3 minutes 06 seconds', true, 36, 36),
('LOVE.', '3 minutes 33 seconds', true, 36, 36),
('Bad Guy', '3 minutes 14 seconds', true, 37, 37),
('bury a friend', '3 minutes 13 seconds', true, 37, 37),
('all the good girls go to hell', '2 minutes 48 seconds', true, 37, 37),
('One More Time', '5 minutes 20 seconds', false, 38, 38),
('Around the World', '7 minutes 10 seconds', false, 38, 38),
('Harder, Better, Faster, Stronger', '3 minutes 45 seconds', false, 38, 38),
('Someone You Loved', '3 minutes 2 seconds', false, 39, 39),
('Before You Go', '3 minutes 35 seconds', false, 39, 39),
('Hold Me While You Wait', '3 minutes 25 seconds', false, 39, 39),
('Circles', '3 minutes 35 seconds', false, 40, 40),
('Wow.', '2 minutes 29 seconds', false, 40, 40),
('Sunflower', '2 minutes 38 seconds', false, 40, 40),
('Vechernyaya Moskva', '4 minutes 12 seconds', false, null, null),
('Katyusha', '3 minutes 5 seconds', false, null, null),
('Podmoskovnye Vechera', '4 minutes 30 seconds', false, null, null),
('Kalinka', '2 minutes 56 seconds', false, null, null),
('Dorogoy Dlinnoyu', '4 minutes 21 seconds', false, null, null),
('Till I Collapse', '4 minutes 57 seconds', true, 1, 1),
('Without Me', '4 minutes 50 seconds', true, 1, 1),
('Mockingbird', '4 minutes 11 seconds', true, 1, 1),
('Levitating', '3 minutes 23 seconds', false, 2, 2),
('Don''t Start Now', '3 minutes 3 seconds', false, 2, 2),
('Hallucinate', '3 minutes 28 seconds', false, 2, 2),
('Dusha', '4 minutes 18 seconds', false, 3, 3),
('Sonce vo tvoite rusi kosi', '3 minutes 47 seconds', false, 3, 3),
('Tajno moja', '4 minutes 1 second', false, 3, 3),
('Rude Boy', '3 minutes 43 seconds', false, 4, 4),
('Only Girl (In the World)', '3 minutes 55 seconds', false, 4, 4),
('S&M', '4 minutes 3 seconds', true, 4, 4),
('You Belong with Me', '3 minutes 51 seconds', false, 5, 5),
('Blank Space', '3 minutes 52 seconds', false, 5, 5),
('Shake It Off', '3 minutes 39 seconds', false, 5, 5),
('Where Them Girls At', '3 minutes 14 seconds', false, 6, 6),
('Turn Me On', '3 minutes 19 seconds', false, 6, 6),
('Little Bad Girl', '3 minutes 14 seconds', false, 6, 6),
('Waka Waka (This Time for Africa)', '3 minutes 22 seconds', false, 7, 7),
('Try Everything', '3 minutes 16 seconds', false, 7, 7),
('Chantaje', '3 minutes 16 seconds', false, 7, 7),
('In My Feelings', '3 minutes 38 seconds', true, 8, 8),
('Hotline Bling', '4 minutes 27 seconds', true, 8, 8),
('Started from the Bottom', '2 minutes 53 seconds', true, 8, 8),
('Brad Pitt', '3 minutes 20 seconds', false, 9, 9),
('Tarapana', '3 minutes 36 seconds', false, 9, 9),
('Gas Gas', '3 minutes 28 seconds', false, 9, 9),
('Sviraj Sviraj', '4 minutes 10 seconds', false, 10, 10),
('Magla', '4 minutes 6 seconds', false, 10, 10),
('Zar je to sve sto imam od tebe', '3 minutes 45 seconds', false, 10, 10),
('Rolling in the Deep', '3 minutes 48 seconds', false, 11, 11),
('Someone Like You', '4 minutes 45 seconds', false, 11, 11),
('Set Fire to the Rain', '4 minutes 2 seconds', false, 11, 11),
('Blinding Lights', '3 minutes 22 seconds', false, 12, 12),
('Save Your Tears', '3 minutes 35 seconds', false, 12, 12),
('In Your Eyes', '3 minutes 57 seconds', false, 12, 12),
('Maki Maki', '3 minutes 55 seconds', false, 13, 13),
('Ederlezi', '4 minutes 45 seconds', false, 13, 13),
('Kalasnjikov', '4 minutes 22 seconds', false, 13, 13),
('Maskarada', '3 minutes 59 seconds', false, 14, 14),
('Caj za dvoje', '4 minutes 2 seconds', false, 14, 14),
('Nije ljubav stvar', '3 minutes 43 seconds', false, 14, 14),
('Insomnia', '4 minutes 28 seconds', true, 15, 15),
('Ljubomora', '4 minutes 12 seconds', false, 15, 15),
('Zena zmija', '3 minutes 56 seconds', false, 15, 15),
('Dva galeba bela', '4 minutes 15 seconds', false, 16, 16),
('Kralj cigana', '4 minutes 24 seconds', false, 16, 16),
('Samo me nebo rastavit moze', '4 minutes 32 seconds', false, 16, 16),
('Formation', '3 minutes 26 seconds', false, 17, 17),
('Halo', '3 minutes 44 seconds', false, 17, 17),
('Run the World (Girls)', '3 minutes 56 seconds', false, 17, 17),
('Paradise', '4 minutes 38 seconds', false, 18, 18),
('Hymn for the Weekend', '4 minutes 18 seconds', false, 18, 18),
('Adventure of a Lifetime', '4 minutes 23 seconds', false, 18, 18),
('Shape of You', '3 minutes 53 seconds', false, 19, 19),
('Galway Girl', '2 minutes 50 seconds', false, 19, 19),
('Perfect', '4 minutes 23 seconds', false, 19, 19),
('Chandelier', '3 minutes 36 seconds', false, 20, 20),
('Elastic Heart', '4 minutes 17 seconds', false, 20, 20),
('Cheap Thrills', '3 minutes 44 seconds', false, 20, 20),
('Born to Run', '4 minutes 31 seconds', false, 21, 21),
('Dancing in the Dark', '4 minutes 3 seconds', false, 21, 21),
('The River', '5 minutes 1 second', false, 21, 21),
('No Tears Left to Cry', '3 minutes 25 seconds', true, 22, 22),
('7 Rings', '2 minutes 58 seconds', true, 22, 22),
('Positions', '2 minutes 52 seconds', true, 22, 22),
('So What', '9 minutes 22 seconds', false, 23, 23),
('Freddie Freeloader', '9 minutes 49 seconds', false, 23, 23),
('Blue in Green', '5 minutes 37 seconds', false, 23, 23),
('Gulumse', '4 minutes 14 seconds', false, 24, 24),
('Keske', '3 minutes 55 seconds', false, 24, 24),
('Vazgecemem', '4 minutes 35 seconds', false, 24, 24),
('I Can See You', '4 minutes 12 seconds', false, 25, 25),
('El Camino', '3 minutes 48 seconds', false, 25, 25),
('Hey Boy Hey Girl', '5 minutes 20 seconds', false, 25, 25),
('Run to the Hills', '3 minutes 54 seconds', false, 26, 26),
('The Trooper', '4 minutes 11 seconds', false, 26, 26),
('Aces High', '4 minutes 31 seconds', false, 26, 26),
('Mile voli disko', '3 minutes 26 seconds', false, 27, 27),
('Jorgovani', '4 minutes 16 seconds', false, 27, 27),
('Nema vise vremena', '3 minutes 46 seconds', false, 27, 27),
('Firestone', '4 minutes 33 seconds', false, 28, 28),
('Stole the Show', '3 minutes 41 seconds', false, 28, 28),
('Born to be Yours', '3 minutes 12 seconds', false, 28, 28),
('Porcelain', '4 minutes 01 seconds', false, 29, 29),
('Natural Blues', '4 minutes 13 seconds', false, 29, 29),
('Lift Me Up', '3 minutes 57 seconds', false, 29, 29),
('Do I Wanna Know', '4 minutes 32 seconds', false, 30, 30),
('Arabella', '3 minutes 29 seconds', false, 30, 30),
('Snap Out of It', '3 minutes 13 seconds', false, 30, 30),
('Take Me to Church', '4 minutes 01 seconds', false, 31, 31),
('From Eden', '4 minutes 43 seconds', false, 31, 31),
('Cherry Wine', '4 minutes 00 seconds', false, 31, 31),
('Feeling Good', '2 minutes 53 seconds', false, 32, 32),
('I Put a Spell on You', '2 minutes 35 seconds', false, 32, 32),
('Sinnerman', '10 minutes 22 seconds', false, 32, 32),
('Miljacka', '3 minutes 50 seconds', false, 33, 33),
('Ja sam jarac', '4 minutes 05 seconds', false, 33, 33),
('Romanija', '4 minutes 10 seconds', false, 33, 33),
('Sredinom', '4 minutes 45 seconds', false, 34, 34),
('Kokuzna Vremena', '4 minutes 22 seconds', false, 34, 34),
('Lazu Me', '4 minutes 18 seconds', false, 34, 34),
('Amulette', '4 minutes 02 seconds', false, 35, 35),
('Dare', '3 minutes 40 seconds', false, 35, 35),
('Stani Zora', '4 minutes 13 seconds', false, 35, 35),
('HUMBLE.', '2 minutes 57 seconds', true, 36, 36),
('DNA.', '3 minutes 06 seconds', true, 36, 36),
('LOVE.', '3 minutes 33 seconds', true, 36, 36),
('Bad Guy', '3 minutes 14 seconds', true, 37, 37),
('bury a friend', '3 minutes 13 seconds', true, 37, 37),
('all the good girls go to hell', '2 minutes 48 seconds', true, 37, 37),
('One More Time', '5 minutes 20 seconds', false, 38, 38),
('Around the World', '7 minutes 10 seconds', false, 38, 38),
('Harder, Better, Faster, Stronger', '3 minutes 45 seconds', false, 38, 38),
('Someone You Loved', '3 minutes 2 seconds', false, 39, 39),
('Before You Go', '3 minutes 35 seconds', false, 39, 39),
('Hold Me While You Wait', '3 minutes 25 seconds', false, 39, 39),
('Circles', '3 minutes 35 seconds', false, 40, 40),
('Wow.', '2 minutes 29 seconds', false, 40, 40),
('Sunflower', '2 minutes 38 seconds', false, 40, 40),
('Vechernyaya Moskva', '4 minutes 12 seconds', false, null, null),
('Katyusha', '3 minutes 5 seconds', false, null, null),
('Podmoskovnye Vechera', '4 minutes 30 seconds', false, null, null),
('Kalinka', '2 minutes 56 seconds', false, null, null),
('Dorogoy Dlinnoyu', '4 minutes 21 seconds', false, null, null),
('Life is Good', '5 minutes 35 seconds', true, 8, null),
('Toosie Slide', '4 minutes 7 seconds', true, 8, null),
('Promiscuous', '4 minutes 2 seconds', true, 8, null),
('Dance Monkey', '3 minutes 30 seconds', false, null, 9),
('The Hills', '4 minutes 2 seconds', true, 12, 12),
('Can''t Feel My Face', '3 minutes 35 seconds', true, 12, null),
('Earned It', '4 minutes 37 seconds', true, 12, null),
('Thinking Out Loud', '4 minutes 41 seconds', false, 19, 19),
('Photograph', '4 minutes 19 seconds', false, 19, null),
('Castle on the Hill', '4 minutes 21 seconds', false, 19, null),
('Senza una donna', '4 minutes 27 seconds', false, 24, null),
('Father Figure', '5 minutes 38 seconds', false, 23, null),
('Faith', '3 minutes 14 seconds', false, 23, null),
('Freedom! ''90', '6 minutes 30 seconds', false, 23, null),
('Don''t Let the Sun Go Down on Me', '5 minutes 47 seconds', false, 23, null),
('Levitating', '3 minutes 23 seconds', false, 2, 2),
('Break My Heart', '3 minutes 41 seconds', false, 2, null),
('Cool', '3 minutes 29 seconds', false, 2, null),
('We Found Love', '3 minutes 35 seconds', false, 4, 4),
('Diamonds', '3 minutes 45 seconds', false, 4, 4),
('Stay', '3 minutes 59 seconds', false, 4, null),
('Everything I Wanted', '4 minutes 5 seconds', true, 37, null),
('Your Power', '4 minutes 5 seconds', true, 37, null),
('Ocean Eyes', '3 minutes 20 seconds', true, 37, null),
('New York State of Mind', '6 minutes 3 seconds', false, 32, 32),
('Piano Man', '5 minutes 37 seconds', false, 32, null),
('Uptown Girl', '3 minutes 15 seconds', false, 32, null),
('Vienna', '3 minutes 34 seconds', false, 32, null),
('Bad Romance', '4 minutes 54 seconds', false, 17, 17),
('Shallow', '3 minutes 35 seconds', false, 17, null),
('Poker Face', '3 minutes 57 seconds', false, 17, null),
('Born This Way', '4 minutes 20 seconds', false, 17, null),
('Alejandro', '4 minutes 34 seconds', false, 17, null),
('Hold My Hand', '4 minutes 8 seconds', false, 17, null),
('Thank U, Next', '3 minutes 27 seconds', true, 22, 22),
('7 rings', '2 minutes 59 seconds', true, 22, 22),
('God is a woman', '3 minutes 17 seconds', true, 22, null),
('Problem', '3 minutes 14 seconds', true, 22, null),
('Bang Bang', '3 minutes 19 seconds', true, 22, null),
('Side to Side', '3 minutes 46 seconds', true, 22, null),
('IDGAF', '3 minutes 38 seconds', true, 2, 2),
('New Rules', '3 minutes 29 seconds', true, 2, 2),
('Physical', '3 minutes 13 seconds', true, 2, null),
('Electricity', '3 minutes 58 seconds', true, 2, null),
('Be the One', '3 minutes 22 seconds', true, 2, null),
('Future Nostalgia', '3 minutes 4 seconds', true, 2, 2),
('Don''t Stop the Music', '4 minutes 27 seconds', true, 4, 4),
('Take a Bow', '3 minutes 49 seconds', true, 4, null),
('Pon de Replay', '4 minutes 7 seconds', true, 4, null),
('Disturbia', '3 minutes 58 seconds', true, 4, null),
('Rehab', '4 minutes 35 seconds', true, 4, null),
('SOS', '4 minutes 20 seconds', true, 4, null),
('Love on the Brain', '3 minutes 44 seconds', true, 4, 4),
('Shut Up and Drive', '3 minutes 34 seconds', true, 4, null),
('Bad Liar', '4 minutes 20 seconds', true, 12, 12),
('Heartless', '3 minutes 20 seconds', true, 12, null),
('False Alarm', '3 minutes 40 seconds', true, 12, null),
('Pray for Me', '3 minutes 31 seconds', true, 12, null),
('Starboy', '3 minutes 50 seconds', true, 12, 12),
('Out of Time', '3 minutes 22 seconds', true, 12, 12),
('Save Your Tears', '3 minutes 35 seconds', true, 12, 12),
('Can''t Feel My Face', '3 minutes 33 seconds', true, 12, 12),
('The Hills', '4 minutes 2 seconds', true, 12, 12),
('Blinding Lights', '3 minutes 22 seconds', true, 12, 12),
('Do I Wanna Know?', '4 minutes 31 seconds', false, 30, 30),
('Arabella', '3 minutes 27 seconds', false, 30, 30),
('R U Mine?', '3 minutes 21 seconds', false, 30, 30),
('Why''d You Only Call Me When You''re High?', '2 minutes 41 seconds', false, 30, 30),
('One for the Road', '3 minutes 20 seconds', false, 30, null),
('Snap Out of It', '3 minutes 13 seconds', false, 30, null),
('Knee Socks', '4 minutes 17 seconds', false, 30, null),
('No. 1 Party Anthem', '4 minutes 3 seconds', false, 30, null),
('I Wanna Be Yours', '3 minutes 4 seconds', false, 30, null),
('I Want It That Way', '3 minutes 33 seconds', false, null, null),
('Shape of You', '4 minutes 24 seconds', false, 19, 19),
('Galway Girl', '2 minutes 50 seconds', false, 19, 19),
('Perfect', '4 minutes 23 seconds', false, 19, null),
('Castle on the Hill', '4 minutes 21 seconds', false, 19, null),
('Photograph', '4 minutes 18 seconds', false, 19, null),
('All of Me', '4 minutes 30 seconds', false, 24, null),
('Ordinary People', '4 minutes 41 seconds', false, 24, null),
('Save Room', '3 minutes 55 seconds', false, 24, null),
('Green Light', '5 minutes 12 seconds', false, 24, null),
('You & I (Nobody in the World)', '4 minutes 12 seconds', false, 24, null),
('What Lovers Do', '3 minutes 19 seconds', false, 24, null),
('Like I''m Gonna Lose You', '3 minutes 45 seconds', false, 24, null),
('Glory', '4 minutes 32 seconds', false, 24, null),
('Can''t Help Falling in Love', '3 minutes 2 seconds', false, 35, null),
('Hallelujah', '4 minutes 12 seconds', false, 35, null),
('Say You Won''t Let Go', '3 minutes 31 seconds', false, 35, null),
('Let Her Go', '4 minutes 12 seconds', false, 35, null),
('Stay with Me', '2 minutes 52 seconds', false, 35, null),
('Stand by Me', '3 minutes 1 second', false, 35, null),
('Tears in Heaven', '4 minutes 36 seconds', false, 35, null),
('Tennessee Whiskey', '4 minutes 53 seconds', false, 35, null),
('If I Ain''t Got You', '3 minutes 48 seconds', false, 35, null),
('Gravity', '4 minutes 6 seconds', false, 35, null);

INSERT INTO song_lyrics (lyrics, song_id) VALUES 
('Look, if you had one shot, or one opportunity...', 1),
('Talking in my sleep at night, making myself crazy...', 2),
('Ti si meni jedina u dusi...', 3),
('Now that its raining more than ever, know that well still have each other...', 4),
('We were both young when I first saw you...', 5),
('You shout it out, But I cant hear a word you say...', 6),
('Ladies up in here tonight, No fighting, we got the refugees up in here...', 7),
('I been moving calm, dont start no trouble with me...', 8),
('Sama sam da nemam nikog, sve bih dala da si tu...', 9),
('Ti si mi u krvi, zivim da te volim...', 10),
('Hello, its me, I was wondering...', 11),
('Ive been tryna call, Ive been on my own for long enough...', 12),
('Moj je zivot Svicarska: Djosla bih no da nema, nesretna ljubav sto u Sarajevu...', 13),
('Baby, bice sve u redu, prolazna je ovo tuga...', 14),
('Lazu te, lazu te, o lazu te...', 15),
('Dva galeba bela, nocas slecu na Balkan...', 16),
('Remember those walls I built, Well, baby theyre tumbling down...', 17),
('When she was just a girl, She expected the world...', 18),
('The club isnt the best place to find a lover so the bar is where I go...', 19),
('Party girls dont get hurt, Cant feel anything, when will I learn...', 20),
('In the day we sweat it out on the streets of a runaway American dream...', 21),
('Yeah, breakfast at Tiffanys and bottles of bubbles...', 22),
('I go out walking, after midnight, out in the moonlight...', 23),
('Seni yazdim kalbime kara kalemle yarim...', 24),
('O Gurbet, moj dilbere...', 25),
('I am a man who walks alone, and when Im walking a dark road...', 26),
('Hej, Jugosloveni, zajedno smo jaci...', 27),
('Im a flame, youre a fire, Im the dark in need of light...', 28),
('In my dreams Im dying all the time...', 29),
('Have you got colour in your cheeks?...', 30),
('My lovers got humor, she is the giggle at a funeral...', 31),
('Birds flying high, you know how I feel...', 32),
('Kad prodjem bascom, zastane tisina...', 33),
('Dabogda umro da te ja ne vidim, dabogda umro...', 34),
('Moj dilbere, kud se seces...', 35),
('Nobody pray for me, It been that day for me...', 36),
('White shirt now red, my bloody nose...', 37),
('One more time, were gonna celebrate...', 38),
('Im going under, and this time I fear theres no one to save me...', 39),
('Seasons change and our love went cold...', 40),
('Despacito, quiero respirar tu cuello despacito...', NULL),
('Besame, besame mucho, como si fuera esta noche la ultima vez...', NULL),
('La vida es un carnaval y las penas se van cantando...', NULL),
('Eres tu, como una mañana de verano...', NULL),
('Vivir mi vida, la la la la...', NULL),
('La camisa negra, porque negra tengo el alma...', NULL),
('Bailando, bailando, amigos adios, adios el silencio loco...', NULL),
('La bamba, para bailar la bamba se necesita una poca de gracia...', NULL),
('Volvere, volvere a tus brazos otra vez...', NULL),
('Amor eterno e inolvidable...', NULL),
('Take me to church, I''ll worship like a dog...', 256),
('My lover''s got humor...', 257),
('She''s the giggle at a funeral...', 258),
('If I could only find the words...', 379),
('Oh, won''t you stay with me...', 382),
('Tears in heaven, would it be the same...', 384),
('You''re as smooth as Tennessee whiskey...', 385),
('If I ain''t got you, baby...', 386),
('Working on the weekend like usual...', 291),
('Black leather gloves, no sequins...', 292),
('You see us in the club goin'' all night...', 293),
('I can''t feel my face when I''m with you...', 296),
('You deserve to be appreciated, lady...', 297),
('When your legs don''t work like they used to before...', 298),
('We keep this love in a photograph...', 299),
('For all the times that you rain on my parade...', 300),
('Father figure, treat her like a mother...', 302),
('Freedom! Freedom! I can''t move...', 304),
('Some people want it all, but I don''t want nothing at all...', 370),
('Ordinary people, we don''t know which way to go...', 371),
('Save room for my love...', 372),
('We found love in a hopeless place...', 309),
('Shut up and drive, drive, drive...', 344),
('Why''d you only call me when you''re high...', 358),
('Snap out of it...', 360);

INSERT INTO playlist (title) VALUES 
('Workout Hits'),
('Soft Pop Hits'),
('Balkan Ballads'),
('Top Hits 2020'),
('Dance Floor Hits'),
('Classic Rock Favorites'),
('Ultimate Pop Playlist'),
('Jazz and Blues'),
('Balkan Beats'),
('Chill Vibes'),
('Listen on the road');

INSERT INTO playlists_songs (playlist_id, song_id) VALUES 
(1, 1),
(1, 6),
(1, 8),
(2, 2),
(2, 5),
(2, 11),
(3, 3),
(3, 9),
(3, 10),
(3, 14),
(4, 12),
(4, 18),
(4, 20),
(5, 7),
(5, 17),
(5, 19),
(6, 21),
(6, 26),
(7, 22),
(7, 31),
(7, 37),
(8, 23),
(8, 32),
(9, 24),
(9, 25),
(9, 33),
(9, 34),
(10, 28),
(10, 29),
(10, 35),
(10, 38);

INSERT INTO genre (name) VALUES 
('Hip Hop'),
('Pop'),
('Rock'),
('Dance'),
('R&B'),
('Classical'),
('Folk'),
('Electronic'),
('Reggaeton'),
('Jazz'),
('Blues'),
('Country'),
('Soul'),
('Heavy Metal'),
('Electro Pop'),
('Alternative Rock'),
('Indie'),
('Gospel'),
('Black Metal'),
('Polka');

INSERT INTO songs_genres (song_id, genre_id) VALUES 
(1, 1),
(2, 2),
(3, 7),
(4, 2),
(4, 5),
(5, 2),
(6, 4),
(7, 2),
(7, 5),
(8, 1),
(8, 2),
(9, 7),
(10, 7),
(11, 2),
(12, 2),
(13, 3),
(14, 7),
(15, 2),
(16, 7),
(17, 5),
(18, 3),
(19, 2),
(20, 2),
(6, 8),
(1, 3),
(5, 3),
(10, 3),
(21, 11),
(22, 12),
(23, 11),
(24, 14),
(25, 14),
(26, 16),
(27, 14),
(28, 17),
(29, 17),
(30, 18),
(31, 18),
(32, 13),
(33, 14),
(34, 14),
(35, 14),
(36, 13),
(37, 12),
(38, 17),
(39, 12),
(40, 12),
(21, 6),
(26, 6),
(31, 9),
(22, 2),
(37, 4),
(39, 2);

