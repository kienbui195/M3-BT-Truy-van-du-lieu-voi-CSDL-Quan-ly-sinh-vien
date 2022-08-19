use quanlysinhvien;

select *
from subject
where credit = (select max(credit) from subject);


select s.subname, s.credit, s.status, m.mark
from mark m
join subject s on s.subid = m.subid
where m.mark = (select max(mark) from mark);



select s.studentid,s.studentname, s.address, s.status, AVG(m.mark) as DemTB
from mark m
join student s on s.studentid = m.studentid
group by studentname;


