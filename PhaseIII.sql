-- Phase III includes
--     Phase I, Phase II, and the following:
-- That is, phase III should be a complete document,
--     including everything from phases I and II plus
--     the new requirements below.
-- The document should be in a nicely formatted pdf file.
-- You can assume that you are giving your document to a client or
--     to a job interviewer.
--     You want to show your ability of doing the job.

-- ============ 1. Modify your CREATE TABLE statments
--                    to include constraints

-- Create the "RestoWave" database
CREATE DATABASE IF NOT EXISTS RestoWave;

-- Use the "RestoWave" database
USE RestoWave;

-- ============ 1. Modify your CREATE TABLE statments
--                    to include constraints
-- In addition to your phases I and II, add/modify according to the following.
-- 1. Modify your CREATE TABLE statements to include:
--     (each of the below should be used at least once in the project)
   -- a. primary key
   -- b. foreign key
   -- c. attribute constraints
   -- d. tuple constraints

-- Create the "Manager" table
CREATE TABLE Manager (
    ManagerID INT UNIQUE,
    Name VARCHAR(255) NOT NULL,
    Contact VARCHAR(20) UNIQUE
);

-- Create the "Dish" table
CREATE TABLE Dish (
    DishID INT UNIQUE,
    Name VARCHAR(255),
    Description TEXT,
    Calorie INT CHECK (Calorie >= 0) DEFAULT 0
);

-- Create the "Restaurant" table
CREATE TABLE Restaurant (
    Name VARCHAR(255) PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID) ON DELETE SET NULL
);

-- Create the "Customer" table without BuddyID
CREATE TABLE Customer (
    Name VARCHAR(255) PRIMARY KEY,
    Contact VARCHAR(20) UNIQUE,
    FavoriteDishID INT,
    FOREIGN KEY (FavoriteDishID) REFERENCES Dish(DishID) ON DELETE SET NULL
);

-- Create the "OperatingHours" table
CREATE TABLE OperatingHours (
    HoursID INT PRIMARY KEY,
    RestaurantName VARCHAR(255),
    DayOfWeek VARCHAR(15) NOT NULL,
    OpenTime TIME,
    CloseTime TIME,
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name) ON DELETE SET NULL
);

-- Create the "ManagerRunsRestaurant" relationship table
CREATE TABLE ManagerRunsRestaurant (
    RestaurantName VARCHAR(255),
    ManagerID INT,
    PRIMARY KEY (RestaurantName, ManagerID),
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name) ON DELETE CASCADE,
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID) ON DELETE CASCADE
);


-- Create the "RestaurantServesDish" relationship table
CREATE TABLE RestaurantServesDish (
    RestaurantName VARCHAR(255),
    DishID INT,
    Price DECIMAL(10, 2),
    PRIMARY KEY (RestaurantName, DishID),
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name) ON DELETE CASCADE,
    FOREIGN KEY (DishID) REFERENCES Dish(DishID) ON DELETE CASCADE
);

-- Create the "CustomerFrequentVisits" relationship table
CREATE TABLE CustomerFrequentVisits (
    CustomerName VARCHAR(255),
    RestaurantName VARCHAR(255),
    DishID INT,
    PRIMARY KEY (CustomerName, RestaurantName, DishID),
    FOREIGN KEY (CustomerName) REFERENCES Customer(Name) ON DELETE CASCADE,
    FOREIGN KEY (RestaurantName) REFERENCES Restaurant(Name) ON DELETE CASCADE,
    FOREIGN KEY (DishID) REFERENCES Dish(DishID) ON DELETE CASCADE
);

-- Create the "CustomerLikesDish" relationship table
CREATE TABLE CustomerLikesDish (
    CustomerName VARCHAR(255),
    DishID INT,
    PRIMARY KEY (CustomerName, DishID),
    FOREIGN KEY (CustomerName) REFERENCES Customer(Name) ON DELETE CASCADE,
    FOREIGN KEY (DishID) REFERENCES Dish(DishID) ON DELETE CASCADE
);

-- Create the "CustomerFavouritesDish" relationship table
CREATE TABLE CustomerFavouritesDish (
    CustomerName VARCHAR(255),
    DishID INT,
    PRIMARY KEY (CustomerName, DishID),
    FOREIGN KEY (CustomerName) REFERENCES Customer(Name) ON DELETE CASCADE,
    FOREIGN KEY (DishID) REFERENCES Dish(DishID) ON DELETE CASCADE
);

-- Create the "MarriedCouples" relationship table
CREATE TABLE MarriedCouples (
    Customer1Name VARCHAR(255),
    Customer2Name VARCHAR(255),
    PRIMARY KEY (Customer1Name, Customer2Name),
    FOREIGN KEY (Customer1Name) REFERENCES Customer(Name) ON DELETE CASCADE,
    FOREIGN KEY (Customer2Name) REFERENCES Customer(Name) ON DELETE CASCADE
);

-- Create the "Buddies" table
CREATE TABLE Buddies (
    Buddy1Name VARCHAR(255),
    Buddy2Name VARCHAR(255),
    PRIMARY KEY (Buddy1Name, Buddy2Name),
    FOREIGN KEY (Buddy1Name) REFERENCES Customer(Name) ON DELETE CASCADE,
    FOREIGN KEY (Buddy2Name) REFERENCES Customer(Name) ON DELETE CASCADE
);

-- INSERTION OF VALUES INTO THE TABLES BELOW:

-- Insert data into the "Manager" table

INSERT INTO Manager (ManagerID, Name, Contact)
VALUES
    (1, 'John Smith', 'john@gmail.com'),
    (2, 'Alice Johnson', 'alice@gmail.com'),
    (3, 'Michael Johnson', 'michael@yahoo.com'),
    (4, 'Sarah Davis', 'sarah@twitter.com'),
    (7, 'Sehrish Alvina', 'seh@twitter.com'),
    (5, 'Emily White', 'emily@gmail.com'),
    (6, 'Daniel Brown', 'daniel@yahoo.com');


-- Insert data into the "Dish" table
INSERT INTO Dish (DishID, Name, Description, Calorie)
VALUES
    (1, 'Spaghetti Carbonara', 'Creamy pasta with bacon', 800),
    (2, 'Grilled Salmon', 'Served with lemon butter sauce', 600),
    (3, 'Caesar Salad', 'Fresh salad with dressing', 350),
    (4, 'Margherita Pizza', 'Classic pizza with tomato and cheese', 900),
    (5, 'Chicken Alfredo', 'Creamy pasta with grilled chicken', 850),
    (6, 'Cesar Wrap', 'Grilled chicken with Caesar dressing in a wrap', 500);


-- Insert data into the "Restaurant" table
INSERT INTO Restaurant (Name, Address, Phone, ManagerID)
VALUES
    ('Fazoli''s', '123 Main St', '555-1234', 1),
    ('Texas RoadHouse', '456 Elm St', '555-5678', 2),
    ('Olive Garden', '789 Oak St', '555-3333', 3),
    ('Papa Jhon''s', '321 Oak Ave', '555-5555', 4),
    ('Bella Italia', '987 Pine St', '555-9999', 5),
    ('TGI Fridays', '654 Maple Ave', '555-4444', 6);


-- Insert data into the "OperatingHours" table
INSERT INTO OperatingHours (HoursID, RestaurantName, DayOfWeek, OpenTime, CloseTime)
VALUES
    (1, 'Fazoli''s', 'Monday', '09:00:00', '21:00:00'),
    (2, 'Fazoli''s', 'Tuesday', '09:00:00', '21:00:00'),
    (3, 'Fazoli''s', 'Wednesday', '09:00:00', '21:00:00'),
    (4, 'Fazoli''s', 'Thursday', '09:00:00', '21:00:00'),
    (5, 'Fazoli''s', 'Friday', '09:00:00', '22:00:00'),
    (6, 'Fazoli''s', 'Saturday', '10:00:00', '22:00:00'),
    (7, 'Fazoli''s', 'Sunday', '10:00:00', '21:00:00'),

    (8, 'Texas RoadHouse', 'Monday', '11:00:00', '22:00:00'),
    (9, 'Texas RoadHouse', 'Tuesday', '11:00:00', '22:00:00'),
    (10, 'Texas RoadHouse', 'Wednesday', '11:00:00', '22:00:00'),
    (11, 'Texas RoadHouse', 'Thursday', '11:00:00', '22:00:00'),
    (12, 'Texas RoadHouse', 'Friday', '11:00:00', '23:00:00'),
    (13, 'Texas RoadHouse', 'Saturday', '11:00:00', '23:00:00'),
    (14, 'Texas RoadHouse', 'Sunday', '11:00:00', '22:00:00'),

    (15, 'Olive Garden', 'Monday', '10:30:00', '22:00:00'),
    (16, 'Olive Garden', 'Tuesday', '10:30:00', '22:00:00'),
    (17, 'Olive Garden', 'Wednesday', '10:30:00', '22:00:00'),
    (18, 'Olive Garden', 'Thursday', '10:30:00', '22:00:00'),
    (19, 'Olive Garden', 'Friday', '10:30:00', '23:00:00'),
    (20, 'Olive Garden', 'Saturday', '10:30:00', '23:00:00'),
    (21, 'Olive Garden', 'Sunday', '10:30:00', '22:00:00'),

    (22, 'Papa Jhon''s', 'Monday', '10:00:00', '21:00:00'),
    (23, 'Papa Jhon''s', 'Tuesday', '10:00:00', '21:00:00'),
    (24, 'Papa Jhon''s', 'Wednesday', '10:00:00', '21:00:00'),
    (25, 'Papa Jhon''s', 'Thursday', '10:00:00', '21:00:00'),
    (26, 'Papa Jhon''s', 'Friday', '10:00:00', '22:00:00'),
    (27, 'Papa Jhon''s', 'Saturday', '10:00:00', '22:00:00'),
    (28, 'Papa Jhon''s', 'Sunday', '10:00:00', '21:00:00'),

    (29, 'Bella Italia', 'Monday', '10:00:00', '22:00:00'),
    (30, 'Bella Italia', 'Tuesday', '10:00:00', '22:00:00'),
    (31, 'Bella Italia', 'Wednesday', '10:00:00', '22:00:00'),
    (32, 'Bella Italia', 'Thursday', '10:00:00', '22:00:00'),
    (33, 'Bella Italia', 'Friday', '10:00:00', '23:00:00'),
    (34, 'Bella Italia', 'Saturday', '10:00:00', '23:00:00'),
    (35, 'Bella Italia', 'Sunday', '10:00:00', '22:00:00'),

    (36, 'TGI Fridays', 'Monday', '11:00:00', '22:00:00'),
    (37, 'TGI Fridays', 'Tuesday', '11:00:00', '22:00:00'),
    (38, 'TGI Fridays', 'Wednesday', '11:00:00', '22:00:00'),
    (39, 'TGI Fridays', 'Thursday', '11:00:00', '22:00:00'),
    (40, 'TGI Fridays', 'Friday', '11:00:00', '23:00:00'),
    (41, 'TGI Fridays', 'Saturday', '11:00:00', '23:00:00'),
    (42, 'TGI Fridays', 'Sunday', '11:00:00', '22:00:00');


-- Insert data into the "Customer" table
INSERT INTO Customer (Name, Contact, FavoriteDishID)
VALUES
    ('Nasrin', 'nasrin@gmail.com', 1),
    ('Nipa', 'nipa@yahoo.com', 2),
    ('Kazol', 'kazol@gmail.com', 3),
    ('Salauddin', 'salauddin@gmail.com', 4),
    ('Sumaiya', 'sum@yahoo.com', 1),
    ('Shaheen', 'shaheen@gmail.com', 3),
    ('Alex', 'alex@gmail.com', 5),
    ('Sophie', 'sophie@yahoo.com', 6);


-- Insert data into the "ManagerRunsRestaurant" relationship table
INSERT INTO ManagerRunsRestaurant (RestaurantName, ManagerID)
VALUES
    ('Fazoli''s', 1),
    ('Texas RoadHouse', 2),
    ('Olive Garden', 3),
    ('Papa Jhon''s', 4),
    ('Bella Italia', 5),
    ('TGI Fridays', 6),
    ('Fazoli''s', 7);


-- Insert data into the "RestaurantServesDish" relationship table
INSERT INTO RestaurantServesDish (RestaurantName, DishID, Price)
VALUES
    ('Fazoli''s', 1, 12.99),
    ('Texas RoadHouse', 2, 15.99),
    ('Olive Garden', 3, 8.99),
    ('Papa Jhon''s', 4, 14.99),
    ('Bella Italia', 5, 13.99),
    ('TGI Fridays', 6, 10.49);


-- Insert data into the "CustomerLikesDish" relationship table
INSERT INTO CustomerLikesDish (CustomerName, DishID)
VALUES
    ('Nasrin', 1),
    ('Nasrin', 3),
    ('Nipa', 2),
    ('Kazol', 3),
    ('Salauddin', 4),
    ('Alex', 5),
    ('Sophie', 6);


-- Insert data into the "CustomerFavouritesDish" relationship table
INSERT INTO CustomerFavouritesDish (CustomerName, DishID)
VALUES
    ('Nasrin', 1),
    ('Kazol', 3),
    ('Alex', 5),
    ('Sophie', 6);


-- Insert data into the "CustomerFrequentVisits" table
INSERT INTO CustomerFrequentVisits (CustomerName, RestaurantName, DishID)
VALUES
    ('Nasrin', 'Fazoli''s', 1),
    ('Nasrin', 'Papa Jhon''s', 4),
    ('Nipa', 'Texas RoadHouse', 2),
    ('Kazol', 'Olive Garden', 3),
    ('Salauddin', 'Papa Jhon''s', 4),
    ('Sumaiya', 'Fazoli''s', 1),
    ('Shaheen', 'Olive Garden', 3),
    ('Alex', 'Bella Italia', 5),
    ('Sophie', 'TGI Fridays', 6);


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

-- ============ 2. Queries
-- ============       continued from Phase II
-- ===============Data manipulation: (see phase2Q.sql)
--				  	SQL schema (CREATE TABLES)
--				  		- Including primary keys, unique, not null, default…
--				    Insert statements to input data in each tables.
--				    Queries
--				        - Questions: give the questions.
--				        - Solutions: use what we have learned in class. See phase2q.sql file for examples)
--				    You should provide at least the number of different types of questions/queries as the attached file, phase2Q.sql.
--                  Submit your phase II in a text file plus one in a pdf file.


-- 1. ============ 8 simple queries (similar to the examples below)
--              operators includes (and,or,not)
--              patterns

 -- SELECT ... FROM ... WHERE
-- a. Find all the dishes' names:
SELECT *
FROM Dish;

-- b. Find the restaurant manager who runs restaurant named 'Fazoli's':
SELECT Name
FROM Manager
WHERE ManagerID = (
    SELECT ManagerID
    FROM ManagerRunsRestaurant
    WHERE RestaurantName = 'Fazoli''s'
);

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
-- This is an one-to-one relationship between Restaurant and Manager
-- one manager can work for one restaurant only
-- so there is no such manager who runs multiple restaurant

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

-- f. Find the restaurants where both 'Manager 1' and 'Manager 7' work:
SELECT DISTINCT R.Name
FROM Restaurant AS R
WHERE R.Name IN (SELECT MRR1.RestaurantName FROM ManagerRunsRestaurant AS MRR1 WHERE MRR1.ManagerID IN (SELECT ManagerID FROM Manager WHERE Name = 'John Smith'))
AND R.Name IN (SELECT MRR2.RestaurantName FROM ManagerRunsRestaurant AS MRR2 WHERE MRR2.ManagerID IN (SELECT ManagerID FROM Manager WHERE Name = 'Sehrish Alvina'));

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

-- ii. Find customers who have liked a dish with calories greater than 800
SELECT DISTINCT CustomerName
FROM CustomerLikesDish AS CLD
WHERE EXISTS (
    SELECT 1
    FROM Dish AS D
    WHERE D.DishID = CLD.DishID
      AND D.Calorie > 800
);


-- d. subquery with keyword "ANY"
-- i. Find the customers who like at least one dish with a calorie count greater than ANY dish liked by 'Nasrin'
SELECT DISTINCT CLD.CustomerName
FROM CustomerLikesDish AS CLD
WHERE EXISTS (
    SELECT 1
    FROM Dish AS D1
    WHERE D1.DishID = CLD.DishID
      AND D1.Calorie > ANY (
          SELECT D2.Calorie
          FROM CustomerLikesDish AS CLD2
          JOIN Dish AS D2 ON CLD2.DishID = D2.DishID
          WHERE CLD2.CustomerName = 'Nasrin'
      )
);


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
SELECT Customer.Name, COALESCE(CustomerFrequentVisits.RestaurantName, 'No frequent visits') AS FrequentRestaurant
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
-- i. List all customers with the restaurants they frequently visit
-- and include restaurants without any frequent customers.

SELECT Customer.Name, CustomerFrequentVisits.RestaurantName
FROM Customer
LEFT JOIN CustomerFrequentVisits ON Customer.Name = CustomerFrequentVisits.CustomerName
UNION
SELECT CustomerFrequentVisits.CustomerName, CustomerFrequentVisits.RestaurantName
FROM CustomerFrequentVisits
LEFT JOIN Customer ON CustomerFrequentVisits.CustomerName = Customer.Name
WHERE Customer.Name IS NULL;


-- ii. List all restaurants with the customers who frequently visit them and include customers
-- who don't frequent any restaurant.

SELECT R.Name AS RestaurantName, COALESCE(CFV.CustomerName, 'No frequent visits') AS CustomerName
FROM Restaurant R
LEFT JOIN CustomerFrequentVisits CFV ON R.Name = CFV.RestaurantName

UNION

SELECT R.Name AS RestaurantName, COALESCE(CFV.CustomerName, 'No frequent visits') AS CustomerName
FROM CustomerFrequentVisits CFV
LEFT JOIN Restaurant R ON CFV.RestaurantName = R.Name
WHERE R.Name IS NULL;


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

-- g. Find restaurants with an average dish price above $13 with two decimal points
SELECT Restaurant.Name, FORMAT(AVG(RestaurantServesDish.Price), 2) AS AvgPrice
FROM Restaurant
INNER JOIN RestaurantServesDish ON Restaurant.Name = RestaurantServesDish.RestaurantName
GROUP BY Restaurant.Name
HAVING AVG(RestaurantServesDish.Price) > 13.00;



-- ============ 3. Modify database using insert, update, delete

-- ============ 4. view

-- ============ 5. one transaction

-- ============ 6. one PSM, one trigger

-- ============ 7. one simple interface to access your data

-- ============ 8. Functional dependencies for each table


-- 3. Modify database using insert, update, delete
   -- a. INSERT
   -- b. Insert into a table from subquery
   -- c. DELETE
   -- d. DELETE from a table including subquery
   -- e. UPDATE
   -- f. UPDATE a table including subquery

   -- a. INSERT
-- Insert more values into the "Customer" table
INSERT INTO Customer (Name, Contact, FavoriteDishID)
VALUES
    ('Peal', 'peal@example.com', 3),
    ('Irfan', 'irfan@example.com', 4),
    ('Shad', 'shad@example.com', 2),
    ('Adnan', 'adnan@example.com', 1),
    ('Prova', 'prova@example.com', 3);


   -- b. Insert into a table from subquery
    -- Insert into the "CustomerLikesDish" table from a subquery, avoiding duplicates
INSERT INTO CustomerLikesDish (CustomerName, DishID)
SELECT Customer.Name, Customer.FavoriteDishID
FROM Customer
WHERE Customer.FavoriteDishID IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM CustomerLikesDish
    WHERE CustomerLikesDish.CustomerName = Customer.Name
    AND CustomerLikesDish.DishID = Customer.FavoriteDishID
);
SELECT * FROM Customer;
SELECT * FROM CustomerLikesDish;

   -- c. DELETE
-- Delete a specific customer from the "Customer" table
DELETE FROM Customer
WHERE Name = 'Nipa';

   -- d. DELETE from a table including subquery
-- Delete all customers who have not visited any restaurant (not in CustomerFrequentVisits)
DELETE FROM Customer
WHERE Name NOT IN (SELECT DISTINCT CustomerName FROM CustomerFrequentVisits);
SELECT * FROM Customer;
SELECT * FROM CustomerFrequentVisits;

   -- e. UPDATE
ALTER TABLE ManagerRunsRestaurant
ADD COLUMN ManagerName VARCHAR(255);

   -- f. UPDATE a table including subquery
UPDATE ManagerRunsRestaurant
SET ManagerName = (
    SELECT Name
    FROM Manager
    WHERE ManagerRunsRestaurant.ManagerID = Manager.ManagerID
);
SELECT * FROM ManagerRunsRestaurant;

-- 4. view
   -- CREATE a view
CREATE VIEW CustomerFavoriteDishView AS
SELECT C.Name AS CustomerName, D.Name AS FavoriteDishName
FROM Customer C
JOIN Dish D ON C.FavoriteDishID = D.DishID;
SELECT * FROM CustomerFavoriteDishView;


-- 5. one transaction to process some needed
   --  modification of database at one time
-- Start a transaction
START TRANSACTION;

-- Update the favorite dish of a customer
UPDATE Customer
SET FavoriteDishID = 2
WHERE Name = 'Nasrin';

-- Delete a specific dish from the "Dish" table
DELETE FROM Dish
WHERE DishID = 3;

-- Insert a new dish into the "Dish" table
INSERT INTO Dish (DishID, Name, Description, Calorie)
VALUES (7, 'Chicken Fry', 'Honey Garlic Fried Chicken', 950);

-- Commit the transaction if all statements succeed; otherwise, roll back
COMMIT;


-- 6. PSM, trigger (using standard one or posgresql's)
   -- a. PSM
-- Create a stored procedure to get the total calorie count for a given customer
DELIMITER //
CREATE PROCEDURE GetTotalCalories(IN customerName VARCHAR(255))
BEGIN
    DECLARE totalCalories INT;

    SELECT SUM(D.Calorie)
    INTO totalCalories
    FROM CustomerFrequentVisits CFV
    JOIN Dish D ON CFV.DishID = D.DishID
    WHERE CFV.CustomerName = customerName;

    SELECT totalCalories AS TotalCaloriesForCustomer;
END //
DELIMITER ;
-- Call the stored procedure
CALL GetTotalCalories('Nasrin');


   -- b. trigger
-- Create a trigger to update the favorite dish of a customer after frequent visits
DELIMITER //
CREATE TRIGGER UpdateFavoriteDish
AFTER INSERT ON CustomerFrequentVisits
FOR EACH ROW
BEGIN
    DECLARE frequentDishID INT;

    -- Get the most frequently visited dish for the customer
    SELECT DishID
    INTO frequentDishID
    FROM (
        SELECT DishID, COUNT(*) AS VisitCount
        FROM CustomerFrequentVisits
        WHERE CustomerName = NEW.CustomerName
        GROUP BY DishID
        ORDER BY VisitCount DESC
        LIMIT 1
    ) AS MostFrequentDish;

    -- Update the customer's favorite dish
    UPDATE Customer
    SET FavoriteDishID = frequentDishID
    WHERE Name = NEW.CustomerName;
END //
DELIMITER ;
-- Example: Insert data into CustomerFrequentVisits
INSERT INTO CustomerFrequentVisits (CustomerName, RestaurantName, DishID)
VALUES ('Nasrin', 'Fazoli''s', 1);

-- Query to see the updated favorite dish in Customer table
SELECT * FROM Customer WHERE Name = 'Nasrin';


-- 7. one simple interface to access your data
   -- there will be a sample interface in html/php for you to use
   -- please find them in the folder "/cs45543/" of the class machine
   -- or, you can create your own.
   -- give the link to your webpage on the report

-- 8. Functional dependencies for each table
   -- list the functional dependencies for each table
   -- for example:
   -- Sells: {bar, beer}-> price
   -- Beers:  name -> manf

-- Functional Dependencies for each table of "RESTOWAVE" Database:

-- Restaurant:  {Name} -> Address, Phone, ManagerID
-- Customer:  {Name} -> Contact, FavouriteDishID
-- Manager:  {ManagerID} -> Name, Contact
-- Dish:  {DishID} -> Name, Description, Calorie
-- OperatingHours:  {HoursID} -> DayOfWeek, OpenTime, CloseTime, RestaurantName
-- ManagerRunsRestaurant:  {RestaurantName, ManagerID} -> [no additional functional dependencies]
-- RestaurantServesDish:  {RestaurantName, DishID} -> Price
-- CustomerFrequentVisits:  {CustomerName, RestaurantName, DishID} -> [no additional functional dependencies]
-- CustomerLikesDish:  {CustomerName, DishID} -> [no additional functional dependencies]
-- CustomerFavouritesDish:  {CustomerName, DishID} -> [no additional functional dependencies]
-- MarriedCouples:  {CustomerName1, CustomerName2} -> [no additional functional dependencies]
-- Buddies:  {CustomerName1, CustomerName2} -> [no additional functional dependencies]

-- 8. relational algebra
   -- at least one relational algebra
   -- give a question, then answer it by relational algebra.

-- QUESTION:
-- Retrieve the names and contacts of customers who frequent
-- a restaurant named 'Fazoli's' and
-- have a favourite dish with more than 500 calories.
-- Answer:
-- π_{Customer.Name, Customer.Contact}(σ_{Restaurant.Name='Fazoli''s' ∧ Dish.Calorie > 500} (CustomerFrequentVisits ⨝_{Customer.FavoriteDishID=Dish.DishID} Customer))
-- RDBMS for the answer:
-- SQL Equivalent:
SELECT Customer.Name, Customer.Contact
FROM Customer
JOIN CustomerFrequentVisits ON Customer.Name = CustomerFrequentVisits.CustomerName
JOIN Dish ON Customer.FavoriteDishID = Dish.DishID
WHERE RestaurantName = 'Fazoli''s' AND Calorie > 500;
