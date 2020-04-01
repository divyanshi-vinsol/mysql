--(i)the names of all library books published by Macmillan.
SELECT title 
FROM titles 
WHERE publisher = 'Macmillan';
--(ii)branches that hold any books by Ann Brown (using a nested subquery)
SELECT DISTINCT(branch)
FROM holdings 
WHERE title IN (
SELECT title FROM titles 
WHERE author = 'Ann Brown');
--(iii)branches that hold any books by Ann Brown (without using a nested subquery).
SELECT DISTINCT(branch)
FROM holdings h, titles t
WHERE author="Ann Brown" AND h.title = t.title;
--(iv)total no of books held at each branch
SELECT SUM(copies),branch 
FROM holdings
GROUP BY branch;
