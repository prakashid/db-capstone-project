select * from Orders;

INSERT INTO Bookings (BookingID, TableNo, GuestFirstName, 
GuestLastName, BookingSlot, EmployeeID)
VALUES
(7, 10, 'Anna','Jacob','18:00:00',1),
(8, 11, 'Joel', 'Iversen', '17:00:00', 1),
(9, 9, 'Vanessa', 'Murthy', '15:00:00', 3),
(10, 16, 'Marcos', 'Romario', '20:30:00', 4),
(11, 25, 'Hiroki', 'Yamamoto', '17:30:00', 2),
(12, 6, 'Diana', 'Prince', '20:30:00', 5);

select * from Bookings;
desc Orders;
INSERT INTO Orders (OrderID, TableNo, MenuID, BookingID,BillAmount,Quantity)
VALUES
(6, 10, 1, 1, 86,2),
(7, 11, 2, 2, 47,3),
(8, 9, 2, 3, 77,4),
(9, 16, 3, 4, 20,3),
(10, 25, 1, 5, 63,5),
(11, 6, 1, 5, 85,4);

select * from Orders;
DROP PROCEDURE CheckBooking;

DELIMITER //;

CREATE PROCEDURE CheckBooking(IN bookingtime TIME, OUT printtext VARCHAR(255))
	BEGIN
		DECLARE slotcount INT;
		SELECT count(BookingID) INTO slotcount from Bookings where BookingSlot=bookingtime;
        IF slotcount>0 THEN
			SET printtext="The bookingslot is not available";
        ELSE
			SET printtext="The bookingslot is not available";
        END IF;
    END //;
    
call CheckBooking(time('20:30:00'),@printtext);

select @printtext;


DROP PROCEDURE AvalBooking;
ELIMITER //;

CREATE PROCEDURE AvalBooking(IN bookingtime TIME, OUT printtext VARCHAR(255))
	BEGIN
		DECLARE slotcount INT;
		SELECT count(BookingID) INTO slotcount from Bookings where BookingSlot=bookingtime;
        IF slotcount>0 THEN
			SET printtext="The bookingslot is not available";
        ELSE
			INSERT INTO Bookings (BookingID, TableNo, GuestFirstName, GuestLastName, BookingSlot, EmployeeID) 
			VALUES (15, 10, 'Anna','Jacob',bookingtime,1);
            SET printtext="The bookingslot is confirmed";
        END IF;
    END //;
    
    call AvalBooking(time('21:30:00'),@printtext);
    
    select @printtext;