--1. manage(create, update, delete) categories, articles, comments, and users

CREATE DATABASE article_data; 

USE article_data;

CREATE TABLE comments(comment_author varchar(50),
article_name varchar(100),
comment varchar(100));

CREATE TABLE users(name varchar(50),
user_category ENUM("admin","normal"));

CREATE TABLE article_categories(name varchar(100) primary key);

CREATE TABLE articles(Author varchar(50),
Article_Name varchar(100),
Article_Category varchar(100),
FOREIGN KEY (Article_Category) REFERENCES article_categories(name));


UPDATE article_data.users SET user_category="admin" where name="user4";
UPDATE article_data.article_categories SET name="Category4" where name="Category3";
UPDATE article_data.articles SET author="user3" where article_name="A8";
UPDATE article_data.comments SET comment_author="user3" where comment="C2";

DELETE FROM article_data.users WHERE name="user5";
DELETE FROM article_data.article_categories WHERE name="Category3";
DELETE FROM article_data.articles WHERE article_name="A9";
DELETE FROM article_data.comments WHERE comment="C6";


--2 select all articles whose author's name is user3 (Do this exercise using variable also).
SELECT article_name FROM article_data.articles WHERE author="user3";

--using variable
SET @author:="user3";
SELECT article_name FROM article_data.articles WHERE author=@author;


--3 For all the articles being selected above, select all the articles and also the comments associated with those articles in a single query (Do this using subquery also)
SELECT comment,com.article_name 
FROM article_data.comments AS com JOIN article_data.articles AS ar 
ON ar.article_name=com.article_name
WHERE ar.author="user3";

-- using subquery
SELECT comment,com.article_name FROM article_data.comments WHERE article_name IN(SELECT article_name 
FROM article_data.articles 
WHERE author="user3");

--4 Write a query to select all articles which do not have any comments (Do using subquery also)

SELECT ar.article_name
FROM article_data.articles AS ar LEFT JOIN article_data.comments AS com 
ON com.article_name = ar.article_name
WHERE com.article_name IS NULL;

--using subquery
SELECT article_name 
FROM article_data.articles
where article_name NOT IN(SELECT
article_name FROM article_data.comments);

--5. Write a query to select article which has maximum comments
SELECT article_name , count(*) as comment_count
FROM article_data.comments
GROUP BY article_name
ORDER BY comment_count DESC
LIMIT 1;

--6. Write a query to select article which does not have more than one comment by the same user ( do this using left join and group by )
SELECT ar.article_name
FROM article_data.articles AS ar LEFT JOIN article_data.comments AS com 
ON com.article_name = ar.article_name
GROUP BY com.comment_author,com.article_name
HAVING count(*)<=1;