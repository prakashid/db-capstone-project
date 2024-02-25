show DATABASES;
use little_lemon_db;

SHOW TABLES;

SELECT * from menuitems;

select * from Bookings;
desc Bookings;

select count(BookingID) from Bookings where BookingSlot between '18:00' and '20:00';

select concat(GuestFirstName,GuestLastName), BookingID from Bookings ORDER BY BookingID ASC;


SELECT * from Menus;

select * from Orders;

select * from Employees;

DROP PROCEDURE GuestStatus;
DELIMITER //

CREATE  PROCEDURE GuestStatus()
BEGIN
	select concat(GuestFirstName," ",GuestLastName) GuestName from Bookings;
    
	select B.EmployeeID,E.Role,
	CASE
		WHEN E.Role="Manager" THEN "Ready to pay"
		WHEN E.Role="Assistant Manager" THEN "Ready to Pay"
		WHEN E.Role="Head Chef" THEN "Ready to Serve"
		WHEN E.Role="Assistant Chef" THEN "Preparing Order"
		WHEN E.Role="Head Waiter" THEN "Order Served"
	End AS OrderStatus
	from Bookings B INNER JOIN Employees E ON B.EmployeeID=E.EmployeeID;
    
	select * from Bookings B LEFT JOIN Employees E on B.EmployeeID=E.EmployeeID;
END;

//


select  Name,Role from Employees where Annual_salary in(select max(Annual_salary) from Employees);

Select sum(BillAmount),Avg(BillAmount),Max(BillAmount),Min(BillAmount) from Orders;

create view OrdersView as select OrderID,BillAmount,Quantity from Orders where Quantity >2;