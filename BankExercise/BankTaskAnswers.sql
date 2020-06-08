--i) userA is depositing 1000 Rs. his account
START TRANSACTION;
LOCK TABLES accounts WRITE, users READ;
UPDATE accounts 
SET balance=balance+1000 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick");
COMMIT;
UNLOCK TABLES;

--ii) userA is withdrawing 500 Rs.
START TRANSACTION;
LOCK TABLES accounts WRITE, users READ;
UPDATE accounts 
SET balance=balance-500 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick");
COMMIT;
UNLOCK TABLES;

--iii) userA is transferring 200 Rs to userB's account
START TRANSACTION;
LOCK TABLES accounts WRITE, users READ;
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
UNLOCK TABLES;