use demo2;

/*Lay KH co tong tien mua hang lon nhat*/
select c.customerNumber, c.customerName, sum(o2.quantityOrdered*o2.priceEach) as Totalmoney
from customers c
join orders o on c.customerNumber = o.customerNumber
join orderdetails o2 on o.orderNumber = o2.orderNumber
group by c.customerNumber
order by Totalmoney desc limit 1;

/**/

