-- The idea behind the project is to create a database to keep track of user personal information, the music they are listening to and the audio characteristics of the songs available on Spotify.
-- Goals: 1) to provide machine learning recommendations for each user based on artist and song feature preferences
--            2) to perform audio analytics for internal strategy reports
-- Examples of usage: email newsletters with preferred artists and new songs, year rewind playlists, recommendations playlists with new songs e.g. Daily Mix playlists, analyse which artists do not have enough listeners so the algorithm could promote them more.
-- The database consists of 8 tables: Customers, Artists, Albums, Top Songs, Songs General Features, Listening Times, Song Rhythm, Instrumental Properties and Playlists.

# Polly
# Create relational DB of your choice with minimum 5 tables
# Set Primary and Foreign Key constraints to create relations between the tables
CREATE DATABASE SpotifyProject;
USE SpotifyProject;
-- Create Table for Customers on Spotify.
CREATE TABLE Customers (
customer_ID INT PRIMARY KEY, 
full_name VARCHAR(100), 
phone_number INT, 
email_address VARCHAR(100), 
type_of_subscription VARCHAR(50),
nationality VARCHAR(50),
gender VARCHAR(20));
-- Create Table for Artists on Spotify.
CREATE TABLE Artists (
artist VARCHAR(50), 
artist_ID INT,
genre VARCHAR(50),
average_monthly_streams INT,
CONSTRAINT PK_Artists PRIMARY KEY (artist_ID,genre));
-- Create Table for Albums on Spotify.
CREATE TABLE Albums (
album_name VARCHAR(50), 
album_ID INT,
artist_ID INT,
PRIMARY KEY(album_ID),
genre VARCHAR(50),
year_released YEAR,
no_of_tracks INT,
length_in_seconds INT,
CONSTRAINT FK_Artists FOREIGN KEY (artist_ID,genre)
REFERENCES Artists(artist_ID,genre));
-- Create Table for Top Songs on Spotify.
CREATE TABLE Top_Songs (
song_ID INT,
song_name VARCHAR(50),
artist_ID INT,
album_ID INT,
genre VARCHAR(50),
FOREIGN KEY (album_ID) REFERENCES Albums(album_ID),
CONSTRAINT PK_Top_Songs PRIMARY KEY(song_ID, song_name),
CONSTRAINT FK_Artists2 FOREIGN KEY(artist_ID,genre)
REFERENCES Artists(artist_ID,genre));
-- Create Table for general features of songs on Spotify.
CREATE TABLE Songs_General_Features (
song_ID INT,
song_name VARCHAR(50),
length_in_seconds INT,
year_of_release INT,
explicit BOOL,
CONSTRAINT FK_Top_Songs FOREIGN KEY (song_ID,song_name)
REFERENCES Top_Songs(song_ID,song_name));
-- Create Table for listening times of songs on Spotify.
CREATE TABLE Listening_Times (
song_ID INT,
song_name VARCHAR(50),
artist_ID INT,
customer_ID INT, 
FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID), 
number_of_times_played INT,
added_to_favourites BOOL,
CONSTRAINT FK_Top_Songs1 FOREIGN KEY (song_ID,song_name)
REFERENCES Top_Songs(song_ID,song_name)); 
-- Create Table for rhythm of songs on Spotify.
CREATE TABLE Song_Rhythm (
song_ID INT,
tempo INT,
energy INT,
danceability INT,
CONSTRAINT FK_Top_Songs2 FOREIGN KEY (song_ID)
REFERENCES Top_Songs(song_ID)); 
-- Create Table for instumental properties of songs on Spotify.
CREATE TABLE Instrumental_Properties (
song_ID INT,
loudnessdB INT,
valence INT,
acoustic INT,
CONSTRAINT FK_Top_Songs3 FOREIGN KEY (song_ID)
REFERENCES Top_Songs(song_ID)); ;
-- Create Table for playlists on Spotify.
CREATE TABLE Playlists (
playlist_ID INT,
creator_ID INT);

-- Add in the values for the pre-made tables

ALTER TABLE Customers MODIFY phone_number BIGINT;

INSERT INTO Customers (
customer_ID, 
full_name, 
phone_number, 
email_address, 
type_of_subscription,
nationality,
gender)
VALUES (
1,
'Ioana Tovirnac', 
441314960834,
'IoanaT@gmail.com',
'Premium',
'Norwegian',
'Woman'
),
(
2,
'Stella Annor', 
441514960861,
'StellaA@gmail.com',
'Premium',
'Korean',
'Woman'
),
(
3,
'Polly Linkogle-Gabriel', 
441214960568,
'PollyLG@gmail.com',
'Free',
'Qatari',
'Woman'
);

 INSERT INTO Artists (
artist,
artist_ID,
genre,
average_monthly_streams)
VALUES (
'Beyoncé',
1,
'R&B, Pop, Hip-Hop, Soul',
33361967),
(
'Aretha Franklin',
2,
'Soul, R&B, Pop, Gospel, Jazz',
9959520),
(
'Olivia Rodrigo',
3,
'Pop',
47590532),
(
'Amy Winehouse',
4,
'Soul, Jazz',
11020895),
(
'Tina Turner',
5,
'Rock, Soul, R&B, Pop',
10895438),
(
'Megan Thee Stallion',
6,
'Hip-Hop, Rap',
35725357),
(
'Billie Eilish',
7,
'Alternative, Indie, Pop',
54265969),
(
'Joni Mitchell',
8,
'Folk',
3913413),
(
'Blondie',
9,
'Rock, Punk Rock, Pop',
8309016),
(
'Dolly Parton',
10,
'Country',
10480112);

INSERT INTO Albums (
album_name,
album_ID, 
artist_ID, 
genre, 
year_released,
no_of_tracks, 
length_in_seconds ) 
VALUES (
'Sour',
1,
3,
'Pop',
2021,
11,
2086
),
(
'Aretha Now',
2,
2,
'Soul, R&B, Pop, Gospel, Jazz',
1968,
10,
1767
),
(
'Good News',
3,
6,
'Hip-Hop, Rap',
2020,
17,
2990
),
(
'Dangerously In Love',
4,
1,
'R&B, Pop, Hip-Hop, Soul',
2003,
16,
3780
),
(
'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?',
5,
7,
'Alternative, Indie, Pop',
2019,
14,
2575
), 
(
'Jolene',
6,
10,
'Country',
1974,
10,
1486
);

 INSERT INTO Top_Songs (
song_ID, 
song_name,  
artist_ID, 
album_ID,
genre)
VALUES (
1,
'bad guy',
7,
5,
'Alternative, Indie, Pop'
),
(
2,
'Body',
6,
3,
'Hip-Hop, Rap'),
(
3,
'good for u',
3,
1,
'Pop'),
(
4,
'drivers license',
3,
1,
'Pop'),
(
5,
'Crazy In Love (feat.Jay-Z)',
1,
4,
'R&B, Pop, Hip-Hop, Soul'),
(
6,
'I Say a Little Prayer',
2,
2,
'Soul, R&B, Pop, Gospel, Jazz'),
(
7,
"when the party's over",
7,
5,
'Alternative, Indie, Pop'),
(
8,
'Jolene',
10,
6,
'Country'),
(
9,
'Think',
2,
2,
'Soul, R&B, Pop, Gospel, Jazz'),
(
10,
'I Will Always Love You',
10,
6,
'Country');

 INSERT INTO Songs_General_Features (
song_ID,
song_name,
length_in_seconds,
year_of_release, 
explicit)
VALUES (
1,
'bad guy',
194,
2019,
false
),
(
2,
'Body',
171,
2020,
true),
(
3,
'good for u',
178,
2021,
true),
(
4,
'drivers license',
242,
2021,
true),
(
5,
'Crazy In Love (feat.Jay-Z)',
236,
2003,
false),
(
6,
'I Say a Little Prayer',
237,
1968,
false),
(
7,
"when the party's over",
196,
2019,
false),
(
8,
'Jolene',
162,
1974,
false),
(
9,
'Think',
240,
1968,
false),
(
10,
'I Will Always Love You',
176,
1974,
false);

INSERT INTO Listening_Times (
song_ID, 
song_name, 
artist_ID, 
customer_ID,
number_of_times_played,
added_to_favourites) 
VALUES (
1,
'bad guy', 
7,
1,
12,
true),
(
1,
'bad guy', 
7,
2,
0,
false),
(
1,
'bad guy', 
7,
3,
2,
false),
(
2,
'Body', 
6,
1,
3,
false),
(
2,
'Body', 
6,
2,
2,
true),
(
2,
'Body', 
6,
3,
7,
true),
(
3,
'good for u', 
3,
1,
9,
true),
(
3,
'good for u', 
3,
2,
4,
true),
(
3,
'good for u', 
3,
3,
13,
true),
(
5,
'Crazy In Love (feat.Jay-Z)', 
1,
1,
5,
true),
(
5,
'Crazy In Love (feat.Jay-Z)', 
1,
2,
3,
true),
(
5,
'Crazy In Love (feat.Jay-Z)', 
1,
3,
1,
false);
 
INSERT INTO Song_Rhythm (
song_ID, 
tempo,
energy,
danceability)
VALUES (
1,
135, 
43,
70),
(
2,
94,
73,
91
),
(
3,
167,
66,
56),
(
4,
74,
35,
37),
(
5,
99,
77,
65),
(
6,
133,
36,
59),
(
7,
83,
11,
37),
(
8,
111,
54,
67),
(
9,
110,
63,
69),
(
10,
136,
14,
45);

 INSERT INTO Instrumental_Properties (
song_ID,
loudnessdB,
valence,
acoustic)
VALUES (
1,
-11, 
56,
33),
(
2,
-6,
47,
2),
(
3,
-5,
69,
34),
(
4,
-11,
13,
84),
(
5,
-7,
68,
0),
(
6,
-14,
50,
48),
(
7,
-14,
20,
98),
(
8,
-11,
81,
57),
(
9,
-11,
93,
25),
(
10,
-13,
1,
16);

 INSERT INTO Playlists (
playlist_ID,
creator_ID)
VALUES (
1,
1),
(
2,
3),
(
3,
2);

SELECT *
FROM SpotifyProject.Artists;
​-- Trigger Example - this trigger adds 100 streams to each artist.
DELIMITER //

CREATE TRIGGER Artists_average_monthly_streams_Before_Insert
BEFORE INSERT on Artists
FOR EACH ROW
BEGIN
	SET NEW.average_monthly_streams = NEW.average_monthly_streams+100;
END//
DELIMITER ;
 INSERT INTO Artists (
artist,
artist_ID,
genre,
average_monthly_streams)
VALUES (
'Nina Simone',
11,
'R&B, Jazz‎, ‎Blues‎, Soul',
2186625);
SELECT *
FROM SpotifyProject.Artists;

-- Another trigger example - Verifying potential customer is old enough to create a spotify account.

CREATE TABLE CustomerAge (
customer_ID INT,
FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID),
age INT);
USE SpotifyProject;
ALTER TABLE Customers;
INSERT INTO CustomerAge 
(customer_ID ,age)
VALUES
(1, 20), 
(2, 29);
​
DELIMITER //
CREATE TRIGGER Verify_age_eligibility BEFORE INSERT
ON CustomerAge
FOR EACH ROW
IF NEW.age < 18 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Person must be older than 18.';
END IF; //
DELIMITER ;
INSERT INTO CustomerAge 
(customer_ID ,age)
VALUES
(3, 9);

# Stella
USE SpotifyProject;
ALTER TABLE Customers;
INSERT INTO Customers(customer_ID , full_name , phone_number , email_address , type_of_subscription , nationality , gender)
VALUES
(4, 'Sandra May', 441418883333 , 'SandraM@gmail.com', 'Premium student', 'British', 'Woman') ,
(5, 'Jessica Collins', 441610785957, 'JessicaC@gmail.com' ,'Premium family', 'Scottish' , 'Woman'),
(6, 'Lisa Oakes' , 441815374014 , 'LisaO@gmail.com' , 'Free' ,'Irish' ,' Woman' ), 
(7, 'Alejandro López', 417122244551 , 'AlejandroL@gmail.com' , 'Premium student' , 'Mexican' , 'Male'),
(8, 'Shweta Chavan', 417196244017 , 'ShwetaC@gmail.com' , 'Premium student' , 'Indian' , 'Woman'),
(9, 'James Smith', 417122259549 , 'JamesS@gmail.com' , 'Premium family' , 'American' , 'Male');

INSERT INTO Playlists(playlist_ID , creator_ID)
VALUES
(4,6),
(5,4),
(6, 5),
(7,8),
(8,7),
(9,9);

SELECT * FROM Customers;
SELECT * FROM Artists;
SELECT * FROM Albums;
SELECT * FROM Top_Songs;
SELECT * FROM Songs_General_Features;
SELECT * FROM Listening_Times;
SELECT * FROM Song_Rhythm;
SELECT * FROM Instrumental_Properties;
SELECT * FROM Playlists;


SET GLOBAL event_scheduler = ON;
USE SpotifyProject;
​
​#  In your database, create an event and demonstrate how it runs 
DELIMITER //
-- an event that will update the number of times songs crazy in love was played by customer_id 2 in the last hour
CREATE EVENT count_times_played 
ON SCHEDULE AT NOW() + INTERVAL 1 HOUR
DO BEGIN
	UPDATE Listening_Times
    SET number_of_times_played = number_of_times_played + 2
    WHERE song_name = 'Crazy In Love (feat.Jay-Z)'AND customer_ID = 1;

END//
DELIMITER ;

-- Prepare an example query with group by to demonstrate how to extract data from your DB for analysis

SELECT explicit , count(explicit)
FROM Songs_General_Features
GROUP BY explicit;

USE SpotifyProject;
​
DELIMITER //

# In your database, create a stored function that can be applied to a query in your DB
CREATE FUNCTION subscription_price(type_of_subscription varchar(50))
RETURNS FLOAT(2)	
DETERMINISTIC
BEGIN
	DECLARE price FLOAT(2);
 IF type_of_subscription = 'Free' THEN 
		SET price = 0.00;
	ELSEIF type_of_subscription = 'Premium' THEN
		SET price = 9.99;
	ELSEIF type_of_subscription = 'Premium family' THEN
		SET price = 12.99;
	ELSEIF type_of_subscription = 'Premium student' THEN
		SET price = 4.99;
	END IF;
    
    -- Return th price for each subscription type
    RETURN (price);
END// DELIMITER ;
    
 SELECT * FROM SpotifyProject.Customers;
 SELECT 
    full_name ,
     phone_number,
     email_address,
     type_of_subscription ,
     subscription_price(type_of_subscription)
FROM
  Customers;
  
  SELECT * FROM SpotifyProject.Albums;
​
DELIMITER //
-- In your database, create a stored procedure and demonstrate how it runs 
CREATE PROCEDURE albumName(name_of_album varchar(50)
)
BEGIN
SELECT  year_released , no_of_tracks FROM Albums WHERE album_name = name_of_album;

END// DELIMITER ;

-- use separate SQL query tab for this
USE SpotifyProject;
CALL albumName('Good News');



# Ioana
# Using any type of the joins create a view that combines multiple tables in a logical way 
# Do Premium customers listen to more recent songs?: No significant findings
SELECT DISTINCT Customers.type_of_subscription, Songs_General_Features.year_of_release
FROM Customers
JOIN Listening_Times ON Customers.customer_ID = Listening_Times.customer_ID
JOIN Songs_General_Features ON Songs_General_Features.song_ID = Listening_Times.song_ID
ORDER BY Songs_General_Features.year_of_release DESC;

# Do Premium customers listen to more songs on repeat? as expected because of the limit of songs free users have
SELECT Customers.type_of_subscription, sum(Listening_Times.number_of_times_played)
FROM Customers
JOIN Listening_Times ON Customers.customer_ID = Listening_Times.customer_ID
Group by Customers.type_of_subscription;

# Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis
# What albums have the most songs added to favourites?
Create view view_of_albums_with_most_liked_songs
as
SELECT count(Listening_Times.added_to_favourites), Albums.album_name, Top_Songs.song_name
FROM Listening_Times
JOIN Top_Songs ON Listening_Times.song_ID = Top_Songs.song_ID
JOIN Albums ON Top_Songs.album_ID = Albums.album_ID
JOIN Artists ON Albums.artist_ID = Artists.artist_ID
WHERE Listening_Times.added_to_favourites = 1
group by Albums.album_name
order by count(Listening_Times.added_to_favourites) desc;
#drop view view_of_albums_with_most_liked_songs;
select * from view_of_albums_with_most_liked_songs;

#Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
SELECT Instrumental_properties.song_ID, Instrumental_properties.loudnessdB, 
Instrumental_properties.valence, 
Instrumental_properties.acoustic
from Instrumental_properties
WHERE song_ID IN (
SELECT song_ID
FROM Top_Songs
WHERE genre like '%Pop%'
)
ORDER BY song_ID ASC;

# Prepare an example query with having to demonstrate how to extract data from your DB for analysis 
# Do songs become more energetic with each year passing by?
# We check by comparing the rhythm features (energy, tempo and danceability) to the average for all the years.
# Results: recent songs (2019, 2021) are more energetic, have a higer tempo and are more danceable than previous years.
SELECT Songs_General_Features.year_of_release, 
Song_Rhythm.energy, 
Song_Rhythm.tempo, 
Song_Rhythm.danceability, 
avg(Song_Rhythm.energy), 
avg(Song_Rhythm.tempo), 
avg(Song_Rhythm.danceability)
FROM Songs_General_Features
JOIN Song_Rhythm 
ON Songs_General_Features.song_ID = Song_Rhythm.song_ID
GROUP BY Songs_General_Features.year_of_release
HAVING Song_Rhythm.energy > avg(Song_Rhythm.energy)
and Song_Rhythm.tempo > avg(Song_Rhythm.tempo)
and Song_Rhythm.danceability > avg(Song_Rhythm.danceability);