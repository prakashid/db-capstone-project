select * from Bookings ORDER BY BookingID DESC ;
desc Bookings;
DROP PROCEDURE AddBooking;

DELIMITER //;

CREATE PROCEDURE AddBooking(IN bookingid INT,IN tableno INT, IN gfn VARCHAR(50), IN gln VARCHAR(50), IN bookingtime TIME,IN empid INT)
	BEGIN
		INSERT INTO Bookings (BookingID, TableNo, GuestFirstName, GuestLastName, BookingSlot, EmployeeID) 
		VALUES (bookingid,tableno,gfn,gln,bookingtime,empid);
    END //;
    
call AddBooking (14,10,'Jacob','Miller',time('18:30:00'),5);

DELIMITER //;

CREATE PROCEDURE UpdateBooking(IN bookingid INT,IN tableno INT)
	BEGIN
		UPDATE Bookings set TableNo=tableno where BookingID=bookingid;
    END //;

call UpdateBooking(10,10);

DELETE FROM Bookings where BookingID=10;

DELIMITER //;

CREATE PROCEDURE deleteBooking(IN bookingid INT)
	BEGIN
		DELETE FROM Bookings where BookingID=bookingid;
    END //;

call deleteBooking('10');
