--i. Find the employee who gets the highest total commission.
CREATE VIEW highest_commission AS
SELECT SUM(commission_amount),employee_id
FROM commissions 
GROUP BY employee_id 
ORDER BY 1 DESC 
LIMIT 1;

SELECT Name 
FROM employees
WHERE id=(
SELECT employee_id 
FROM highest_commission);
--ii. Find employee with 4th Highest salary from employee table.
SELECT name 
FROM Employees 
ORDER BY salary DESC 
LIMIT 3, 1;
--iii. Find department that is giving highest commission.
SELECT Name 
FROM Departments
WHERE ID=(SELECT Department_id 
FROM employees
WHERE id=(
SELECT employee_id 
FROM highest_commission));
--iv. Find employees getting commission more than 3000
SELECT commission_amount, GROUP_CONCAT(name) 
FROM employees e JOIN commissions c ON c.employee_id=e.id 
WHERE commission_amount>3000 
GROUP BY 1;