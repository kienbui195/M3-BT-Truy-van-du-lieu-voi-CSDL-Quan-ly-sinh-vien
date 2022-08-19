use quanlysinhvien;

/*So luong sinh vien theo tung noi*/
select address, count(studentname) as SoSV
from student
group by address;

/*Tinh diem trung binh cac mon hoc cua cac SV*/
select s.studentid ,s.studentname,avg(m.mark) as DemTB
from mark m
join student s on m.studentid = s.studentid
group by s.studentid, s.studentname;

/*Hien thi hoc vien co diem TB > 15*/
select s.studentid ,s.studentname,avg(m.mark) as DemTB
from mark m
join student s on m.studentid = s.studentid
group by s.studentid, s.studentname
having avg(m.mark > 15);

/*Hien thi thong tin cac hoc vien co diem trung binh lon nhat*/
select s.studentid ,s.studentname,avg(m.mark) as DemTB
from mark m
join student s on m.studentid = s.studentid
group by s.studentid, s.studentname
having AVG(m.mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY studentid);




