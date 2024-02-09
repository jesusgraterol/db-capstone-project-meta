/* Task 1
In this first task you need to create a new procedure called AddBooking to add a new table booking 
record.

The procedure should include four input parameters in the form of the following bookings 
parameters:

booking id, 

customer id, 

booking date,

and table number.
*/
USE little_lemon_db;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS AddBooking (IN booking_date DATE, IN table_num INT, IN cust_id INT)
BEGIN
  INSERT INTO bookings (date, table_number, customer_id)
  VALUES (booking_date, table_num, cust_id);
  SELECT CONCAT("New booking added.") AS Confirmation;
END//
DELIMITER ;

CALL AddBooking("2023-08-30", 4, 3);



/* Task 2
For your second task, Little Lemon need you to create a new procedure called UpdateBooking that 
they can use to update existing bookings in the booking table.

The procedure should have two input parameters in the form of booking id and booking date. You 
must also include an UPDATE statement inside the procedure. 
*/
USE little_lemon_db;
CREATE PROCEDURE IF NOT EXISTS UpdateBooking(IN update_id INT, IN table_num INT)
UPDATE bookings
SET table_number = table_num
WHERE id = update_id;

CALL UpdateBooking(8, 10);



/* Task 3
For the third and final task, Little Lemon need you to create a new procedure called CancelBooking 
that they can use to cancel or remove a booking.

The procedure should have one input parameter in the form of booking id. You must also write a 
DELETE statement inside the procedure. 
*/
USE little_lemon_db;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS CancelBooking(IN cancel_id INT)
BEGIN
  DELETE FROM bookings WHERE id = cancel_id;
  SELECT CONCAT("Order ", cancel_id , " is cancelled.") AS Confirmation FROM bookings;
END//
DELIMITER ;

CALL CancelBooking(8);