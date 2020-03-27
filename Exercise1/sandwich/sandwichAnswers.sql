--Answer to  : (i)places where Jones can eat (using a nested subquery). 
SELECT Address 
FROM locations 
WHERE LName IN(SELECT Location 
FROM sandwiches 
WHERE Filling=(SELECT Filling 
FROM tastes 
WHERE Name='Jones'));
--Answer to : (ii)places where Jones can eat (without using a nested subquery). 
SELECT Address 
FROM tastes t, locations l, sandwiches s 
WHERE l.lname=s.location 
AND t.name="Jones" 
AND t.filling=s.filling;
--Answer to : (iii)for each location the number of people who can eat there. 
SELECT s.location, COUNT(DISTINCT t.name) n 
FROM sandwiches s, tastes t 
WHERE (s.filling=t.filling) 
GROUP BY s.location;