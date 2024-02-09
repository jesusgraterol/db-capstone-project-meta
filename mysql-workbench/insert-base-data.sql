-- select the database
USE little_lemon_db;

-- populate the staff table
INSERT INTO staff(name, role, salary)
VALUES
('Mario Gollini', 'Manager', 70000),
('Adrian Gollini', 'Assistant Manager', 65000),
('Giorgos Dioudis', 'Head Chef', 50000),
('Fatma Kaya', 'Assistant Chef', 45000),
('Elena Salvai', 'Head Waiter', 40000),
('John Millar', 'Receptionist', 35000);


-- populate the customers table
INSERT INTO customers (name, phone_number, email)
VALUES
('Vanessa McCarthy', 111111, 'vanessa@gmail.com'),
('Marcos Romero', 222222, 'marcos@gmail.com'),
('Anna Iversen', 333333, 'anna@gmail.com'),
('Joakim Iversen', 444444, 'joakim@gmail.com'),
('Diana Pinto', 555555, 'diana@gmail.com'),
('Hiroki Yamane', 666666, 'hiroki@gmail.com');


-- populate the bookings table
INSERT INTO bookings (date, table_number, customer_id)
VALUES
('2023-01-15', 6, 1),
('2023-01-15', 8, 2),
('2023-01-15', 2, 3),
('2023-01-17', 8, 4),
('2023-01-19', 11, 5),
('2023-01-22', 1, 6);


-- populate the menu items table
INSERT INTO menu_items (name, type, price)
VALUES
('Olives','Starters',5),
('Flatbread','Starters', 5),
('Minestrone', 'Starters', 8),
('Tomato bread','Starters', 8),
('Falafel', 'Starters', 7),
('Hummus', 'Starters', 5),
('Kabasa', 'Main Courses', 17),
('Greek salad', 'Main Courses', 15),
('Bean soup', 'Main Courses', 12),
('Pizza', 'Main Courses', 15),
('Greek yoghurt','Desserts', 7),
('Ice cream', 'Desserts', 6),
('Cheesecake', 'Desserts', 4),
('Athens White wine', 'Drinks', 25),
('Corfu Red Wine', 'Drinks', 30),
('Turkish Coffee', 'Drinks', 10);


-- populate the menus table
INSERT INTO menus (item_id, cuisine)
VALUES
(1, 'Greek'),
(7, 'Greek'),
(10, 'Greek'),
(13, 'Greek'),
(3, 'Italian'),
(9, 'Italian'),
(12, 'Italian'),
(15, 'Italian'),
(5, 'Turkish'),
(14, 'Turkish'),
(11, 'Turkish'),
(16, 'Turkish');


-- populate the orders table
INSERT INTO orders (date, quantity, total_cost, menu_id, customer_id)
VALUES
('2023-01-15', 8, 250, 7, 6),
('2023-01-15', 6, 220, 5, 1),
('2023-01-15', 5, 180, 3, 3),
('2023-01-17', 4, 150, 8, 5),
('2023-01-19', 3, 120, 4, 4),
('2023-01-22', 2, 80, 6, 2);


-- populate the deliveries table
INSERT INTO deliveries (order_id, date, status, staff_id)
VALUES
(1, '2023-01-15', 'SERVED', 5),
(2, '2023-01-15', 'SERVED', 5),
(3, '2023-01-15', 'SERVED', 5),
(4, '2023-01-17', 'SERVED', 5),
(5, '2023-01-19', 'SERVED', 5),
(6, '2023-01-22', 'PREPARING', 3);