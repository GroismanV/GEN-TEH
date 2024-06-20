-- 2. Найти сотрудников, которые зарабатывают меньше всего в своем департаменте. Вывести имя, фамилию сотрудника, его зп и номер департамента
SELECT 
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id
FROM 
    employees e
WHERE 
    e.salary = (SELECT max(salary) FROM employees WHERE department_id = e.department_id);

-- 2. Найти сотрудников, у которых наибольшая зарплата в их департаменте

-- Найти макс зарплату в каждом департаменте

select
 department_id,
 max(salary)
from employees
group by department_id;

-- Под найденную зарплату подставить имя и фамилию

select
 t1.first_name,
    t1.last_name,
    t1.salary
from employees t1
join (
 select
  department_id,
  max(salary) as max_salary
 from employees
 group by department_id
) t2
on t1.department_id = t2.department_id
where t1.salary = t2.max_salary;

-- 3. Вывести самую большую зп в каждом департаменте, если значение зп больше 10000

SELECT 
    department_id, MAX(salary) AS max_salary
FROM
    employees
GROUP BY department_id
HAVING max_salary > 10000;

select
 department_id,
 max(salary) as max_salary
from employees
where salary > 10000
group by department_id;

-- 5. Найти самую маленькую зарплату в каждом департаменте. Вывести название департамента и самую маленькую зарплату в нем
select
 department_name,
 min(salary)
from employees
join departments on departments.department_id=employees.department_id
group by department_name;