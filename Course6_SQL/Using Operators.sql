-- ChicagoCrimeData
SELECT * FROM ChicagoCrimeData;

-- ChicagoCensusData
SELECT * FROM ChicagoCensusData;

-- ChicagoPublicSchools
SELECT * FROM ChicagoPublicSchools;

-- Problem 1: Find the total number of crimes recorded in the CRIME table.
SELECT COUNT(CASE_NUMBER) AS No_of_crimes
FROM ChicagoCrimeData;

-- Problem 2: List community areas with per capita income less than 11000.
SELECT COMMUNITY_AREA_NUMBER, COMMUNITY_AREA_NAME,  PER_CAPITA_INCOME
FROM ChicagoCensusData
WHERE PER_CAPITA_INCOME<11000;

-- Problem 3: List all case numbers for crimes involving minors?
SELECT CASE_NUMBER 
FROM ChicagoCrimeData 
WHERE DESCRIPTION LIKE '%MINOR%';

-- Problem 4: List all kidnapping crimes involving a child?(children are not considered minors
SELECT CASE_NUMBER, PRIMARY_TYPE, DESCRIPTION 
-- for the purposes of crime analysis)
FROM ChicagoCrimeData 
WHERE PRIMARY_TYPE= 'KIDNAPPING';

-- Problem 5: What kind of crimes were recorded at schools?
SELECT CASE_NUMBER, PRIMARY_TYPE, LOCATION_DESCRIPTION 
FROM ChicagoCrimeData 
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%';

-- Problem 6: List the average safety score for all types of schools.
SELECT "Elementary, Middle, or High School", AVG(SAFETY_SCORE) 
FROM ChicagoPublicSchools
GROUP BY  "Elementary, Middle, or High School";

-- Problem 7: List 5 community areas with highest % of households below poverty line.
SELECT COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY 
FROM ChicagoCensusData 
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC LIMIT 5 ;

-- Problem 8: Which community area(number) is most crime prone?
SELECT COMMUNITY_AREA_NUMBER 
FROM ChicagoCrimeData 
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY COUNT(COMMUNITY_AREA_NUMBER) DESC LIMIT 1;

-- Problem 9: Use a sub-query to find the name of the community area with highest hardship
-- index.
SELECT COMMUNITY_AREA_NAME
FROM ChicagoCensusData
WHERE HARDSHIP_INDEX =(SELECT MAX(HARDSHIP_INDEX) FROM ChicagoCensusData);

-- Problem 10: Use a sub-query to determine the Community Area Name with most number
-- of crimes?
SELECT community_area_name FROM ChicagoCensusData
WHERE COMMUNITY_AREA_NUMBER = (SELECT COMMUNITY_AREA_NUMBER FROM ChicagoCrimeData
    GROUP BY COMMUNITY_AREA_NUMBER
    ORDER BY COUNT(COMMUNITY_AREA_NUMBER) DESC
    LIMIT 1)
LIMIT 1;

-- Problem 11: How many Elementary Schools are in the dataset?
SELECT COUNT(*) 
FROM ChicagoPublicSchools 
WHERE ElementaryMiddleorHighSchool= 'ES';

-- Problem 12: Display total number of elementary, middle and high school
-- from Chicago_public_Schools
SELECT ElementaryMiddleorHighSchool, COUNT(*) AS TotalSchools
FROM ChicagoPublicSchools
GROUP BY ElementaryMiddleorHighSchool;

-- Problem 13: What is the highest Safety Score? #Which schools have highest Safety Score?
SELECT MAX(SAFETY_SCORE) FROM ChicagoPublicSchools;

SELECT NAME_OF_SCHOOL 
FROM ChicagoPublicSchools 
WHERE SAFETY_SCORE = (SELECT MAX(SAFETy_SCORE) 
FROM ChicagoPublicSchools);

-- Problem 14: Remove the '%' sign for Average Student Attendance column.
SELECT NAME_OF_SCHOOL, REPLACE(AVERAGE_STUDENT_ATTENDANCE, '%', '')
FROM ChicagoPublicSchools 
ORDER BY AVERAGE_STUDENT_ATTENDANCE LIMIT 5 ;

-- Problem 15: Which Schools have Average Student Attendance lower than 70%?
SELECT NAME_OF_SCHOOL, AVERAGE_STUDENT_ATTENDANCE
FROM ChicagoPublicSchools 
WHERE CAST(REPLACE(AVERAGE_STUDENT_ATTENDANCE, '%','') AS DOUBLE)<70 
ORDER BY AVERAGE_STUDENT_ATTENDANCE;

-- Problem 16: Get the total College Enrollment for each Community Area.
SELECT COMMUNITY_AREA_NAME, SUM(COLLEGE_ENROLLMENT) AS total_College_Enrollment 
FROM ChicagoPublicSchools
GROUP BY COMMUNITY_AREA_NAME;

-- Problem 17: Get the 5 Community Areas with the least College Enrollment sorted in
-- ascending order
SELECT COMMUNITY_AREA_NAME, SUM(COLLEGE_ENROLLMENT) AS total_College_Enrollment 
FROM ChicagoPublicSchools 
GROUP BY COMMUNITY_AREA_NAME 
ORDER BY total_College_Enrollment LIMIT 5;

-- Problem 18: Display total number of elementary, middle and high school from
-- Chicago_public_Schools
SELECT ElementaryMiddleorHighSchool, COUNT(*) AS TotalSchools
FROM ChicagoPublicSchools
GROUP BY ElementaryMiddleorHighSchool;

-- Problem 19: Display ZIPCodes from Chicago_Schools which are having more than 5
-- schools.
SELECT NAME_OF_SCHOOL, ZIP_Code, COUNT(*) AS TotalSchool
FROM ChicagoPublicSchools
GROUP BY ZIP_Code
HAVING TotalSchool>5;


-- Problem 20: Get the hardship index for the community area which has the school with the
-- highest enrollment
SELECT community_area_number, community_area_name, hardship_index 
FROM ChicagoCensusData 
WHERE community_area_number IN
( SELECT community_area_number FROM ChicagoPublicSchools ORDER BY college_enrollment desc limit 1 );

-- Problem 21: Display the type of crimes with less than 10 reported crimes for each category.
SELECT PRIMARY_TYPE, COUNT(*) AS TotalReportedCrimes
FROM ChicagoCrimeData
GROUP BY PRIMARY_TYPE
HAVING COUNT(*)<10;

-- Problem 22 : Display the top 20 least reported types of crime. (Primary_type column)
SELECT PRIMARY_TYPE, COUNT(*) AS TotalReportedCrimes
FROM ChicagoCrimeData
GROUP BY PRIMARY_TYPE
ORDER BY TotalReportedCrimes LIMIT 20;
