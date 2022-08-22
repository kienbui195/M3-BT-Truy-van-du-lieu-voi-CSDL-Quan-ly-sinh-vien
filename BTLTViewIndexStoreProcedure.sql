create database btview_index_store_procedure;

use btview_index_store_procedure;

create table products (
    id int(3) primary key auto_increment,
    code int(3),
    name varchar(25),
    price int(20),
    amount int(10),
    description varchar(25),
    status bit default 1
);

 insert into products (code, name, price, amount, description, status) values
                                                                           (123,'nokia',2000,5,'nothing',1),
                                                                           (234,'samsung',20000,1,'nothing',1),
                                                                           (345,'xiaomi',12000,5,'nothing',0),
                                                                           (123,'iphone',25000,2,'nothing',1),
                                                                           (123,'realme',21000,2,'nothing',0);

/*Tao index unique*/
alter table products add index idx_products(code);
/*Tao index composite*/
alter table products add index idx_compisite(name, price);
/*Kiem tra hoat dong cua index*/
explain select * from products where name = 'samsung';

/*Tao view*/
create view product_view as
    select code, name, price, status from products;
/*Su dung view*/
select * from products;
/*Sua doi view*/
create or replace view product_view as
    select id ,code, name, price, status from products
where name = 'iphone';
/*Xoa view*/
drop view product_view;

/*Tao store procedure hien thi tat ca cac sp*/
DELIMITER //
create procedure findAllProduct()
begin
    select * from products;
end //
DELIMITER ;
/*Tao procedure them mot san pham moi*/
DELIMITER //
create procedure addNewProduct( in code int(3), in name varchar(25), in price int(3), in amount int(3), in description varchar(25), in status bit)
begin
    insert into products (code, name, price, amount, description, status) values
                                                                              (code , name, price, amount, description, status);
end //
DELIMITER ;
/*Sua thong tin sp theo id*/
DELIMITER //
create procedure editProductInfo(in id int(3), in name varchar(25), in price int(3), in amount int(3), in description varchar(25), in status bit)
begin
    update products
        set name = name, price = price, amount = amount, description = description, status = status
            where id = id;
end //
DELIMITER ;
/*Xoa theo id*/
DELIMITER //
create procedure deleteProduct(in id int(3))
begin
    delete from products where id = id;
end //
DELIMITER ;

call deleteProduct(6);
