--i. Find the employee who gets the highest total commission.
SELECT SUM(commission_amount) AS commission,emp.name 
FROM employees as emp JOIN commissions as com 
ON emp.id=com.employee_id 
GROUP BY com.employee_id
ORDER BY commission DESC
LIMIT 1;
--output
# commission	name
9000	Chris Gayle

--ii. Find employee with 4th Highest salary from employee table.
SELECT name 
FROM Employees 
ORDER BY salary DESC 
LIMIT 3, 1;
--output
# name
Rahul Dravid

--iii. Find department that is giving highest commission.
SELECT SUM(commission_amount) AS commission,dept.name
FROM employees as emp JOIN commissions as com JOIN departments as dept
ON emp.id=com.employee_id and dept.id=emp.id
GROUP BY com.employee_id
ORDER BY commission DESC
LIMIT 1;

--output
# commission	name
9000	Banking

--iv. Find employees getting commission more than 3000
SELECT commission_amount, GROUP_CONCAT(name) 
FROM employees as emp JOIN commissions as com ON com.employee_id=emp.id 
WHERE commission_amount>3000 
GROUP BY commission_amount;
--output
# commission_amount	GROUP_CONCAT(name)
4000	Rahul Dravid,Chris Gayle
5000	Chris Gayle,Wasim Akram
