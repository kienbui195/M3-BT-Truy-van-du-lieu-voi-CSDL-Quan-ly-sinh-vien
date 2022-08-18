show databases ;
use quanlysinhvien;
select * from student;
select *  from student where studentname like 'H%';
select *  from class where month(startdate) = '12';
select *  from subject where  credit between 3 and 5;

update student
set classid = 2
where studentname = 'Hung';

select s.studentname, sub.subname, m.mark
from mark m join student s on s.studentid = m.studentid
    join subject sub on sub.subid = m.subid
order by m.mark desc;



