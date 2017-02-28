--Create a new table cars, set the value types for the table, make some columns not null

CREATE TABLE `cars` (
  `Car_id` int(11) NOT NULL,
  `Car_Make_Name` varchar(45) NOT NULL,
  `Car_model` varchar(45) NOT NULL,
  `Year_of_Manufacture` year(4) NOT NULL,
  `Car_Make_Car_Make_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--Create a new table cars_has_parts set the value types make some columns not null
CREATE TABLE `cars_has_parts` (
  `Cars_Car_id` int(11) NOT NULL,
  `Parts_Part_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--create a new table car_make, set the value types, make some columns not null

CREATE TABLE `car_make` (
  `Car_Make_id` int(11) NOT NULL,
  `Car_Make_Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--create a new table customers, set the value types, make some columns not null

CREATE TABLE `customers` (
  `Customer_id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Organisation` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--create a new table orders, set the value types, make some columns not null

CREATE TABLE `orders` (
  `Order_id` int(11) NOT NULL,
  `Amount_due` decimal(4,0) DEFAULT NULL,
  `Customers_Customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1

--create a new table parts, set the value types, make some columns not null
CREATE TABLE `parts` (
  `Part_id` int(11) NOT NULL,
  `Part_Name` varchar(45) NOT NULL,
  `Price` decimal(3,0) DEFAULT NULL,
  `Brand` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--create a new table parts_in_order, set the value types, make some columns not null

CREATE TABLE `parts_in_order` (
  `Parts_in_Order_id` int(11) NOT NULL,
  `Price` decimal(4,0) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Orders_Order_id` int(11) NOT NULL,
  `Parts_Part_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--Test data for the database

--Add data into the cars table, state the column table names and the data values you want to enter for each column

INSERT INTO `cars` (`Car_id`, `Car_Make_Name`, `Car_model`, `Year_of_Manufacture`, `Car_Make_Car_Make_id`) VALUES
(1, 'Toyota', 'Corolla', 2000, 1),
(2, 'Volkswagen', 'Passat', 2009, 2),
(3, 'Nissan', 'Micra', 2002, 3),
(4, 'Seat', 'Ibiza', 2008, 4),
(5, 'Skoda', 'Octavia', 2003, 5);

--Add data into the cars_has_parts

INSERT INTO `cars_has_parts` (`Cars_Car_id`, `Parts_Part_id`) VALUES
(1, 201),
(2, 202),
(3, 203),
(4, 204),
(5, 205);

--Add data into the car_make table

INSERT INTO `car_make` (`Car_Make_id`, `Car_Make_Name`) VALUES
(1, 'Toyota'),
(2, 'Volkswagen'),
(3, 'Nissan'),
(4, 'Seat'),
(5, 'Skoda');

--Add data to the customers table

INSERT INTO `customers` (`Customer_id`, `Name`, `Surname`, `Organisation`) VALUES
(2, 'Pat', 'Hickey', 'Hickey''s Garage'),
(3, 'Mary', 'Jones', NULL),
(4, 'James', 'Maloney', 'Jim the Mechanic'),
(5, 'Charlie', 'Gallagher', 'Gallagher''s Garage'),
(6, 'John', 'Smith', 'Smith''s');

--Insert data into the orders table
INSERT INTO `orders` (`Order_id`, `Amount_due`, `Customers_Customer_id`) VALUES
(101, '50', 2),
(102, '25', 3),
(103, '100', 4),
(104, '20', 5),
(105, '200', 6);

--Add data to the parts table

INSERT INTO `parts` (`Part_id`, `Part_Name`, `Price`, `Brand`) VALUES
(201, 'Exhaust', '100', 'Gibson'),
(202, 'Gearbox', '50', 'Murphy'),
(203, 'Bushens', '25', 'Murphy'),
(204, 'Timing-belt', '200', 'Murphy'),
(205, 'Steering Wheel', '50', 'NIssan');

--Add data to the parts_in_order

INSERT INTO `parts_in_order` (`Parts_in_Order_id`, `Price`, `Quantity`, `Orders_Order_id`, `Parts_Part_id`) VALUES
(1, '50', 1, 101, 201),
(2, '25', 1, 102, 202),
(3, '100', 1, 103, 203),
(4, '20', 1, 104, 204),
(5, '200', 1, 105, 205);

--add a primary key to cars, use both the car_id and the car_make_id
--make the primary key unique
--add foreign key

ALTER TABLE `cars`
  ADD PRIMARY KEY (`Car_id`,`Car_Make_Car_Make_id`),
  ADD UNIQUE KEY `Car_id_UNIQUE` (`Car_id`),
  ADD KEY `fk_Cars_Car_Make1_idx` (`Car_Make_Car_Make_id`);

--
-- Indexes for table `cars_has_parts`
--
ALTER TABLE `cars_has_parts`
  ADD PRIMARY KEY (`Cars_Car_id`,`Parts_Part_id`),
  ADD KEY `fk_Cars_has_Parts_Parts1_idx` (`Parts_Part_id`),
  ADD KEY `fk_Cars_has_Parts_Cars1_idx` (`Cars_Car_id`);

--
-- Indexes for table `car_make`
--
ALTER TABLE `car_make`
  ADD PRIMARY KEY (`Car_Make_id`),
  ADD UNIQUE KEY `Car_Make_id_UNIQUE` (`Car_Make_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_id`),
  ADD UNIQUE KEY `Customer_id_UNIQUE` (`Customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_id`),
  ADD UNIQUE KEY `Order_id_UNIQUE` (`Order_id`),
  ADD KEY `fk_Orders_Customers_idx` (`Customers_Customer_id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`Part_id`),
  ADD UNIQUE KEY `Part_id_UNIQUE` (`Part_id`);

--
-- Indexes for table `parts_in_order`
--
ALTER TABLE `parts_in_order`
  ADD PRIMARY KEY (`Parts_in_Order_id`),
  ADD UNIQUE KEY `Parts_in_Order_id_UNIQUE` (`Parts_in_Order_id`),
  ADD KEY `fk_Parts_in_order_Orders1_idx` (`Orders_Order_id`),
  ADD KEY `fk_Parts_in_order_Parts1_idx` (`Parts_Part_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `Car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `car_make`
--
ALTER TABLE `car_make`
  MODIFY `Car_Make_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `parts_in_order`
--
ALTER TABLE `parts_in_order`
  MODIFY `Parts_in_Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_Cars_Car_Make1` FOREIGN KEY (`Car_Make_Car_Make_id`) REFERENCES `car_make` (`Car_Make_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cars_has_parts`
--
ALTER TABLE `cars_has_parts`
  ADD CONSTRAINT `fk_Cars_has_Parts_Cars1` FOREIGN KEY (`Cars_Car_id`) REFERENCES `cars` (`Car_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cars_has_Parts_Parts1` FOREIGN KEY (`Parts_Part_id`) REFERENCES `parts` (`Part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_Orders_Customers` FOREIGN KEY (`Customers_Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parts_in_order`
--
ALTER TABLE `parts_in_order`
  ADD CONSTRAINT `fk_Parts_in_order_Orders1` FOREIGN KEY (`Orders_Order_id`) REFERENCES `orders` (`Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Parts_in_order_Parts1` FOREIGN KEY (`Parts_Part_id`) REFERENCES `parts` (`Part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;








