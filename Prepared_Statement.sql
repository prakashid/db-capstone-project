PREPARE GetOrderStatement from 'select BookingID, Quantity, BillAmount from Orders where OrderID=?';
SET @Order_id=4;
Execute GetOrderStatement USING @Order_id;