create table result(
    stu_id number(3),
    stu_name varchar2(20),
    kor number(3),
    eng number(3),
    math number(3),
    ave number(3,2),
    total number(3),
    rank number(3)
);

//�Է½� �����, number �ڸ���
insert into result(stu_id,stu_name,kor,eng,math,ave,total,rank) values(1,'ȫ�浿',80,80,80,(80+80+80)/3,80+80+80,'');

//desc ��������, order by default ��������(asc)
select * from employees order by employee_id desc;

commit;

//where ����
select * from employees where employee_id>150 and salary>8300;

select * from employees where salary=9500 order by employee_id;

select * from employees where salary>10000 and department_id=80 order by employee_id;
//�Ѱ���
select distinct department_id from employees;

select * from departments;

select emp_name,salary,department_id  from employees order by salary;

select distinct employee_id, emp_name, email, phone_number, hire_date, salary,parent_id, employees.department_id from employees, departments where employees.department_id=departments.department_id;

select * from employees where job_id='IT_PROG' and salary>5000;
//�˻�����
select * from employees where employee_id>=140 or job_id='SA_REP' order by employee_id asc;

//join
select * from jobs;

select * from employees;

select distinct employees.job_id,jobs.job_title from employees,jobs where employees.job_id=jobs.job_id;

select distinct job_id from employees;

select * from departments;
//�����˻�
select departments.*,employees.emp_name "manager ID" from departments,employees where departments.manager_id=employees.employee_id;
//����
select a.*,b.emp_name "manager ID" from departments a,employees b where a.manager_id=b.employee_id;

select emp_name from employees where employee_id=200;

select a.prod_id,a.cust_id,a.channel_id,a.employee_id,b.emp_name "EMPLOYEE_NAME" from sales a,employees b where a.employee_id=b.employee_id;

select a.prod_id,a.cust_id,c.cust_name,a.channel_id,a.employee_id,b.emp_name "EMPLOYEE_NAME",a.sales_date 
from sales a,employees b,customers c 
where a.employee_id=b.employee_id and a.cust_id=c.cust_id;

select emp_name from employees where employee_id=157;

select * from employees;

select employee_id, emp_name, salary*12/11 "����(����)" from employees;
select employee_id, emp_name,salary,nvl(commission_pct,0), salary*(1+nvl(commission_pct,0)) "����" from employees;

select * from employees where hire_date >'00/03/19';

select * from result;

delete from result;

insert into result values(1,'ȫ�浿',82,99,89,'','','');

insert into result values(2,'�̼���',99,100,100,'','','');

insert into result values(3,'������',89,97,95,'','','');

insert into result(stu_id,stu_name) values(2,'�̼���');

insert into result values(4,'��âȣ',82,99,89,'','','');

select * from result;

desc result;

delete from result where stu_id=2;

update result set stu_id=3;

update result set stu_id=2 where stu_name='������';

commit;

select stu_id,stu_name,kor,eng,math,(kor+eng+math)/3 "ave",kor+eng+math "�հ�" from result;

create table result2(
    stu_id number(3),
    stu_name varchar2(10),
    stu_major varchar2(10),
    kor number(3),
    eng number(3),
    math number(3),
    science1 number(3),
    science2 number(3),
    ave number(5,2),
    total number(5)
);

insert into result2(stu_id,stu_name,stu_major,kor,eng,math,science1) values (3,'�̼���','�̰�',100,100,100,100);

update result2 set science1=90 where stu_id=1;

select * from result2;

select stu_id,stu_name,(kor+eng+math+nvl(science1,0)+nvl(science2,0))/4 "���",(kor+eng+math+nvl(science1,0)+nvl(science2,0)) "�հ�" from result2;

update result2 set kor=87,eng=97,math=100,science1=88 where stu_id=1;
update result2 set kor=90,eng=100,math=95,science2=99 where stu_id=2;
update result2 set kor=98,eng=99,math=97,science1=96 where stu_id=3;

select table_name from user_tables;
rollback;
commit;


select * from employees;

select salary "�⺻��", salary*12 "����", salary*(1+nvl(commission_pct,0))"�̴��� ����" from employees;

create table join(
    id varchar2(10),
    pass varchar2(10),
    name varchar2(20),
    p_num number(3),
    p_num2 number(4),
    p_num3 number(4),
    address varchar2(5),
    email varchar2(20)
);

alter table join modify p_num3 varchar2(4);
alter table join modify address varchar2(10);

desc join;

commit;

insert into join values('aaa','a111','ȫ�浿','010','1111','1111','�����','aaa@naver.com');
insert into join values('bbb','b222','�̼���','010','2222','2222','�λ��','bbb@daum.net');
insert into join values('ccc','c333','������','010','3333','3333','���ֽ�','ccc@google.com');

select * from join;

alter table join add(post_num2 number(3));

alter table join add(nation_num varchar2(3));
update join set nation_num='82';

select p_num||'-'||p_num2||'-'||p_num3 "��ȭ��ȣ" from join;

select '+'||nation_num||')'||p_num||'-'||p_num2||'-'||p_num3 "������ȭ" from join;

select emp_name, salary from employees where salary>=5000 and salary<=10000;

select emp_name, salary from employees where salary <> 10000;

select emp_name, salary,
case when salary<=5000 then 'c���'
when salary>5000 and salary<10000 then 'b���'
when salary>=10000 and salary<1100 then 'a���'
else 'a+���'
end "���޵��ǥ"
from employees;

select * from employees;

select employee_id, emp_name,
case when employee_id>=100 and employee_id<=140 then '1������ �̵�'
when employee_id>140 and employee_id<=180 then '2������ �̵�'
else '3������ �̵�'
end "������ġ"
from employees;

create table result3(
    name varchar2(10),
    java number(3),
    html number(3),
    js number(3),
    oracle number(3),
    ave number(5,2),
    sum number(5),
    grade varchar2(10)
);



insert into result3(name, java, html, js, oracle) values('������',90,100,100,90);
insert into result3(name, java, html, js, oracle) values('��α�',98,95,90,90);
insert into result3(name, java, html, js, oracle) values('ȫ�浿',82,79,99,81);
insert into result3(name, java, html, js, oracle) values('�̼���',70,75,81,79);

select name,java,html,js,oracle,(java+html+js+oracle)/4 "���", (java+html+js+oracle) "�հ�",
case when (java+html+js+oracle)/4 >=90 then 'A���'
when (java+html+js+oracle)/4<90 and (java+html+js+oracle)/4>=80 then'B���'
when (java+html+js+oracle)/4<80 and (java+html+js+oracle)/4>=70 then'C���'
else 'D���'
end "���"
from result3;

select * from employees;
//���� ���ǽ�
select salary from employees where salary>5000 and salary<=10000;
select salary from employees where salary between 5000 and 10000;

//or ���ǽ�
select salary from employees where salary=5000 or salary=6000 or salary=7000;
select salary from employees where salary = any(5000,6000,7000);
select salary from employees where salary = some(5000,6000,7000);
select salary from employees where salary in(5000,6000,7000);

//and ���ǽ�
select salary from employees where salary=5000 and salary=6000 and salary=7000;
select salary from employees where salary = all(5000,6000,7000);

select manager_id from employees where manager_id=148 or manager_id=149;
select manager_id from employees where manager_id = any(148,149);
select manager_id from employees where manager_id = some(148,149);
select manager_id from employees where manager_id in(148,149);

select salary from employees where salary>=4000 and salary<=8000;
select salary from employees where salary between 4000 and 8000;

select hire_date from employees where hire_date>'07/12/31' and hire_date>'05/09/21';

select employee_id from employees where employee_id in(100,150,160,170);
select employee_id from employees where employee_id = any(100,150,160,170);
select employee_id from employees where employee_id = some(100,150,160,170);