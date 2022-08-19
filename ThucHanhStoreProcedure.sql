use quanlysinhvientaybalo;

/*Tao store procedure*/
DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers;
END //
DELIMITER ;

/*Goi store procedure*/
call findAllCustomers();

/*Sua procedure bang cach dap di xay lai*/
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers where customerNumber = 175;
END //

/*Truyen tham so IN*/
DELIMITER //
CREATE PROCEDURE getCusById
(IN cusNum INT(11))
BEGIN
    SELECT * FROM customers WHERE customerNumber = cusNum;
END //
DELIMITER ;

CALL getCusById(175);

/*Truyen tham so dang OUT*/
DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity(
    IN  in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END//
DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;

/*Truyen tham so dang INOUT*/
DELIMITER //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;

SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8