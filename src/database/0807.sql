select * from employees a
where salary>=(select b.salary from employees b
where b.hire_date between '98/01/01' and '01/12/31' and a.employee_id= b.employee_id );

select * from employees
where salary = (select min(salary) from employees);

select a.employee_id "�����ȣ", a.emp_name "����̸�", a.department_id "�μ���ȣ", b.department_name "�μ���", a.salary "����" from employees a, departments b
where a.department_id=b.department_id and lower(substr(a.job_id,1,2))='mk' and salary=(select min(salary) from employees where lower(substr(job_id,1,2))='mk');

select to_char(sum(salary),'$000,000'), to_char(avg(salary),'$000,000'), to_char(max(salary),'$000,000'), to_char(min(salary),'$000,000')
from employees
group by department_id;

���޺� ��ü �޿� ����� $10,000���� ū
���޺� �ݿ� ����� ����Ͻÿ�.
�� ������ ����� ���ϰ� ����Ͻÿ�.
select  from employees;

select * from jobs;

select avg(salary) from employees
group by job_id
having job_id in(select job_id from employees
group by job_id
having avg(salary)>10000) and lower(substr(job_id,4,5))!='clerk';

select * from employees
where salary>(select salary from employees
where lower(emp_name) like '%tucker%');

select a.employee_id "�����ȣ", a.emp_name "�����", a.department_id "�μ���ȣ",c.department_name "�μ���", a.job_id "���޹�ȣ", b.job_title "���޸�", a.salary "�޿�", a.hire_date "�Ի���" 
from employees a, jobs b , departments c
where a.job_id = b.job_id  and a.department_id = c.department_id and (a.department_id, a.salary) in(
select department_id, min(salary)
from employees
group by department_id);

//8��
select emp_name "����̸�", case
when lower(job_id) ='hr_rep' then salary*1.1
when lower(job_id) = 'mk_rep' then salary*1.12
when lower(job_id) ='pr_rep' then salary*1.15
when lower(job_id) ='sa_rep' then salary*1.18
when lower(job_id) ='it_prog' then salary*1.2
else salary
end "�λ�޿�",case
when lower(job_id) ='hr_rep' then salary*0.1
when lower(job_id) = 'mk_rep' then salary*0.12
when lower(job_id) ='pr_rep' then salary*0.15
when lower(job_id) ='sa_rep' then salary*0.18
when lower(job_id) ='it_prog' then salary*0.2
else 0
end "�λ�ݾ�", (select sum(case
when lower(job_id) ='hr_rep' then salary*0.1
when lower(job_id) = 'mk_rep' then salary*0.12
when lower(job_id) ='pr_rep' then salary*0.15
when lower(job_id) ='sa_rep' then salary*0.18
when lower(job_id) ='it_prog' then salary*0.2
else 0
end) "�λ�ݾ�" from employees) "���λ�ݾ�" from employees;


select department_id, job_id, sum(salary), count(employee_id)
from employees
group by department_id, job_id
order by department_id;