/* Task 1
In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on 
OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater 
than 2. 

Here’s some guidance around completing this task: 

Use a CREATE VIEW statement.

Extract the order id, quantity and cost data from the Orders table.

Filter data from the orders table based on orders with a quantity greater than 2. 
*/
USE little_lemon_db;
CREATE OR REPLACE VIEW OrdersView AS (
  SELECT id, quantity, total_cost
  FROM orders
  WHERE quantity > 2
);


/* Task 2
For your second task, Little Lemon need information from four tables on all customers with orders 
that cost more than $150. Extract the required information from each of the following tables by 
using the relevant JOIN clause: 

Customers table: The customer id and full name.

Orders table: The order id and cost.

Menus table: The menus name.

MenusItems table: course name and starter name.

The result set should be sorted by the lowest cost amount.
*/
USE little_lemon_db;
SELECT customers.id, customers.name, orders.id, orders.total_cost, menus.cuisine, menu_items.name
FROM orders 
INNER JOIN customers
  ON orders.customer_id = customers.id
INNER JOIN menus
  ON orders.menu_id = menus.id
INNER JOIN menu_items
  ON menus.item_id = menu_items.id
WHERE orders.total_cost > 150
ORDER BY orders.total_cost;



/* Task 3
For the third and final task, Little Lemon need you to find all menu items for which more than 2 
orders have been placed. You can carry out this task by creating a subquery that lists the menu 
names from the menus table for any order quantity with more than 2.

Here’s some guidance around completing this task: 

Use the ANY operator in a subquery

The outer query should be used to select the menu name from the menus table.

The inner query should check if any item quantity in the order table is more than 2. 
*/
USE little_lemon_db;
SELECT cuisine FROM menus 
WHERE id = ANY (SELECT menu_id FROM orders where quantity > 2);