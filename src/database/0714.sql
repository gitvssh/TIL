select table_name from user_tables;

select * from employees;

select abs(-10), abs(10) from dual;

select * from sales;

select trunc(amount_sold,-1) from sales;
//mod
select mod(11,2) from dual;

select employee_id from employees where mod(employee_id,2)=1;
select employee_id, 
case when mod(employee_id,2)=1 then 'Ȧ��'
when mod(employee_id,2)=0 then '¦��'
end "Ȧ��", emp_name from employees;

select * from employees where emp_name = 'William Smith';
//��ҹ��� ���� X
select * from employees where lower(emp_name) = 'william smith';
select * from employees where upper(emp_name) = 'WILLIAM SMITH';
select initcap(emp_name) from employees where upper(emp_name) = 'WILLIAM SMITH';
//���ڿ� �������
select concat('ezen','academy'),'Happy'||'birthday to you'from dual;
select concat(emp_name,email) from employees;
select emp_name||' + '||email||' + '||employee_id "�̸��̶� �̸��� �������" from employees;

create table ex01(
    id varchar2(10),
    f_name varchar2(10),
    l_name varchar2(10),
    sex varchar2(4),
    tel1 varchar2(3),
    tel2 varchar2(4),
    tel3 varchar2(4),
    birth number(8),
    address varchar2(30)
);

insert into ex01 values('a001','��','����','��','010','1111','1111',19880101,'����');
insert into ex01 values('a002','��','����','��','010','2222','2222',19780401,'�λ�');
insert into ex01 values('a003','��','����','��','010','3333','3333',19680701,'����');
insert into ex01 values('a004','��','����','��','010','4444','4444',19981001,'����');
insert into ex01 values('a005','��','âȣ','��','010','5555','5555',20000201,'����');

select * from ex01;

select concat(f_name,l_name) "Ǯ����",tel1||'-'||tel2||'-'||tel3 "��ȭ��ȣ" from ex01;
select substr(birth,5,2) from ex01;

select concat(f_name,l_name) "name", birth as birth, substr(birth,5,2) "�¾ ��", 
case when substr(birth,5,2) in(12,01,02) then '�ܿ�'
when substr(birth,5,2) = any(03,04,05) then '��'
when substr(birth,5,2) = some(06,07,08) then '����'
else '����'
end "����" from ex01;

select * from employees;

select email from employees where substr(hire_date,4,2)='03';
//ltrim
select rtrim('abcdeghabc','abc') from dual;
select rtrim('    abcdefg       ') from dual;
select trim('    abcd  efg       ') from dual;