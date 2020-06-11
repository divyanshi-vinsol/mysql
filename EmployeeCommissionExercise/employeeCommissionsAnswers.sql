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
SELECT name, salary 
FROM Employees 
ORDER BY salary DESC 
LIMIT 3, 1;
--output
# name	salary
Rahul Dravid	700000

--iii. Find department that is giving highest commission.
SELECT SUM(commission_amount) AS commission,dept.name
FROM employees AS emp JOIN commissions AS com JOIN departments AS dept
ON emp.id=com.employee_id AND dept.id=emp.id
GROUP BY emp.department_id
ORDER BY commission DESC
LIMIT 1;

--output
# commission	name
13000	Banking

--iv. Find employees getting commission more than 3000
SELECT com.commission_amount, GROUP_CONCAT(name) AS NAME
FROM employees as emp JOIN commissions as com ON com.employee_id=emp.id
GROUP BY com.commission_amount 
HAVING com.commission_amount>3000;
--output
# commission_amount	NAME
4000	Chris Gayle,Rahul Dravid
5000	Chris Gayle,Wasim Akram

