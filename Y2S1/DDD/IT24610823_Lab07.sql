create table Movie (
title char(25) primary key,
year int,
length float,
language char(15),
type char(1),
directorName char (30)
);

DROP TABLE IF EXISTS Movie

insert into Movie values ('Avengers', 2018, 3 , 'English', 'F', 'Anthony Russo');
insert into Movie values ('Black Panther', 2018, 3, 'English', 'F', 'Ryan Coogler');
insert into Movie values ('Ghost in Shell', 2017, 2.5, 'English', 'D' ,'Rupert Sanders');
insert into Movie values ('Jurrasic World', 2018, 2.75, 'English', 'D', 'Colin Trevorrow');
insert into Movie values ('Passengers', 2016, 2.75, 'English', 'F', 'Morten Tyldum');
insert into Movie values ('Spider-man',2018, 2.5, 'English ','F', 'Jon Watts');

create table MovieStar
(
name char(30) primary key,
country varchar(40),
gender char(1),
birthdate date
);

DROP TABLE IF EXISTS MovieStar

insert into MovieStar values('Bryce Howard','America', 'F','3/2/1981');
insert into MovieStar values('Chadwick Boseman', 'America', 'M','11/29/1977');
insert into MovieStar values('Chris Pratt', 'England', 'M', '6/21/1979');
insert into MovieStar values('Jennifer Lawrence', 'America', 'F', '8/15/1990');
insert into MovieStar values('Robert Downey', 'America', 'M', '4/4/1963');
insert into MovieStar values('Scarlett Johansson', 'America', 'F', '11/22/1984');
insert into MovieStar values('Tom Holland', 'England', 'M', '6/1/1996');


create table StarsIn (
movieTitle char(25) foreign key references movie(title) ,
movieYear int ,
starname char (30) foreign key references movieStar(name),
role varchar (15),
Primary key(movieTitle,movieYear,starname)
)

DROP TABLE IF EXISTS StarsIn

insert into StarsIn values('Avengers',2018, 'Chadwick Boseman', 'lead');
insert into StarsIn values('Avengers', 2018, 'Robert Downey', 'lead');
insert into StarsIn values('Avengers ',2018, 'Scarlett Johansson' , 'lead');
insert into StarsIn values('Black Panther', 2018, 'Chadwick Boseman' , 'lead');
insert into StarsIn values('Black Panther ',2018, 'Robert Downey' , 'support');
insert into StarsIn values('Ghost in Shell', 2017, 'Scarlett Johansson' , 'lead');
insert into StarsIn values('Jurrasic World', 2018, 'Bryce Howard', ' lead');
insert into StarsIn values('Jurrasic World ',2018, 'Chris Pratt' , 'lead');
insert into StarsIn values('Passengers', 2016, 'Chris Pratt', ' lead');
insert into StarsIn values('Passengers', 2016, 'Jennifer Lawrence', ' lead');
insert into StarsIn values('Spider-man', 2018, 'Robert Downey', ' support');
insert into StarsIn values('Spider-man', 2018, 'Tom Holland' , 'lead');

create table Theater(
theaterName char(20) primary key,
country varchar(40),
city varchar(20),
capacity int
)

DROP TABLE IF EXISTS Theater

insert into Theater values ('Beverly', 'America', 'LA', 300);
insert into Theater values ('Cinnemaworld', 'Australia', 'Melbourne', 250);
insert into Theater values ('Electric', 'England', 'London', 275);
insert into Theater values ('Grand Rex', 'France', 'Paris', 300);
insert into Theater values ('Nitehawk', 'America', 'New York', 200);

create table Show(
showId int,
movieTitle char(25) foreign key references movie(title),
theaterName char(20) foreign key references Theater(theaterName),
datetime datetime,
ticketPrice real,
spectators int,
primary key(showId)
)

DROP TABLE IF EXISTS Show

insert into Show values(1,'Spider-man', 'Electric', '1-Jan-2018',200, 275);
insert into Show values(2,'Spider-man', 'Grand Rex', '1-Jan-2018', 200, 200);
insert into Show values(3,'Avengers', 'Grand Rex', '1-Apr-2018', 200, 98);
insert into Show values(4,'Black Panther', 'Beverly', '1-Jan-2018', 200, 205);
insert into Show values(5,'Black Panther', 'Grand Rex', '1-Jan-2018',300, 300);
insert into Show values(6,'Passengers', 'Nitehawk', '1-Jan-2018', 200, 219);
insert into Show values(7,'Ghost in Shell', 'Cinnemaworld', '1-Jan-2018', 200, 101);
insert into Show values(8,'Black Panther', 'Grand Rex', '1-Jan-2018', 200, 200);
insert into Show values(9,'Jurrasic World', 'Cinnemaworld', '1-Jan-2018', 200, 188);
insert into Show values(10,'Black Panther', 'Nitehawk', '1-Jan-2018', 200, 219);
insert into Show values(11,'Jurrasic World','Nitehawk', '1-Jan-2018', 200, 176);

create table Booking (
ShowId int foreign key references Show(ShowId), 
CustName Char (50), 
numTickets int
primary key(ShowId,CustName)
)

DROP TABLE IF EXISTS Booking

insert into Booking values(1,'John Wicks',4);
insert into Booking values(1,'Anne Mary',2);


--Exercise 01

--a. Create a stored procedure which can insert a booking to the booking table. The procedure should accept the show id, customer name and number of tickets as parameters and it should update the number of spectators on the show table.CREATE PROCEDURE InsertRecord10(@Show INT, @cName CHAR(50), @NoOfTickets INT)ASBEGIN	DECLARE @Seats INT	SELECT @Seats = dbo.DisplayRemainingSeats10(@Show);	IF(@Seats >=  @NoOfTickets)	BEGIN		INSERT INTO Booking VALUES (@Show, @cName, @NoOfTickets)		UPDATE Show 		SET spectators = spectators + @NoOfTickets		WHERE showId = @Show	END;END;EXEC InsertRecord10 3, 'Amy Bling', 20DROP PROCEDURE IF EXISTS InsertRecord10SELECT * FROM Show--b. Create a trigger to ensure that the number of spectators on the show table does not exceed the capacity of the theater it’s shown in.CREATE TRIGGER CheckTheaterON BookingFOR INSERTASBEGIN 	DECLARE @Show INT 	DECLARE @Seats INT	SELECT @Show = i.showId	FROM inserted i	EXEC @Seats = DisplayRemainingSeats @Show	IF(@Seats <= 0)		ROLLBACK TRANSACTIONENDSELECT * FROM Booking;SELECT * FROM Show;--Exercise 02--a. Assume that each movie star is assigned with a rank based on the number of lead roles he/she has played. Create a procedure to update a rank attribute added to the MovieStar table for each movie star.
ALTER TABLE MovieStar
ADD rank INT;
CREATE PROCEDURE UpdateMovieStarRank
AS
BEGIN
	UPDATE MovieStar
	SET rank = (
		SELECT COUNT(*)
		FROM StarsIn
		WHERE StarsIn.starname = MovieStar.name
		AND LTRIM(RTRIM(role)) = 'lead'
	)
END;
EXEC UpdateMovieStarRank;

DROP PROCEDURE IF EXISTS UpdateMovieStarRank;

SELECT * FROM MovieStar;--b. Assuming that the Movie Star table already stores the rank of each movie star based on the criteria in Exercise 2-a, write a trigger to update the rank when the movie star appears in a new movie.CREATE TRIGGER UpdateRankOnNewRole
ON StarsIn
AFTER INSERT
AS
BEGIN
	DECLARE @StarName CHAR(30);

	-- Get the name of the star added
	SELECT @StarName = starname FROM inserted;

	-- Update the rank of that specific star
	UPDATE MovieStar
	SET rank = (
		SELECT COUNT(*)
		FROM StarsIn
		WHERE StarsIn.starname = @StarName
		AND LTRIM(RTRIM(role)) = 'lead'
	)
	WHERE name = @StarName;
END;

INSERT INTO StarsIn VALUES ('Black Panther', 2018, 'Scarlett Johansson', 'lead');

SELECT name, rank FROM MovieStar;