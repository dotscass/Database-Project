--Part 3 of Database Project
--Queries

--1. List all the information in the Customer table
SELECT * from customers

--2. List the name and price of all parts in the parts table
SELECT PART_NAME, PRICE FROM PARTS

--3. List make, model and year of all cars newer than 2000
SELECT car_Make_Name, Car_model, Year_of_Manufacture FROM `cars` WHERE Year_of_Manufacture >2000

--4. Get the customer_name, surname and amount_due for all customers.	
SELECT Name, Surname, orders.Amount_due from customers, orders where customers.Customer_id=orders.Customers_Customer_id

--5. Insert into Customers the following data
--7 Fred Ahern Fred's Garage
INSERT into customers (Customer_id, Name, Surname, Organisation) VALUES (7, 'Fred', 'Ahern', 'Fred''s Garage');

--6. Insert into orders the following data
--106 7 300.00
INSERT into orders (Order_id, Customers_Customer_id, Amount_due) values (106, 7, 300.00);

--7. Insert into Parts_in_orders the following data:
--6 300.00 1 106 206
insert into parts_in_order (Parts_in_Order_id, price, Quantity, Orders_Order_id, Parts_Part_id) values (6, 300.00, 1, 106, 205)

--8. Insert into the customers table a new customer named Bob Marley and his organisation name is 'The Mechanic'.
INSERT into customers (Customer_id, Name, Surname, Organisation) VALUES (8, 'Bob', 'Marley', 'The Mechanic');

--8.Update the parts table to add 10 euro to all exhaust parts
UPDATE parts set price= (price + 10.00) where part_name = Exhaust

--9. Update name to michael and organisation to gallaghers where the id is equal to 5
update customers set name='Michael', Organisation='Gallaghers' where Customer_id =5

--10. Create a view called ordersParts which show the prices which are greater than the average price in parts_in_order-->

CREATE VIEW orderParts as SELECT(Price) FROM parts_in_order where Price > (SELECT AVG(Price) from parts_in_order);

--11. Delete the orderparts view
DROP VIEW orderparts;

--12.Delete a customer row from the customers table:
DELETE FROM Customers
WHERE Name='Bob' ANd surname='Marley';



