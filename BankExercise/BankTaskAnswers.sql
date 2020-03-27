--i) userA is depositing 1000 Rs. his account
UPDATE accounts 
SET balance=balance+1000 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick");
--ii) userA is withdrawing 500 Rs.
UPDATE accounts 
SET balance=balance-500 
WHERE account_no=(
SELECT account_no 
FROM users 
WHERE name="Nick");
--iii) userA is transferring 200 Rs to userB's account
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