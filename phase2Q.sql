-- Phase II, includes:

-- ============ Convert your E/R to relations

-- ============ CREATE TABLE's (including primary keys) 
--                       please note that we might need to change
--                       these in phase III

-- ============ INSERT data
--                       add some data, 
--                       but please do not insert any sensitive data such as SSN

-- ============ Queris 
 
-- 1. ============ 8 simple queries (similar to the examples below)
--              operators includes (and,or,not) 
--              patterns

 -- SELECT ... FROM ... WHERE

   -- a. Find all the beers' names (example)
   SELECT * 
   FROM Beers;

   -- b. Find the manufacturer who makes the beer Bud  (example)
   SELECT manf
   FROM Beers
   WHERE name = 'Bud';

   -- c. Find all the beers that made by 'Anheuser-Busch'  (example)

   -- d. Find the price Joe's Bar charges for Bud  (example)

   -- e. Find the bars whose names ended with 'Bar'   (example)

   -- f.

   -- g.

   -- h.


-- 2. ============= 6 or more Multirelation queries 
--                 (two or more relations in the FROM-clause)
--                 including some operators "and" "or" "not" in 
--                 WHERE-clause
-- (similar to the examples below) 

   -- a. Find the addresses, and names for those who like 'Bud'  (example)
   SELECT name, addr
   FROM Drinkers, Likes
   WHERE Drinkers.name = Likes.drinker AND
         Likes.beer = 'Bud';

   -- b. Find the beers liked by at least one person who frequents Joe's Bar  (example)


   -- c. Find the prices for beers sold at Joe's Bar and liked by 'Fred'   (example)

   -- d. 

   -- e.

   -- f.

-- 3. ============= 6 or more Subqueries like below 

   -- a. subquery in the clause "FROM"  
   	-- i.  Find the beer and their manfacturers for those beers sold in Joe's Bar

   SELECT name, manf 
   FROM Beers, (SELECT beer
                FROM Sells
                WHERE bar = 'Joe''s Bar') as JoesBar
   WHERE beers.name = JoesBar.beer;

     -- ii.


   -- b. subquery with keyword "IN" 
     -- i. Find the beers liked by at least one person who frequents Joe's Bar  (example)
   SELECT beer
   FROM Likes
   WHERE drinker IN (SELECT drinker
                     FROM Frequents
                     WHERE bar = 'Joe''s Bar'); 

     -- ii.

   -- c. subquery with keyword "EXISTS" 
     -- i.
     -- ii.

   -- d. subquery with keyword "ANY"
     -- i.
     -- ii.
   
   -- e. subquery with keyword "ALL"
     -- i.
     -- ii.


--=============================================================

-- 4. ===============  3 or more SQL-statements using union, intersect, difference (except) with your questions and SQL's


   -- a. Intersect
     -- i. The beers sold at both Joe's Bar and Sue's Bar  (example)
     --    (The beers are sold in Joe's Bar, and these same beers are also sold in Sue's Bar.)
     -- ii.

   -- b. union
     -- i. The beers sold at Joe's Bar or Sue's Bar  (example)
     -- ii.

   -- c. except
     -- i. The beers sold at Joe's Bar but not sold at Sue's Bar  (example)
     -- ii.



-- 5. ===============2 or more SQL-statements using Join ==================================
-- using (CROSS JOIN,) NATURAL JOIN, THETA JOIN (INNER JOIN)
   -- a. NATURAL JOIN
     -- i. Find the beers liked by at least one person who frequents some Bar  (example)
     -- ii.

   -- b. THETA JOIN 
     -- i. Find the bars who sell the beers liked by drinker 'Fred'  (example)

     -- ii.

  



-- 6. =============================== OUTER JOIN
-- using LEFT, RIGHT, FULL OUTER JOIN
   -- a. LEFT OUTER JOIN
     -- List all drinkers with the bars they frequent.  (example)

   -- b. RIGHT OUTER JOIN
     -- i.
     -- ii.


   -- c. FULL OUTER JOIN
     -- i.
     -- ii.

 

-- 7. Queries, include:
--  at least 3 queries using the aggregate functions below
--  at least one for GROUP BY and HAVING

   -- a. MAX, 
   -- b. MIN, 
   -- c. SUM, 
   -- d. AVG, 
   -- e. COUNT
   -- f. GROUP BY
   -- g. HAVING 