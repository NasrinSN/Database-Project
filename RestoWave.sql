-- create the database "Restowave"
CREATE DATABASE Restowave;
-- ===============Data manipulation: (see phase2Q.sql)
--				  	SQL schema (CREATE TABLES)
--				  		- Including primary keys, unique, not null, default…
--				    Insert statements to input data in each tables.
--				    Queries
--				        - Questions: give the questions.
--				        - Solutions: use what we have learned in class. See phase2q.sql file for examples)
--				    You should provide at least the number of different types of questions/queries as the attached file, phase2Q.sql.
--                  Submit your phase II in a text file plus one in a pdf file.  


-- Use the "RestoWave" database
USE Restowave;

-- Create the "Restaurant" table
CREATE TABLE Restaurant (
    Name VARCHAR(255) PRIMARY KEY,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);

-- Create the "OperatingHours" table
CREATE TABLE OperatingHours (
    HoursID INT PRIMARY KEY,
    RestaurantName VARCHAR(255),
    DayOfWeek VARCHAR(15),
    OpenTime TIME,
    CloseTime TIME,
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name)
);

-- Create the "Manager" table
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Contact VARCHAR(20)
);

-- Create the "Dish" table
CREATE TABLE Dish (
    DishID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Calorie INT
);

-- Create the "Customer" table without BuddyID
CREATE TABLE Customer (
    Name VARCHAR(255) PRIMARY KEY,
    Contact VARCHAR(20),
    FavoriteDishID INT,
    FOREIGN KEY (FavoriteDishID) REFERENCES Dish(DishID)
);

-- Create the "ManagerRunsRestaurant" relationship table
CREATE TABLE ManagerRunsRestaurant (
    RestaurantName VARCHAR(255),
    ManagerID INT,
    PRIMARY KEY (RestaurantName, ManagerID),
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);

-- Create the "RestaurantServesDish" relationship table
CREATE TABLE RestaurantServesDish (
    RestaurantName VARCHAR(255),
    DishID INT,
    Price DECIMAL(10, 2),
    PRIMARY KEY (RestaurantName, DishID),
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name),
    FOREIGN KEY (DishID) REFERENCES Dish(DishID)
);

-- Create the "CustomerFrequentVisits" relationship table
CREATE TABLE CustomerFrequentVisits (
    CustomerName VARCHAR(255),
    RestaurantName VARCHAR(255),
    DishID INT,
    PRIMARY KEY (CustomerName, RestaurantName, DishID),
    FOREIGN KEY (CustomerName) REFERENCES Customer(Name),
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name),
    FOREIGN KEY (DishID) REFERENCES Dish(DishID)
);

-- Create the "CustomerLikesDish" relationship table
CREATE TABLE CustomerLikesDish (
    CustomerName VARCHAR(255),
    DishID INT,
    PRIMARY KEY (CustomerName, DishID),
    FOREIGN KEY (CustomerName) REFERENCES Customer(Name),
    FOREIGN KEY (DishID) REFERENCES Dish(DishID)
);

-- Create the "CustomerFavouritesDish" relationship table
CREATE TABLE CustomerFavouritesDish (
    CustomerName VARCHAR(255),
    DishID INT,
    PRIMARY KEY (CustomerName, DishID),
    FOREIGN KEY (CustomerName) REFERENCES Customer(Name),
    FOREIGN KEY (DishID) REFERENCES Dish(DishID)
);

-- Create the "MarriedCouples" relationship table
CREATE TABLE MarriedCouples (
    Customer1Name VARCHAR(255),
    Customer2Name VARCHAR(255),
    PRIMARY KEY (Customer1Name, Customer2Name),
    FOREIGN KEY (Customer1Name) REFERENCES Customer(Name),
    FOREIGN KEY (Customer2Name) REFERENCES Customer(Name)
);

-- Create the "Buddies" table
CREATE TABLE Buddies (
    Buddy1Name VARCHAR(255),
    Buddy2Name VARCHAR(255),
    PRIMARY KEY (Buddy1Name, Buddy2Name),
    FOREIGN KEY (Buddy1Name) REFERENCES Customer(Name),
    FOREIGN KEY (Buddy2Name) REFERENCES Customer(Name)
);

-- Insert data into the "Restaurant" table
INSERT INTO Restaurant (Name, Address, Phone, ManagerID)
VALUES
    ('Fazoli''s', '123 Main St', '555-1234', 1),
    ('Texas RoadHouse', '456 Elm St', '555-5678', 2),
    ('Olive Garden', '789 Oak St', '555-3333', 3),
    ('Papa Jhon''s', '321 Oak Ave', '555-5555', 4);
-- Insert data into the "Manager" table
INSERT INTO Manager (ManagerID, Name, Contact)
VALUES
    (1, 'John Smith', 'john@gmail.com'),
    (2, 'Alice Johnson', 'alice@gmail.com'),
    (3, 'Michael Johnson', 'michael@yahoo.com'),
    (4, 'Sarah Davis', 'sarah@twitter.com');

-- Insert data into the "Dish" table
INSERT INTO Dish (DishID, Name, Description, Calorie)
VALUES
    (1, 'Spaghetti Carbonara', 'Creamy pasta with bacon', 800),
    (2, 'Grilled Salmon', 'Served with lemon butter sauce', 600),
    (3, 'Caesar Salad', 'Fresh salad with dressing', 350),
    (4, 'Margherita Pizza', 'Classic pizza with tomato and cheese', 900);

-- Insert data into the "Customer" table
INSERT INTO Customer (Name, Contact, FavoriteDishID)
VALUES
    ('Nasrin', 'nasrin@gmail.com', 1),
    ('Nipa', 'nipa@yahoo.com', 2),
    ('Kazol', 'kazol@gmail.com', 3),
    ('Salauddin', 'salauddin@gmail.com', 4),
    ('Sumaiya', 'sum@yahoo.com', 1),
    ('Shaheen', 'shaheen@gmail.com', 3);

-- Insert data into the "ManagerRunsRestaurant" relationship table
INSERT INTO ManagerRunsRestaurant (RestaurantName, ManagerID)
VALUES
    ('Fazoli''s', 1),
    ('Texas RoadHouse', 2),
    ('Olive Garden', 3),
    ('Papa Jhon''s', 4);

-- Insert data into the "RestaurantServesDish" relationship table
INSERT INTO RestaurantServesDish (RestaurantName, DishID, Price)
VALUES
    ('Fazoli''s', 1, 12.99),
    ('Texas RoadHouse', 2, 15.99),
    ('Olive Garden', 3, 8.99),
    ('Papa Jhon''s', 4, 14.99);

-- Insert data into the "CustomerLikesDish" relationship table
INSERT INTO CustomerLikesDish (CustomerName, DishID)
VALUES
    ('Nasrin', 1),
    ('Nipa', 2),
    ('Kazol', 3),
    ('Salauddin', 4);

-- Insert data into the "CustomerFavouritesDish" relationship table
INSERT INTO CustomerFavouritesDish (CustomerName, DishID)
VALUES
    ('Nasrin', 1),
    ('Kazol', 3);

-- Insert data into the "CustomerFrequentVisits" table
INSERT INTO CustomerFrequentVisits (CustomerName, RestaurantName, DishID)
VALUES
    ('Nasrin', 'Fazoli''s', 1),
    ('Nasrin', 'Papa Jhon''s', 4),
    ('Nipa', 'Texas RoadHouse', 2),
    ('Kazol', 'Olive Garden', 3),
    ('Salauddin', 'Papa Jhon''s', 4),
    ('Sumaiya', 'Fazoli''s', 1),
    ('Shaheen', 'Olive Garden', 3);


-- Insert data into the "MarriedCouples" relationship table
INSERT INTO MarriedCouples (Customer1Name, Customer2Name)
VALUES
    ('Nasrin', 'Salauddin'),
    ('Nipa', 'Kazol');
    
-- Insert data into the "Buddies" table
INSERT INTO Buddies (Buddy1Name, Buddy2Name)
VALUES
    ('Nasrin', 'Sumaiya'),
    ('Kazol', 'Shaheen');


SELECT * FROM Restaurant;
SELECT * FROM OperatingHours;
SELECT * FROM Manager;
SELECT * FROM Dish;
SELECT * FROM Customer;
SELECT * FROM ManagerRunsRestaurant;
SELECT * FROM RestaurantServesDish;
SELECT * FROM CustomerFrequentVisits;
SELECT * FROM CustomerLikesDish;
SELECT * FROM CustomerFavouritesDish;
SELECT * FROM MarriedCouples;
SELECT * FROM Buddies;

-- ============ Queris 
 
-- 1. ============ 8 simple queries (similar to the examples below)
--              operators includes (and,or,not) 
--              patterns

 -- SELECT ... FROM ... WHERE
-- a. Find all the dishes' names:
SELECT * Name
FROM Dish;

-- b. Find the restaurant manager who runs 'Restaurant A':
SELECT Name
FROM Manager
WHERE ManagerID = (
    SELECT ManagerID
    FROM ManagerRunsRestaurant
    WHERE RestaurantName = 'Fazoli''s'
);

-- c. Find all the dishes served by 'Olive Garden':
-- c. Find all the dishes served by 'Olive Garden' without using JOIN:
SELECT Dish.Name
FROM Dish, RestaurantServesDish
WHERE Dish.DishID = RestaurantServesDish.DishID
AND RestaurantServesDish.RestaurantName = 'Olive Garden';


-- d. Find the price 'Fazoli''s' charges for 'Spaghetti Carbonara':
SELECT Price
FROM RestaurantServesDish
WHERE RestaurantName = 'Fazoli''s' AND DishID = 1;

-- e. Find the restaurants whose names end with 's':
SELECT Name
FROM Restaurant
WHERE Name LIKE '%s';

-- f. Find the customers who like 'Grilled Salmon' using a subquery:
SELECT Name
FROM Customer
WHERE Name IN (
    SELECT CustomerName
    FROM CustomerLikesDish
    WHERE DishID = (
        SELECT DishID
        FROM Dish
        WHERE Name = 'Grilled Salmon'
    )
); 

-- g. Find the managers who run multiple restaurants:
SELECT Manager.Name
FROM Manager
-- Group the results by manager name
GROUP BY Manager.Name
-- Filter the results to include only managers who run multiple restaurants
HAVING COUNT(*) > 1;


-- h. Find the dishes with calorie counts less than 500:
SELECT Name
FROM Dish
WHERE Calorie < 500;


-- 2. ============= 6 or more Multirelation queries 
--                 (two or more relations in the FROM-clause)
--                 including some operators "and" "or" "not" in 
--                 WHERE-clause
-- (similar to the examples below) 

-- a. Find the customers' names and addresses who like 'Spaghetti Carbonara':
SELECT Name, Contact
FROM Customer
WHERE Name IN (SELECT CustomerName FROM CustomerLikesDish WHERE DishID IN (SELECT DishID FROM Dish WHERE Name = 'Spaghetti Carbonara'));

-- b. Find the dishes liked by at least one customer who frequents 'Papa Jhon''s':
SELECT DISTINCT Dish.Name
FROM Dish
WHERE DishID IN (SELECT DishID FROM CustomerLikesDish WHERE CustomerName IN (SELECT CustomerName FROM CustomerFrequentVisits WHERE RestaurantName = 'Papa Jhon''s'));

-- c. Find the calorie of the dish sold at 'Texas RoadHouse' and liked by 'Nipa':
SELECT Dish.Name, Calorie
FROM Dish
WHERE DishID IN (SELECT DishID FROM RestaurantServesDish WHERE RestaurantName = 'Texas RoadHouse')
AND DishID IN (SELECT DishID FROM CustomerLikesDish WHERE CustomerName = 'Nipa');

-- d. Find the dishes that 'Nasrin' and 'Kazol' both like:
SELECT Dish.Name
FROM Dish
WHERE DishID IN (SELECT DishID FROM CustomerLikesDish WHERE CustomerName = 'Nasrin')
AND DishID IN (SELECT DishID FROM CustomerLikesDish WHERE CustomerName = 'Kazol');

-- e. Find the customers who like 'Grilled Salmon' or 'Margherita Pizza':
SELECT Name
FROM Customer
WHERE Name IN (SELECT CustomerName FROM CustomerLikesDish WHERE DishID IN (SELECT DishID FROM Dish WHERE Name = 'Grilled Salmon' OR Name = 'Margherita Pizza'));

-- f. Find the restaurants where both 'Manager 1' and 'Manager 2' run:
SELECT DISTINCT R.Name
FROM Restaurant AS R
WHERE R.Name IN (SELECT MRR1.RestaurantName FROM ManagerRunsRestaurant AS MRR1 WHERE MRR1.ManagerID IN (SELECT ManagerID FROM Manager WHERE Name = 'John Smith'))
AND R.Name IN (SELECT MRR2.RestaurantName FROM ManagerRunsRestaurant AS MRR2 WHERE MRR2.ManagerID IN (SELECT ManagerID FROM Manager WHERE Name = 'Alice Johnson'));

-- 3. ============= 6 or more Subqueries like below 

-- a. subquery in the clause "FROM"
-- i. Find the dishes and their descriptions for those dishes served in 'Olive Garden'
SELECT Dish.Name, Dish.Description
FROM Dish, (SELECT RestaurantServesDish.DishID
            FROM RestaurantServesDish
            WHERE RestaurantServesDish.RestaurantName = 'Olive Garden') AS DishesInRestaurantA
WHERE Dish.DishID = DishesInRestaurantA.DishID;

-- ii. Find the restaurants and their addresses for those restaurants managed by 'John Smith'
SELECT Restaurant.Name, Restaurant.Address
FROM Restaurant, (SELECT ManagerRunsRestaurant.RestaurantName
                  FROM ManagerRunsRestaurant
                  WHERE ManagerRunsRestaurant.ManagerID = 1) AS RestaurantsManagedByJohnSmith
WHERE Restaurant.Name = RestaurantsManagedByJohnSmith.RestaurantName;

-- b. subquery with keyword "IN"
-- i. Find the customers who like at least one dish served in 'Papa Jhon''s'
SELECT Customer.Name
FROM Customer
WHERE Customer.Name IN (SELECT DISTINCT CustomerLikesDish.CustomerName
                       FROM CustomerLikesDish, RestaurantServesDish
                       WHERE RestaurantServesDish.RestaurantName = 'Papa Jhon''s'
                       AND CustomerLikesDish.DishID = RestaurantServesDish.DishID);

-- ii. Find the managers who run restaurants frequented by 'Nipa'
SELECT Manager.Name
FROM Manager
WHERE Manager.ManagerID IN (SELECT DISTINCT ManagerRunsRestaurant.ManagerID
                            FROM ManagerRunsRestaurant, CustomerFrequentVisits
                            WHERE CustomerFrequentVisits.CustomerName = 'Nipa'
                            AND ManagerRunsRestaurant.RestaurantName = CustomerFrequentVisits.RestaurantName);

-- c. subquery with keyword "EXISTS"
-- i. Find the restaurants that serve at least one dish liked by 'Nasrin'
SELECT Restaurant.Name
FROM Restaurant
WHERE EXISTS (SELECT 1
              FROM CustomerLikesDish
              WHERE CustomerLikesDish.CustomerName = 'Nasrin'
              AND EXISTS (SELECT 1
                          FROM RestaurantServesDish
                          WHERE RestaurantServesDish.DishID = CustomerLikesDish.DishID
                          AND RestaurantServesDish.RestaurantName = Restaurant.Name));

-- ii. Find the dishes with calories greater than any dish liked by 'Salauddin'
SELECT Dish.Name
FROM Dish
WHERE Calorie > ANY (SELECT Dish.Calorie
                    FROM CustomerLikesDish
                    WHERE CustomerLikesDish.CustomerName = 'Salauddin'
                    AND CustomerLikesDish.DishID = Dish.DishID);

-- d. subquery with keyword "ANY"
-- i. Find the dishes with a price greater than any price charged at 'Olive Garden'
SELECT Dish.Name
FROM Dish
WHERE Price > ANY (SELECT RestaurantServesDish.Price
                   FROM RestaurantServesDish
                   WHERE RestaurantServesDish.RestaurantName = 'Olive Garden'
                   AND RestaurantServesDish.DishID = Dish.DishID);

-- ii. Find the customers who have a contact number greater than any other customer
SELECT Customer.Name
FROM Customer
WHERE Contact > ANY (SELECT Contact
                     FROM Customer AS C2
                     WHERE Customer.Name <> C2.Name);

-- e. subquery with keyword "ALL"
-- i. Find the dishes with calories less than all dishes liked by 'Nasrin'
SELECT Dish.Name
FROM Dish
WHERE Calorie < ALL (SELECT Dish.Calorie
                     FROM CustomerLikesDish
                     WHERE CustomerLikesDish.CustomerName = 'Nasrin'
                     AND CustomerLikesDish.DishID = Dish.DishID);

-- ii. Find the customers who have a contact number less than all other customers
SELECT Customer.Name
FROM Customer
WHERE Contact < ALL (SELECT Contact
                    FROM Customer AS C2
                    WHERE Customer.Name <> C2.Name);

-- 4. ===============  3 or more SQL-statements using union, intersect, difference (except) with your questions and SQL's
-- a. INTERSECT
-- i. The dishes served at both 'Fazoli''s' and 'Papa Jhon''s'
SELECT Dish.Name
FROM Dish, RestaurantServesDish
WHERE RestaurantServesDish.RestaurantName = 'Fazoli''s'
INTERSECT
SELECT Dish.Name
FROM Dish, RestaurantServesDish
WHERE RestaurantServesDish.RestaurantName = 'Papa Jhon''s';

-- b. UNION
-- i. The dishes served at 'Fazoli''s' and 'Papa Jhon''s'
SELECT Dish.Name
FROM Dish, RestaurantServesDish
WHERE RestaurantServesDish.RestaurantName = 'Fazoli''s'
UNION
SELECT Dish.Name
FROM Dish, RestaurantServesDish
WHERE RestaurantServesDish.RestaurantName = 'Papa Jhon''s';

-- c. EXCEPT
-- i. The dishes served at 'Texas RoadHouse' but not served at 'Olive Garden'
SELECT Dish.Name
FROM Dish, RestaurantServesDish AS RSD_A
WHERE RSD_A.RestaurantName = 'Texas RoadHouse'
AND Dish.DishID NOT IN (
    SELECT RSD_B.DishID
    FROM RestaurantServesDish AS RSD_B
    WHERE RSD_B.RestaurantName = 'Olive Garden'
);

-- 5. ===============2 or more SQL-statements using Join ==================================
-- using (CROSS JOIN,) NATURAL JOIN, THETA JOIN (INNER JOIN)
-- a. NATURAL JOIN
-- i. Find the dishes liked by at least one customer who frequents some restaurant
SELECT DISTINCT Dish.Name
FROM Dish
NATURAL JOIN CustomerLikesDish
NATURAL JOIN CustomerFrequentVisits;

-- ii. Find the customers who like at least one dish served at some restaurant
SELECT DISTINCT Customer.Name
FROM Customer
NATURAL JOIN CustomerLikesDish
NATURAL JOIN CustomerFrequentVisits;

-- b. THETA JOIN
-- i. Find the restaurants that serve the dishes liked by customer 'Salauddin'
SELECT DISTINCT Restaurant.Name
FROM Restaurant
INNER JOIN CustomerFrequentVisits ON Restaurant.Name = CustomerFrequentVisits.RestaurantName
INNER JOIN CustomerLikesDish ON CustomerFrequentVisits.CustomerName = CustomerLikesDish.CustomerName
INNER JOIN Dish ON CustomerLikesDish.DishID = Dish.DishID
WHERE CustomerLikesDish.CustomerName = 'Salauddin';

-- ii. Find the managers who are responsible for restaurants where they don't serve the favorite dish of any customer (simplified).
SELECT DISTINCT M.Name
FROM Manager AS M
INNER JOIN ManagerRunsRestaurant AS MRR ON M.ManagerID = MRR.ManagerID
WHERE NOT EXISTS (
    SELECT 1
    FROM Restaurant AS R
    INNER JOIN RestaurantServesDish AS RSD ON R.Name = RSD.RestaurantName
    INNER JOIN Customer AS C ON RSD.DishID = C.FavoriteDishID
    WHERE R.Name = MRR.RestaurantName
);


-- 6. =============================== OUTER JOIN
-- using LEFT, RIGHT, FULL OUTER JOIN
-- a. LEFT OUTER JOIN
-- List all customers with the restaurants they frequently visit.
SELECT Customer.Name, CustomerFrequentVisits.RestaurantName
FROM Customer
LEFT JOIN CustomerFrequentVisits ON Customer.Name = CustomerFrequentVisits.CustomerName;

-- b. RIGHT OUTER JOIN
-- i. List all restaurants with the customers who frequently visit them.
SELECT Restaurant.Name, CustomerFrequentVisits.CustomerName
FROM Restaurant
RIGHT JOIN CustomerFrequentVisits ON Restaurant.Name = CustomerFrequentVisits.RestaurantName;

-- ii. List all customers with the restaurants they frequently visit, including customers who don't frequent any restaurant.
SELECT Customer.Name, CustomerFrequentVisits.RestaurantName
FROM Customer
LEFT JOIN CustomerFrequentVisits ON Customer.Name = CustomerFrequentVisits.CustomerName;

-- c. FULL OUTER JOIN
-- i. List all customers with the restaurants they frequently visit and include restaurants without any frequent customers.
SELECT Customer.Name, CustomerFrequentVisits.RestaurantName
FROM Customer
FULL JOIN CustomerFrequentVisits ON Customer.Name = CustomerFrequentVisits.CustomerName;

-- ii. List all restaurants with the customers who frequently visit them and include customers who don't frequent any restaurant.
SELECT Restaurant.Name, CustomerFrequentVisits.CustomerName
FROM Restaurant
FULL JOIN CustomerFrequentVisits ON Restaurant.Name = CustomerFrequentVisits.RestaurantName;

-- 7. Queries, include:
--  at least 3 queries using the aggregate functions below
--  at least one for GROUP BY and HAVING
-- a. Find the maximum calorie count of dishes
SELECT MAX(Calorie) AS MaxCalorie
FROM Dish;

-- b. Find the minimum calorie of dishes
SELECT MIN(Calorie) AS MinCalorie
FROM Dish;

-- c. Find the total calorie count of all dishes
SELECT SUM(Calorie) AS TotalCalories
FROM Dish;

-- d. Find the average price of dishes
SELECT AVG(Price) AS AvgPrice
FROM RestaurantServesDish;

-- e. Count the number of customers
SELECT COUNT(*) AS CustomerCount
FROM Customer;

-- f. Find the total calorie count of dishes for each restaurant
SELECT Restaurant.Name, SUM(Dish.Calorie) AS TotalCalories
FROM Restaurant
INNER JOIN RestaurantServesDish ON Restaurant.Name = RestaurantServesDish.RestaurantName
INNER JOIN Dish ON RestaurantServesDish.DishID = Dish.DishID
GROUP BY Restaurant.Name;

-- g. Find restaurants with an average dish price above $13
SELECT Restaurant.Name, AVG(RestaurantServesDish.Price) AS AvgPrice
FROM Restaurant
INNER JOIN RestaurantServesDish ON Restaurant.Name = RestaurantServesDish.RestaurantName
GROUP BY Restaurant.Name
HAVING AVG(RestaurantServesDish.Price) > 13.00;

