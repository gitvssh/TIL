desc user_tables;

select employee_id "�����ȣ", emp_name "�����", salary "����", (salary+salary*nvl(commission_pct,0))*12 "����"
from employees;

select * from employees
where to_char(hire_date,'yyyy/mm/dd')>'1982/01/01';

6. �μ��� IT�̸鼭 ������ PROGRAMMER �� ����� �˻��ϴ� ������ �ۼ��Ͻÿ�.
�����ȣ, �����, �μ���ȣ, �μ���, ���޹�ȣ, ���޸� 

select e.employee_id "�����ȣ", e.emp_name "�����", e.department_id "�μ���ȣ", d.department_name "�μ���", e.job_id "���޹�ȣ", j.job_title "���޸�"
from employees e, departments d, jobs j
where e.department_id=d.department_id and e.job_id=j.job_id and lower(d.department_name) like '%it%' and lower(j.job_title)='programmer';

7. �޿��� 3000�޷����� 8000�޷� �� ����� �˻��ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where salary between 3000 and 8000;

8. �޿��� 2000�޷� �Ǵ� 3000�޷� �Ǵ� 4000�޷��� ����� �˻��ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where salary in(2000,3000,4000);

9. ����� �߿��� �̸��� K�� �����ϴ� ����� �����ȣ, ������� �˻��ϴ� ������ �ۼ��Ͻÿ�.

select employee_id "�����ȣ", emp_name "�����"
from employees
where lower(emp_name) like 'k%';

10.  ����� �� ��° ���ڰ� a�� ����� �˻��ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where substr(emp_name,3) like 'a%';

11.  Ŀ�̼��� NULL �� �ƴ� ����� �˻��ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where commission_pct is not null;

12.  ������� Z ���� �����ϵ��� �˻� ������ �ۼ��Ͻÿ�.

select * from employees
order by emp_name desc;

13.  �� ������� ����� �Ҽ��� 2�ڸ����� �ݿø��ؼ� ǥ���ϴ� ������ �ۼ��Ͻÿ�.

select round((salary+salary*nvl(commission_pct,0))*12,2) "����"
from employees;

14.  ����� Ȧ�� �ִ� ����� �˻��ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where mod(employee_id,2)=1;

15.  9���� �Ի��� ����� �˻��ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where substr(hire_date,4,2)='09';

16.  �޿��� 10�ڸ��� ǥ���� �ؼ� ���� ���� �ڸ��� 0���� ä��� ������ �ۼ��Ͻÿ�.

select to_char(salary,'0000000000') from employees;

17.  ������� ������ ���ְ� ����ϴ� ������ �ۼ��Ͻÿ�.

select replace(emp_name,' ','') from employees;

18. ������ �̸����� ���ļ� ����ϴ� ������ �ۼ��Ͻÿ�.

select concat(emp_name,email) from employees;

19.  ������� �ٹ��ϼ��� ���ϴ� ������ �ۼ��Ͻÿ�.

select floor(sysdate-hire_date)||'��' from employees;

20.  ������� �ٹ��������� ���ϴ� ������ �ۼ��Ͻÿ�. * �Ҽ������� ����

select floor(months_between(sysdate,hire_date))||'����' from employees;

21.  �Ի糯¥�� ��) 2000-12-31�̶�� ���·� ����ϴ� ������ �ۼ��Ͻÿ�.

select to_char(hire_date,'yyyy-mm-dd') "�Ի糯¥" from employees;

22.  �޿��� \�� ǥ���ؼ� ����ϴ� ������ �ۼ��Ͻÿ�. 1�޷� = 1200�� ���
�ڸ����� 12�ڸ��� ǥ���ϰ�, ���� �ڸ������� 0���� ǥ��

select to_char(salary*1200,'l000000000000') from employees;

23.���޿� ���� �޿��� �λ��Ϸ� �Ѵ�. 
������ man �� ����� 5%, asst ����� 10%, prog�� ����� 15%, , clerk�� ����� 20%, 
�׿� 3%�� �λ��� ������ ���Ͻÿ�. 
( �����ȣ,�����, �������, ����, �λ���� )

select employee_id "�����ȣ", emp_name "�����", salary "�������", job_id "����", case
when lower(substr(job_id,4))='man' then salary*(1.05)
when lower(substr(job_id,4))='asst' then salary*(1.10)
when lower(substr(job_id,4))='porg' then salary*(1.15)
when lower(substr(job_id,4))='clerk' then salary*(1.20)
else salary*(1.03)
end "�λ����"
from employees;

24.  �μ����̺��� parent��ȣ�� 90�̸鼭 �μ��� ������ �ִ밪�� ���Ͻÿ�.
(�μ���ȣ, �ִ밪(����))

select a.department_id "�μ���ȣ", max(a.salary) "�μ��� �ִ����"
from employees a
where exists(
select * from departments b
where b.parent_id = 90 and a.department_id=b.department_id)
group by a.department_id;

25.  �Ի�⵵�� �ִ� ������ �޴� ������� �����ȣ, �����, ����,�⵵�� ���Ͻÿ�

select a.employee_id "�����ȣ", a.emp_name "�����", a.salary "����" ,to_char(a.hire_date,'yyyy') "�Ի�⵵"  
from employees a
where a.salary in(select max(b.salary)
from employees b
group by to_char(b.hire_date,'yyyy')
having to_char(a.hire_date,'yyyy')=to_char(b.hire_date,'yyyy'))
order by to_char(a.hire_date,'yyyy');


26.  �μ��� ��� �޿��� 6000�̻��� �μ���ȣ�� �μ��� ��� �޿��� ����ϴ� ������ �ۼ��Ͻÿ�.
select department_id "�μ���ȣ", avg(salary) "�μ��� ��� �޿�"
from employees
group by department_id
having avg(salary)>=6000
order by department_id;

27.  �Ŵ����� Steven king�� ����� �����ȣ, ����̸�, �޿�,�Ŵ�����ȣ,�Ŵ���(���)�̸���
���ϴ� ������ �ۼ��Ͻÿ�..

select a.employee_id "�����ȣ", a.emp_name "����̸�", a.salary "�޿�", a.manager_id "�Ŵ�����ȣ", b.emp_name "�Ŵ��� �̸�"
from employees a, employees b
where a.manager_id=b.employee_id and lower(b.emp_name)='steven king';

28.  Douglas Grant �� ���� �μ� ������� ����ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where department_id=(
select department_id from employees
where emp_name = 'Douglas Grant');


33.  50�� �μ��� �ٹ��ϴ� ����� �̸��� �μ����� ����ϴ� ������ �ۼ��Ͻÿ�.
* ���������� ����� ��

select a.emp_name "����̸�", b.department_name "�μ���"
from employees a, departments b
where a.department_id = b.department_id and a.department_id =(
select distinct department_id from employees
where department_id = 50);

34.  �޿��� 10000�޷� �̻��� �޴� ����� �ٹ��ϴ� �μ��� �μ� ������� ����ϴ� ������ �ۼ��Ͻÿ�.

select * from employees
where department_id in(
select distinct department_id
from employees
where salary>=10000);