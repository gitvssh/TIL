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
//���̺� ��ü����
create table employees_02 as select * from employees;
//���̺� ���ú���
insert into employees_02 select * from employees where manager_id=147;

create table ex01(
    stu_id varchar2(3),
    name varchar2(20),
    kor number(3),
    eng number(3),
    math number(3),
    ave number(3),
    rank number(3),
    total number(3)
);

insert into ex01(stu_id,name,kor,eng,math) values('001','ȫ�浿',100,89,95);
insert into ex01(stu_id,name,kor,eng,math) values('002','�̼���',99,92,98);
insert into ex01(stu_id,name,kor,eng,math) values('003','������',88,100,100);
select * from ex01;
alter table ex01 drop column rank;
alter table ex01 add rank varchar2(3);

delete result;
desc result;
commit;
select * from result;
insert into result(stu_id,name,kor,eng,math,ave,total) 
select stu_id,name,kor,eng,math,(kor+eng+math)/3,kor+eng+math from ex01;
insert into result(stu_id,name,kor,eng,math) values('004','������',88,80,79);
insert into result(stu_id,name,kor,eng,math) values('005','������',79,75,75);
insert into result(stu_id,name,kor,eng,math) values('006','��âȣ',66,65,68);
update result set ave=(kor+eng+math)/3;
update result set total=kor+eng+math;

drop table ex01;
commit;
create table ex01(
    id varchar2(5),
    name varchar2(10),
    major varchar2(10),
    kor number(3),
    eng number(3),
    math number(3),
    science1 number(3),
    science2 number(3)
);
select * from ex01;
insert into ex01(id,name,major,kor,eng,math,science1) values('a001','�̼���','�̰�',100,85,100,99);
insert into ex01(id,name,major,kor,eng,math,science1) values('a002','ȫ�浿','�̰�',99,99,88,80);
insert into ex01(id,name,major,kor,eng,math,science2) values('a003','��âȣ','����',100,70,80,80);
insert into ex01(id,name,major,kor,eng,math,science2) values('a004','������','����',70,75,78,78);
insert into ex01(id,name,major,kor,eng,math,science1) values('a005','������','�̰�',65,66,69,69);
insert into ex01(id,name,major,kor,eng,math,science1) values('a006','������','�̰�',89,100,90,100);
insert into ex01(id,name,major,kor,eng,math,science2) values('a007','�̹���','����',100,100,90,90);
commit;

select (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4 "���",(kor+eng+math+nvl(science1,0)+nvl(science2,0)) "�հ�",
case when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4 >=90 then 'A'
when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4>= 80 then 'B'
when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4>= 70 then 'C'
when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4>= 60 then 'D'
else 'F'
end
from ex01;

create table ex02 as select * from ex01;
alter table ex02 add ave number(3);
alter table ex02 add total number(3);
alter table ex02 add grade varchar2(3);
select * from ex02;
update ex02 set ave=(kor+eng+math+nvl(science1,0)+nvl(science2,0))/4, total=(kor+eng+math+nvl(science1,0)+nvl(science2,0)),
grade=case when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4 >=90 then 'A'
when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4>= 80 then 'B'
when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4>= 70 then 'C'
when (kor+eng+math+nvl(science1,0)+nvl(science2,0))/4>= 60 then 'D'
else 'F'
end;

select * from employees where commission_pct is null;

select * from employees where emp_name like '___n%';

select * from employees where email like '%LL%';

select a.employee_id,a.emp_name,a.job_id,c.job_title,b.department_id,b.department_name from employees a,departments b,jobs c where  a.job_id=c.job_id and a.department_id=b.department_id and c.job_title like '%n%';

select department_id, department_name from departments a
where exists ( select * from employees b where a.department_id = b.department_id and b.salary>3000);

select job_id, job_title from jobs a
where exists ( select * from employees b where a.job_id=b.job_id and b.salary between 3000 and 12000);

select job_id, salary from employees a
where exists ( select * from jobs b where a.job_id=b.job_id and a.salary between 3000and 12000);
//���ڰ����Լ� abs
select abs(10), abs(-10), abs(-10.123) from dual;
//ceil �ø�, floor ����, round �ݿø�
select ceil(10.123), ceil(10.541), ceil(11.001) from dual;
select floor(10.123), floor(10.541), floor(11.001) from dual;
select round(10.123,2), round(10.541,2), round(11.001,2) from dual;

select salary, salary*nvl(commission_pct,0) from employees;
create table employees_02 as select * from employees;

select commission_pct from employees_02;

create table ex02(
    id number(8,2)
);
desc employees_02;
drop table employees_02;
delete employees_02;
insert into ex02 values(round(100.234,2));
insert into ex02 values(round(100.23456,2));
insert into ex02 values(round(100.234235,3));
insert into ex02 values(round(100000.2345,3));
select * from ex02;
create table employees_02 as select * from employees;

update employees_02
set salary=round(salary*1.003);

insert into employees_02(employee_id,emp_name,email,phone_number,hire_date,salary,manager_id,commission_pct,retire_date,department_id,job_id,create_date,update_date) select a.employee_id,a.emp_name,a.email,phone_number,a.hire_date,a.salary*1.003,a.manager_id,a.commission_pct,a.retire_date,a.department_id,a.job_id,a.create_date,a.update_date from employees a;

select salary from employees_02;

select salary from employees;

drop table employees_02;
drop table ex02;
commit;
select table_name from user_tables;

create table result(
    stu_id varchar2(3),
    name varchar2(20),
    major varchar2(20),
    kor number(3),
    eng number(3),
    math number(3),
    sc1 number(3),
    sc2 number(3),
    ave number(5,2),
    total number(3),
    rank number(3)
);

insert into result(stu_id,name,major,kor,eng,math,sc1,sc2) 
values('a01','ȫ�浿','�̰�',100,99,98,100,'');
insert into result(stu_id,name,major,kor,eng,math,sc1,sc2) 
values('a02','�̼���','�̰�',80,88,87,80,'');
insert into result(stu_id,name,major,kor,eng,math,sc1,sc2) 
values('a03','������','����',70,77,74,'',76);
insert into result(stu_id,name,major,kor,eng,math,sc1,sc2) 
values('a04','��âȣ','����',60,65,67,'',69);

select * from result;

update result set ave=(kor+eng+math+nvl(sc1,0)+nvl(sc2,0))/4;
update result set ave=round(ave,1);
update result set total = (kor+eng+math+nvl(sc1,0)+nvl(sc2,0));
alter table result modify rank varchar(5);
desc result;
update result set rank=
case when ave>=90 then 'A'
when ave>=80 then 'B'
when ave>=70 then 'C'
when ave>=60 then 'D'
else 'F'
end;

create table day_sal(
    id varchar2(3),
    name varchar2(20),
    d_salary number(9,2),
    m_salary number(10,2),
    y_salary number(12,2)
);

insert into day_sal(id,name,d_salary) values('a01','ȫ�浿',180780);
insert into day_sal(id,name,d_salary) values('a02','�̼���',145682);
insert into day_sal(id,name,d_salary) values('a03','������',234560);
insert into day_sal(id,name,d_salary) values('a04','��âȣ',280123);
insert into day_sal(id,name,d_salary) values('a05','������',127856);
commit;

select * from day_sal;

update day_sal set d_salary=d_salary+(d_salary*0.045);
update day_sal set m_salary=d_salary*20, y_salary=m_salary*12;

drop table result;
drop table day_sal;