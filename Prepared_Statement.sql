PREPARE GetOrderStatement from 'select BookingID, Quantity, BillAmount from Orders where OrderID=?';
SET @Order_id=4;
Execute GetOrderStatement USING @Order_id;

PREPARE GetOrderDetails from 'Select OrderID, TableNo, MenuID, BookingID, Quantity, BillAmount from Orders where OrderID=?';
SET @ID=3;
Execute GetOrderDetails USING @ID;

PREPARE GetMaxOrder from 'Select Max(Quantity) from Orders';
EXECUTE GetMaxOrder;

PREPARE DeletOrder from 'Delete from Orders where OrderID=?';
SET @I_D =3;
EXECUTE DeletOrder USING @I_D;