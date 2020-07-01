--i) userA is depositing 1000 Rs. his account
START TRANSACTION;

SELECT * FROM users 
WHERE name="Nick" LOCK IN SHARE MODE;

SELECT * FROM accounts WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick") FOR UPDATE;

UPDATE accounts 
SET balance=balance+1000 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick");

COMMIT;


--ii) userA is withdrawing 500 Rs.
START TRANSACTION;

SELECT * FROM users 
WHERE name="Nick" LOCK IN SHARE MODE;

SELECT * FROM accounts WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick") FOR UPDATE;

UPDATE accounts 
SET balance=balance-500 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick");

COMMIT;


--iii) userA is transferring 200 Rs to userB's account
START TRANSACTION;

SELECT * FROM users 
WHERE name="Nick" AND name="Harry" LOCK IN SHARE MODE;

SELECT * FROM accounts WHERE account_no IN(
SELECT account_no 
FROM users 
WHERE name="Nick" AND name="Harry") FOR UPDATE;

UPDATE accounts 
SET balance=balance-200 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick");

UPDATE accounts 
SET balance=balance+200 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Harry");

COMMIT;
