-- 1.	Вывести имя, фамилию, зарплату, должность(job_title) и минимальную зарплату(MIN_SALARY) для этой должности для всех сотрудников.

select
		t1.first_name, t1.last_name, t1.salary, t2.job_title, t2.min_salary
from employees t1
join jobs t2 
on t2.job_id = t1.job_id;

-- 2.	Вывести имя, фамилию, должность(job_title), департамент(department_name) и название города(city), где находится департамент.
select 
	t1.first_name, t1.last_name, t2.job_title, t3.department_name, t4.city
from employees t1
join jobs t2
on t1.job_id = t2.job_id
join departments t3
on t3.department_id = t1.department_id
join locations t4
on t4.location_id = t3.location_id;

-- 3. Вывести имя, фамилию, зарплату, должность, минимальную и максимальную зарплату для этой должности только тех сотрудников,
-- у которых зарплата равняется либо минимальной зарплате, либо максимальной.

select
		t1.first_name, t1.last_name, t1.salary, t2.job_title, t2.min_salary, t2.max_salary
from employees t1
join jobs t2 
on t2.job_id = t1.job_id
where t1.salary = t2.min_salary or t1.salary=t2.max_salary;
