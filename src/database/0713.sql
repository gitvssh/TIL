select table_name from user_tables;

create table ex3_4(employee_id) select employee_id from employees where hire_date between '00/10/01' and '00/12/31';

select * from employees;
desc employees;
create table ex3_3(
    employee_id number,
    bonus_amt number default 0
);

select employee_id, hire_date 
from employees 
where hire_date between '00/10/01'and'00/12/31'
;

desc sales;

select * from sales;

select a.employee_id "���� ���̵�",a.emp_name "���� �̸�",b.prod_id "��ǰ ���̵�",c.prod_name "��ǰ��",c.prod_category "��ǰ ����",c.prod_pack_size "��ǰ ������",c.prod_status "��ǰ ����", c.supplier_id "������" from employees a,sales b,products c where a.employee_id=b.employee_id and b.sales_date between '00/10/01' and '00/12/31' and b.prod_id=c.prod_id group by a.employee_id;

select employee_id, sales_month
from sales 
where
sales_month between '200010' and '200012'
group by employee_id, sales_month
;
