use quanlysinhvientaybalo;

/*Tao View*/
CREATE VIEW customer_views AS
    SELECT customerNumber, customerName, phone
FROM customers;

SELECT * FROM customer_views;

/*Cap nhat view*/
CREATE OR REPLACE VIEW customer_views AS
    SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

/*Xoa view*/
DROP VIEW customer_views;