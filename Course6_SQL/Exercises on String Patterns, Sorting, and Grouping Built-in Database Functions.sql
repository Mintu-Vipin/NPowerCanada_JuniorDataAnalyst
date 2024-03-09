--1. Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
SELECT * FROM indian_startup_funding;

SELECT CityLocation, SUM(AmountinUSD)
FROM indian_startup_funding
WHERE CityLocation ='Bengaluru';



--2. Write SQL query to sort the table by startup name DESC
SELECT *
FROM indian_startup_funding
ORDER BY StartupName DESC;


--3. Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru” and AmountinUSD>380000
SELECT CityLocation, SUM(AmountinUSD)
FROM indian_startup_funding
WHERE CityLocation ='Bengaluru' AND AmountinUSD>380000;

--4. Write SQL query to get all CityLocations that has an AmountinUSD >380000
SELECT CityLocation
FROM indian_startup_funding
WHERE AmountinUSD >380000;

--5. Write SQL query to get only unique CityLocations that has an AmountinUSD >380000
SELECT DISTINCT(CityLocation) 
FROM indian_startup_funding
WHERE AmountinUSD >380000;

--6.Write SQL query to get all StartupNames where AmountinUSD<380000
SELECT StartupName, AmountinUSD
FROM indian_startup_funding
WHERE AmountinUSD <380000;

--7. Write SQL query to sort the output from the previous question DESC
SELECT StartupName, AmountinUSD
FROM indian_startup_funding
WHERE AmountinUSD <380000
ORDER BY StartupName DESC;

--8. Write SQL query to get the City location that has the maximum funding amount “Note that is the data is not cleaned properly you will get non logical result”
SELECT CityLocation, MAX(cast(AmountinUSD AS float)) AS max_AmountinUSD
FROM indian_startup_funding;


--9 Write SQL query to get the total funding AmountinUSD for each IndustryVertical
SELECT IndustryVertical FROM indian_startup_funding;

SELECT IndustryVertical, SUM(AmountinUSD)
FROM indian_startup_funding
GROUP BY IndustryVertical;

--10. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with letter “A”
SELECT IndustryVertical, SUM(AmountinUSD)
FROM indian_startup_funding
WHERE IndustryVertical LIKE 'A%'
GROUP BY IndustryVertical;

--11. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with letter “A” and sort the output DESC by the total AmountinUSD
SELECT IndustryVertical, SUM(AmountinUSD) AS total_AmountinUSD
FROM indian_startup_funding
WHERE IndustryVertical LIKE 'A%'
GROUP BY IndustryVertical
ORDER BY total_AmountinUSD DESC;

--12. Write SQL query to count all the start_ups in the Education field
SELECT IndustryVertical,COUNT(*)
FROM indian_startup_funding
WHERE IndustryVertical='Education';

--13. Write SQL query to count all the start_Ups in the E-Commerce field
SELECT IndustryVertical,COUNT(*)
FROM indian_startup_funding
WHERE IndustryVertical='E-Commerce';

--14. Write SQL query to count all the start_Ups in the E-Commerce field, where city location equals “Bengaluru”
SELECT IndustryVertical,COUNT(*)
FROM indian_startup_funding
WHERE IndustryVertical='E-Commerce' AND CityLocation='Bengaluru';

--15. For each Industry Vertical find the total funding amount
SELECT IndustryVertical,SUM(AmountinUSD)
FROM indian_startup_funding
GROUP BY IndustryVertical;

--16. For each Industry Vertical find the total funding amount as “Total_fund” and the average funding amount as “Avg_Fund”. In this question provide two answer 1- using group by Industry Vertical, 2- using sub_queries
--1.
SELECT IndustryVertical,SUM(AmountinUSD) AS Total_Fund, AVG(AmountinUSD) AS Ag_Fund
FROM indian_startup_funding
GROUP BY IndustryVertical;

--2.



--17. Write SQL query to get the minimum value of funding for the “Uniphore” start_up
SELECT StartupName, AmountinUSD
FROM indian_startup_funding
WHERE StartupName='Uniphore';

SELECT StartupName, MIN(AmountinUSD)
FROM indian_startup_funding
WHERE StartupName='Uniphore';

--18. Write SQL query to get the length of the city location names
SELECT CityLocation, length(CityLocation)
FROM indian_startup_funding;

--19. Write SQL query to convert start_ups names into uppercase if the funding amount is >380,000
UPDATE indian_startup_funding
SET StartupName = UPPER(StartupName)
WHERE AmountinUSD>380000;

SELECT * FROM indian_startup_funding;
----

SELECT UPPER(StartupName)
FROM indian_startup_funding
WHERE AmountinUSD>380000;

--20. Write SQL query to select distinct industry vertical names, knowing that names are mix of lowercase and uppercase values.
SELECT DISTINCT UPPER(IndustryVertical) AS IndustryVertical
FROM indian_startup_funding;

SELECT DISTINCT LOWER(IndustryVertical) AS IndustryVertical
FROM indian_startup_funding;

