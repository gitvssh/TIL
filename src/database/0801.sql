create table member(
M_id varchar2(12),
M_password varchar2(16),
m_name varchar2(20),
m_birth number(8),
m_sex varchar2(2),
m_phonenum number(11),
m_event varchar2(20)
);


select * from member;

update member set m_event='0'
where m_sex = '��';

select m_id "���̵�", m_password "���", m_name "�̸�", m_birth "�������", m_sex "����", m_phonenum "��ȭ��ȣ" ,
case when m_event ='1' then '���'
else '����'
end "�̺�Ʈ"
from member;