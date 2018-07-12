create table ex01(
    stu_id number(5) primary key,
    name varchar2(20) not null,
    major varchar2(20),
    rank number(1),
    phone1 number(3),
    phone2 number(4),
    phone3 number(4)
);

alter table ex01 modify stu_id varchar2(5);
alter table ex01 modify phone2 varchar2(4);
alter table ex01 modify phone3 varchar2(4);

desc ex01;
rollback;
commit;

insert into ex01 values('a0001','ȫ�浿','��ǻ�Ͱ���',3,'010','1111','1111');
insert into ex01 values('a0002','�̼���','��ǻ�Ͱ���',4,'010','2222','2222');
insert into ex01(stu_id,name,major) values('a0003','������','��ǻ�Ͱ���');
insert into ex01 values('a0004','������','�����а�',3,'010','8787','8787');
insert into ex01 values('a0005','������','�����а�',2,'010','9999','9999');
insert into ex01 values('a0006','������','�濵�а�',1,'010','8484','8484');

//is not null
select * from ex01;
alter table ex01 add(address varchar2(10));
update ex01 set address='����' where name='�̼���';
update ex01 set address='���' where name='������';
update ex01 set address='������' where name='������';
update ex01 set address='����' where name='������';
update ex01 set major='����ó���а�' where name='�̼���';
update ex01 set phone3='4545' where name='������';
update ex01 set address='������' where name='������';
update ex01 set phone3='2323' where name='������';
delete ex01 where stu_id='a0001';

select * from employees;

select employee_id, emp_name, commission_pct from employees where commission_pct is null;
select employee_id,emp_name,commission_pct from employees where commission_pct is not null;
select employee_id, emp_name from employees where employee_id = any(160,170,180);
select employee_id,emp_name,salary from employees where salary<=10000 and salary>=5000;
select employee_id,emp_name,salary from employees where salary between 5000 and 10000;

select cust_id,cust_name,cust_year_of_birth from customers where cust_year_of_birth between '1948' and '1981';
select a.employee_id,a.emp_name,b.department_id,b.department_name from employees a,departments b where a.department_id=b.department_id;
select a.employee_id,a.emp_name,a.salary,a.manager_id,b.emp_name from employees a, employees b where a.manager_id=124 and a.manager_id=b.employee_id and  a.salary between 2000 and 3000;