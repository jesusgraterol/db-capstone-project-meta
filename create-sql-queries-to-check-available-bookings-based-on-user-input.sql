/* Task 1
Little Lemon wants to populate the Bookings table of their database with some records of data. 
Your first task is to replicate the list of records in the following table by adding them to the 
Little Lemon booking table. 
*/
USE little_lemon_db;
INSERT INTO bookings(date, table_number, customer_id)
VALUES
('2022-10-10', 5, 1),
('2022-11-12', 3, 3),
('2022-10-11', 2, 2),
('2022-10-13', 2, 1);


/* Task 2
For your second task, Little Lemon need you to create a stored procedure called CheckBooking to 
check whether a table in the restaurant is already booked. Creating this procedure helps to 
minimize the effort involved in repeatedly coding the same SQL statements.

The procedure should have two input parameters in the form of booking date and table number. 
You can also create a variable in the procedure to check the status of each table.
*/
USE little_lemon_db;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS CheckBooking(booking_date DATE, table_num INT)
BEGIN
DECLARE booked_table INT DEFAULT 0;
 SELECT COUNT(booked_table) INTO booked_table
    FROM bookings WHERE date = booking_date AND table_number = table_num;
    IF booked_table > 0 THEN
      SELECT CONCAT( "Table ", table_num, " is already booked.") AS "Booking status";
      ELSE 
      SELECT CONCAT( "Table ", table_num, " is not booked.") AS "Booking status";
    END IF;
END//
DELIMITER ;

CALL CheckBooking("2023-01-15", 6);



/* Task 3
For your third and final task, Little Lemon need to verify a booking, and decline any reservations 
for tables that are already booked under another name. 

Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes 
these verification and decline steps. However, implementing these steps requires a stored procedure 
and a transaction. 

To implement these steps, you need to create a new procedure called AddValidBooking. This procedure 
must use a transaction statement to perform a rollback if a customer reserves a table that’s 
already booked under another name.  

Use the following guidelines to complete this task:

The procedure should include two input parameters in the form of booking date and table number.

It also requires at least one variable and should begin with a START TRANSACTION statement.

Your INSERT statement must add a new booking record using the input parameter's values.

Use an IF ELSE statement to check if a table is already booked on the given date. 

If the table is already booked, then rollback the transaction. If the table is available, then 
commit the transaction. 
*/
USE little_lemon_db;
DELIMITER //

CREATE FUNCTION IF NOT EXISTS ValidateAddBooking(records_found INTEGER, message VARCHAR(255)) RETURNS INTEGER DETERMINISTIC
BEGIN
    IF records_found IS NOT NULL OR records_found > 0 THEN
        SIGNAL SQLSTATE 'ERR0R' SET MESSAGE_TEXT = message;
    END IF;
    RETURN records_found;
END//

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_num INT, IN cust_id INT)
	BEGIN
		DECLARE `_rollback` BOOL DEFAULT 0;
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
		START TRANSACTION;
        
        SELECT ValidateAddBooking(COUNT(*), CONCAT("Table ", table_num, " is already booked"))
        FROM bookings
        WHERE date = booking_date AND table_number = table_num;
        
		INSERT INTO bookings (date, table_number, customer_id)
		VALUES (booking_date, table_num, cust_id);
		
		IF `_rollback` THEN
			SELECT CONCAT("Table ", table_num, " is already booked - booking cancelled") AS "Booking status";
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END//
    
DELIMITER ;

CALL AddValidBooking("2023-12-17", 6, 1);