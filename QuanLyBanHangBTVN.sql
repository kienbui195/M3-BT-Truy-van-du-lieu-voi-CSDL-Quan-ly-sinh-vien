create database QuanLyBanHang4;
use QuanLyBanHang4;

create table customer (
    cid int(3) primary key auto_increment,
    cname varchar(25),
    cage tinyint
);

create table orders (
    oid int(3) primary key auto_increment,
    cid int(3),
    odate date,
    ototalprice int(3),
    foreign key (cid) references customer(cid)
);

create table product (
    pid int(3) primary key auto_increment,
    pname varchar(25),
    pprice tinyint
);

create table orderdetail (
    oid int(3),
    pid int(3),
    odqty int(3),
    foreign key (oid) references orders(oid),
    foreign key (pid) references product(pid)
);

insert into customer (cname, cage) values
                                       ('Minh Quan', 10),
                                       ('Ngoc Oanh', 20),
                                       ('Hong Ha', 50);

insert into orders (cid, odate) values
                                                 (1, '2006-3-21'),
                                                 (2, '2006-3-23'),
                                                 (1, '2006-3-16');

insert into product (pname, pprice) values
                                        ('may giat' ,3),
                                        ('tu lanh' ,5),
                                        ('dieu hoa' ,7),
                                        ('quat' ,1),
                                        ('bep dien' ,2);

insert into orderdetail (oid, pid, odqty) VALUES
                                              (1,1,3),
                                              (1,3,7),
                                              (1,4,2),
                                              (2,1,1),
                                              (3,1,8),
                                              (2,5,4),
                                              (2,3,3);

/*Sap xep cac don theo ngay thang, moi hon dung truoc*/
select *
from orders
order by odate desc;

/*Hien thi ma gia san pham cao nhat*/
select pname, pprice
from product
where pprice = (select max(pprice) from product);

/*Hien thi danh sach KH da mua hang va danh sach sp duoc mua boi KH do*/
select c.cname, p.pname
from orders o
join customer c on o.cid = c.cid
join orderdetail o2 on o.oid = o2.oid
join product p on o2.pid = p.pid;

/*Hien thi KH khong mua bat ki sp nao*/
select c.cname
from customer c
left join orders o on c.cid = o.cid
where o.cid is null;

/*Hien thi chi tiet tung hoa don*/
select o.oid, o.odate, o2.odqty, p.pname, p.pprice
from orderdetail o2
join orders o on o2.oid = o.oid
join product p on o2.pid = p.pid;

/*Gia ban tung don hang*/
select o.oid, o.odate, o2.odqty*p.pprice as Total
from orderdetail o2
join orders o on o2.oid = o.oid
join product p on o2.pid = p.pid;

select o.oid, o.odate,  sum(o2.odqty*p.pprice) as Total
from orderdetail o2
join orders o on o2.oid = o.oid
join product p on o2.pid = p.pid
group by o.oid;







