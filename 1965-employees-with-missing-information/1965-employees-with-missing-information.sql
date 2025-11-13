select es.employee_id
from (
    select employee_id from employees
    union
    select employee_id from salaries
) es
where employee_id not in (select e.employee_id from employees e
join salaries s on e.employee_id = s.employee_id)
order by es.employee_id