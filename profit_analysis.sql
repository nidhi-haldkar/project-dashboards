

select * from departments
select "Department_ID" from departments

select * from employees

select  * from project_assignments

select * from projects;

with project_status as 
		(select project_id, project_name, project_budget, 'upcoming' as status
		from "upcoming_projects"
		union all
		select project_id, project_name, project_budget, 'completed' as status
		from completed_projects)

select 
	e.employee_id, e.first_name, e.last_name, e.email, e.job_title, e.salary,
	d."Department_Name", d."Department_Budget",
	pa.project_id,
	ps.project_name, ps.project_budget, ps.status
from employees e
join departments d 
	on d."Department_ID"=e.department_id
join project_assignments pa
	on pa.employee_id=e.employee_id
join project_status ps
	on pa.project_id=ps.project_id
