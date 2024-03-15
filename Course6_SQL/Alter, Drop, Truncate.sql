-- ALTER Command   
--------------------
--Add a new column movieage to the TABLE
ALTER TABLE MovieAssignmentData
ADD COLUMN movieage INTEGER;

SELECT * FROM MovieAssignmentData;

--Modify column in table
--You can not use the ALTER TABLE statement to modify a column in SQLite. Instead you will need to rename the table, create a new table, and copy the data into the new table.

--Delete a column color from the TABLE
ALTER TABLE MovieAssignmentData
DROP COLUMN color;

SELECT * FROM MovieAssignmentData;

--Rename table name to movieData

ALTER TABLE MovieAssignmentData
RENAME TO movieData;

SELECT * FROM movieData;

-- ADD data to the new column that you have added

UPDATE movieData
SET movieage = 10;

SELECT * FROM movieData;

--Count the number of columns in a table
SELECT COUNT(*) AS column_count
FROM pragma_table_info('movieData');

--Delete the entire TABLE
--Delete the entire table with all the records
DROP TABLE movieData;

SELECT * FROM movieData;

------------------------------------------------------------------------------------------------------
-- Filter Data with Where Clause 
--------------------------------
--1) Find out all the details of movies directed by James Cameron
SELECT * FROM MovieAssignmentData 
WHERE director_name ='James Cameron';

SELECT * FROM MovieAssignmentData;

--2) Discover the movie titles and filmmakers of all the pictures having duration between 120 and 180.
SELECT movie_title, director_name
FROM MovieAssignmentData
WHERE duration BETWEEN 120 AND 180;

--3) Discover the movie titles and filmmakers of all the pictures having duration between 120 and 180 and language = "Hindi"
SELECT movie_title, director_name
FROM MovieAssignmentData
WHERE duration BETWEEN 120 AND 180 AND language = "Hindi" ;

--4) Discover all of the action, thriller, and adventure movies.
SELECT movie_title 
FROM MovieAssignmentData
WHERE genres LIKE '%action%' OR genres LIKE '%thriller%' OR genres LIKE '%adventure movies%';

--5)Discover all of Johnny Depp's movies from the database provided
SELECT movie_title 
FROM MovieAssignmentData
WHERE actor_1_name = 'Johnny Depp' OR actor_2_name ='Johnny Depp' OR actor_3_name = 'Johnny Depp';

--6) Find out all the movies with the 3rd actor as  Polly Walker , Jack Davenport and Wes Studi
SELECT movie_title
FROM MovieAssignmentData
WHERE actor_3_name IN ('Polly Walker' , 'Jack Davenport', 'Wes Studi');

--7) Show a report from the movie database with the title, directors' names, and all of the actors' names for movies that are under or equivalent to two hours long.

SELECT movie_title, director_name, actor_1_name,actor_2_name,actor_3_name
FROM MovieAssignmentData
WHERE duration<= 120;

----------------------------------------------------------------------------------------------------
--single Row 
-------------
Select upper(director_name) from MovieAssignmentData

----------------------------------------------------------------------------------------------------
--Aggregate/multiple - count,avg,sum,min,max
----------------------------------------------

-- Count the total number of movies directed by James Cameron
SELECT COUNT(movie_title) 
FROM MovieAssignmentData
WHERE director_name='James Cameron';

-- Create a report to display total number of movies directed by all the directors
SELECT director_name, COUNT(director_name) as TOTAL_MOVIES
FROM MovieAssignmentData
GROUP BY director_name;

--Count the total gross amount made by Documentary movies
SELECT SUM(gross) AS total_gross_amount
FROM MovieAssignmentData
WHERE genres LIKE '%documentary%';

SELECT GROSS FROM MovieAssignmentData;

--Display names of actor 1 with less than  2000000000 gross amount
SELECT actor_1_name
FROM MovieAssignmentData
WHERE GROSS < 2000000000;

--Display total facebook likes for only English and Hindi movie cast.(all of the cast) 
SELECT actor_1_facebook_likes, actor_2_facebook_likes, actor_3_facebook_likes
FROM MovieAssignmentData
WHERE language IN('English','Hindi')







