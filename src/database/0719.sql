select count(manager_id) from employees;

select count(distinct department_id) from employees;
select distinct department_id from employees order by 1;
select to_char(sum(salary),'$999,999') from employees;
select trunc(round(avg(salary),2)) from employees;
select variance(salary) from employees;
select stddev(salary) from employees;

select a.department_id,b.department_name,round(avg(a.salary),2) 
from employees a, departments b
where a.department_id = b.department_id
group by a.department_id,b.department_name
order by 1;

select employee_id,department_id, sum(salary)
from employees
group by employee_id, department_id;

select period,region,sum(loan_jan_amt) from kor_loan_status
where substr(period,1,4)='2013'
group by region,period
order by 2;
select period,sum(loan_jan_amt) from kor_loan_status
where period like '2013%'
group by period;

select period,region,sum(loan_jan_amt)
from kor_loan_status
where period='201311'
group by period,region;

select job_id, avg(salary)
from employees
where floor(to_number(sysdate-hire_date))/365 between 8 and 11
group by job_id;

select employee_id,sum(amount_sold),substr(sales_date,1,5)
from sales
where employee_id between 150 and 159
group by employee_id,substr(sales_date,1,5)
having sum(amount_sold)>1000000
order by 3;

select * from kor_loan_status;

select period,region,sum(loan_jan_amt)
from kor_loan_status
where substr(period,1,4) between 2012 and 2013
having sum(loan_jan_amt)>100000
group by period,region;

select period,gubun, sum(loan_jan_amt)
from kor_loan_status
where period like '2013%'
group by period, gubun;
//�Ѿ�? �߰���������, ???
select period,gubun, sum(loan_jan_amt)
from kor_loan_status
where period like '2013%'
group by rollup(period),gubun;

select manager_id,job_id,sum(salary)
from employees
group by rollup(manager_id),job_id;

select manager_id,job_id,sum(salary)
from employees
group by cube(manager_id,job_id);

select a.employee_id, a.sales_month, sum(amount_sold)
from sales a, employees b
where substr(b.hire_date,1,2) between 98 and 99 and a.employee_id=b.employee_id
group by a.employee_id,rollup(a.sales_month);

select a.employee_id, a.sales_month, sum(amount_sold)
from sales a, employees b
where b.hire_date between '98/01/01' and '99/12/31' and a.employee_id=b.employee_id
group by a.employee_id,rollup(a.sales_month);

create table exp_goods_asia(
    country varchar2(10),
    seq number,
    goods varchar2(80)
)

insert into exp_goods_asia values('�ѱ�',1,'�������� ������');
insert into exp_goods_asia values('�ѱ�',2,'�ڵ���');
insert into exp_goods_asia values('�ѱ�',3,'��������ȸ��');
insert into exp_goods_asia values('�ѱ�',4,'����');
insert into exp_goods_asia values('�ѱ�',5,'LCD');
insert into exp_goods_asia values('�ѱ�',6,'�ڵ�����ǰ');
insert into exp_goods_asia values('�ѱ�',7,'�޴���ȭ');
insert into exp_goods_asia values('�ѱ�',8,'ȯ��źȭ����');
insert into exp_goods_asia values('�ѱ�',9,'�����۽ű� ���÷��� �μ�ǰ');
insert into exp_goods_asia values('�ѱ�',10,'ö �Ǵ� ���ձݰ�');

insert into exp_goods_asia values('�Ϻ�',1,'�ڵ���');
insert into exp_goods_asia values('�Ϻ�',2,'�ڵ�����ǰ');
insert into exp_goods_asia values('�Ϻ�',3,'��������ȸ��');
insert into exp_goods_asia values('�Ϻ�',4,'����');
insert into exp_goods_asia values('�Ϻ�',5,'�ݵ�ü������');
insert into exp_goods_asia values('�Ϻ�',6,'ȭ����');
insert into exp_goods_asia values('�Ϻ�',7,'�������� ������');
insert into exp_goods_asia values('�Ϻ�',8,'�Ǽ����');
insert into exp_goods_asia values('�Ϻ�',9,'���̿���,Ʈ��������');
insert into exp_goods_asia values('�Ϻ�',10,'����');
delete exp_goods_asia where seq=1 and country is null;
update exp_goods_asia set goods='�ڵ���' where country='�Ϻ�' and seq=2;
select * from exp_goods_asia;

create sequence seq_trade
start with 1
increment by 1
maxvalue 1000
minvalue 1;

select employee_id,sum(salary) from employees;
insert into exp_goods_asia(seq) values (seq_trade.nextval);

select goods from exp_goods_asia
where country='�ѱ�'
intersect
select goods from exp_goods_asia
where country='�Ϻ�'
;
