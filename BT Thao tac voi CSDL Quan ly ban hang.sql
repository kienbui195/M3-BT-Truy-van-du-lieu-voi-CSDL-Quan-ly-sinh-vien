create database QuanLyBanHang2;

use QuanLyBanHang2;

create table customer (
    cid int(3) primary key auto_increment,
    name varchar(25) not null ,
    cage tinyint
);

create table orders (
    oid int(3) primary key auto_increment,
    cid int(3) not null ,
    odate date not null ,
    ototalprice int(10),
    foreign key (cid) references customer(cid)
);

create table product (
    pid int(3) primary key auto_increment,
    pname varchar(25),
    pprice int
);

create table orderdetail (
    oid int(3),
    pid int(3),
    odqty int(3),
    foreign key (oid) references orders(oid),
    foreign key (pid) references product(pid)
);

insert into customer (name, cage)
values ('Minh Quan', 10), ('Ngoc Oanh', 20), ('Hong Ha', 50);

insert into orders (cid, odate) values
                                    (1,'2006-3-21'),
                                    (2,'2006-3-23'),
                                    (1,'2006-3-16');

insert into product (pname, pprice) values
                                        ('May giat', 3),
                                        ('Tu Lanh', 5),
                                        ('Quat', 7),
                                        ('Dieu hoa', 1),
                                        ('bep dien', 2);

insert into orderdetail (oid, pid, odqty) VALUES
                                              (1,1,3),
                                              (1,3,7),
                                              (1,4,2),
                                              (2,1,1),
                                              (3,1,8),
                                              (2,5,4),
                                              (2,3,3);


select oid, odate, ototalprice from orders;

select c.name, c.cage, p.pname
from customer c
    join orders o on c.cid = o.cid
    join orderdetail o2 on o.oid = o2.oid
    join product p on o2.pid = p.pid;

select c.name, c.cage
from customer c
    left join orders o on c.cid = o.cid
where o.cid IS NULL;

select o.oid, o.odate, o2.odqty*p.pprice as Price
from orders o
join orderdetail o2 on o.oid = o2.oid
join product p on o2.pid = p.pid;





