show DATABASES;
use little_lemon_db;
show TABLES;
select * from ordersview;
desc ordersview;
select * from Orders;
desc customers;

select concat(B.GuestFirstName," ",B.GuestLastName) CustomerName,O.OrderID,O.BillAmount,MI.Name, M.Cuisine,M.ItemID from 
Menus M LEFT JOIN  MenuItems MI ON  M.ItemID=MI.ItemID
LEFT JOIN Orders O  ON O.MenuID=M.MenuID
LEFT JOIN Bookings B ON O.BookingID=B.BookingID;

select MI.Name,MI.Type from MenuItems MI 
where MI.ItemID =ANY(select M.ItemID from Menus M where M.MenuID =ANY(Select O.MenuID from Orders O where O.Quantity>=2));


