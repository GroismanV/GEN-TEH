-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt

-- "employeescnt" скорее всего является сокращением от "employees count" 
-- (количество сотрудников) на английском языке.
-- Это может использоваться для обозначения общего числа сотрудников в компании или организации.
-- Такие сокращения часто используются в бизнесе и управлении для краткости и удобства.
 SELECT 
    departments.department_id,
    COUNT(employees.employee_id) AS employeescnt
FROM 
    departments
JOIN 
    employees  ON departments.department_id = employees.department_id
GROUP BY 
    departments.department_id;
 

-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt
SELECT 
    departments.department_name,
    COUNT(employees.employee_id) AS employeescnt
FROM 
    departments
JOIN 
    employees  ON departments.department_id = employees.department_id
GROUP BY 
    departments.department_name;

-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt
SELECT 
    manager_id, COUNT(employee_id) AS employeescnt
FROM
    employees
GROUP BY manager_id;

-- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt
SELECT
  t1.first_name AS manager_firstname,
  t1.last_name AS manager_lastname,
  COUNT(t2.employee_id) AS employees_cnt
FROM
  employees t2
JOIN
  employees t1 ON t2.manager_id = t1.employee_id
GROUP BY
  t1.employee_id, t1.first_name, t1.last_name;


-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
SELECT 
    department_id, MAX(salary) AS max_salary
FROM
    employees
GROUP BY department_id;
 
-- Найти сотрудников, у которых наибольшая зарплата в их департаменте
SELECT 
    t1.employee_id,
    t1.first_name,
    t1.last_name,
    t1.salary,
    t1.department_id
FROM 
    employees t1
JOIN (
    SELECT 
        department_id, 
        MAX(salary) AS max_salary
    FROM 
        employees
    GROUP BY 
        department_id
) AS max_salaries
ON 
    t1.department_id = max_salaries.department_id
    AND t1.salary = max_salaries.max_salary;


-- Найти департаменты, в которых больше 10 сотрудников. Вывести department_name
SELECT 
    department_name
FROM
    employees t2
        JOIN
    departments t1 ON t1.department_id = t2.department_id
GROUP BY t1.department_id , t1.department_name
HAVING COUNT(t2.employee_id) > 10;


