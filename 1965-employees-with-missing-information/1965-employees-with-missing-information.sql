select es.employee_id
from (
    select * from employees left join salaries using(employee_id)
    union
    select * from employees right join salaries using(employee_id)
) es
where es.salary is null or es.name is null
order by es.employee_id