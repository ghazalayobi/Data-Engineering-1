drop table employee;
-- Exercise 1
Create table employee (id INTEGER NOT NULL, employee_name varchar(255) not null, primary key(id));
describe employee;

-- inseritng lines in to emplyee
INSERT INTO employee (id,employee_name) VALUES(1,'Student1');
INSERT INTO employee (id,employee_name) VALUES(2,'Student2');
INSERT INTO employee (id,employee_name) VALUES(3,'Student3');

-- checking result in employee
select * from employee;

-- inserting a new line
INSERT INTO employee (id,employee_name) VALUES(3,'Student4');
-- it gives an error because there is an exisitng employee key. which is 3

-- updating rows
UPDATE employee SET employee_name='Arnold Schwarzenegger' WHERE id = '1';
UPDATE employee SET employee_name='The Other Arnold' WHERE id = '2';

-- checking results
SELECT * FROM employee;

-- deleting a row
DELETE FROM employee WHERE id = 3;

-- checking results
SELECT * FROM employee;

-- deleting all rows
TRUNCATE employee;
SELECT * FROM employee;


-- creating users and privileges
create user 'ghazalayobi'@'%' identified by 'ghazalayobi';
grant all on birdstrikes.employee to 'ghazalayobi';
GRANT SELECT (state) ON birdstrikes.birdstrikes TO 'ghazalayobi'@'%';
DROP USER 'ghazalayobi'@'%';

-- Creating a new column
SELECT *, speed/2 FROM birdstrikes;

-- Aliasing 
SELECT *, speed/2 AS halfspeed FROM birdstrikes;

-- listing the first 10 records
SELECT * FROM birdstrikes LIMIT 10;

-- List the first 1 record, after the the first 10
SELECT * FROM birdstrikes LIMIT 10,1;

-- Exercise 2: What state figures in the 145th line of our database?
select * from birdstrikes limit 145;
-- Answer: Tennesse

-- ORDERING DATA
-- Ordering by a field
SELECT state, cost FROM birdstrikes ORDER BY cost;

-- ordering by multiple fields
SELECT state, cost FROM birdstrikes ORDER BY state, cost ASC;

-- Reverse ordering 
SELECT state, cost FROM birdstrikes ORDER BY cost DESC;

-- Exersie 3: What is flight_date of the latest birstrike in this database?
describe birdstrikes;
SELECT flight_date FROM birdstrikes ORDER BY flight_date DESC LIMIT 1;
-- Answer: 2000-04-18

-- Unique Values
-- selecting unique values of a column
SELECT DISTINCT damage FROM birdstrikes;

-- selecting unique pairs
SELECT DISTINCT airline, damage FROM birdstrikes;

-- Exercise 4: What was the cost of the 50th most expensive damage?
select distinct cost from birdstrikes order by cost desc limit 49,1;
-- Answer: Cost: 5345

-- Filering
-- Select lines where states is Alabama
SELECT * FROM birdstrikes WHERE state = 'Alabama';

-- LIKE
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'A%';

-- NotING the case (in)sensitivity
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'a%';

-- For example, if it starts with ‘ala’
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'ala%';

-- States starting with ‘North ‘ followed by any character, followed by an ‘a’, followed by anything
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'North _a%';

-- States not starting with ‘A’
SELECT DISTINCT state FROM birdstrikes WHERE state NOT LIKE 'a%' ORDER BY state;

-- Logical operators
-- Filter by multiple conditions
SELECT * FROM birdstrikes WHERE state = 'Alabama' AND bird_size = 'Small';
SELECT * FROM birdstrikes WHERE state = 'Alabama' OR state = 'Missouri';

-- IS NOT NULL
-- Filtering out nulls and empty strings
SELECT DISTINCT(state) FROM birdstrikes WHERE state IS NOT NULL AND state != '' ORDER BY state;


-- IN 
-- What if I need ‘Alabama’, ‘Missouri’,’New York’,’Alaska’? Should we concatenate 4 AND filters?
SELECT * FROM birdstrikes WHERE state IN ('Alabama', 'Missouri','New York','Alaska');

-- LENGTH
-- Listing states with 5 characters
SELECT DISTINCT(state) FROM birdstrikes WHERE LENGTH(state) = 5;

-- Filtering with INT
-- Speed equals 350
SELECT * FROM birdstrikes WHERE speed = 350;

-- Speed equal or more than 25000
SELECT * FROM birdstrikes WHERE speed >= 10000;

-- ROUND, SQRT
SELECT ROUND(SQRT(speed/2) * 10) AS synthetic_speed FROM birdstrikes;

-- BETWEEN
SELECT * FROM birdstrikes where cost BETWEEN 20 AND 40;

-- Exercise 5: What state figures in the 2nd record, if you filter out all records which have no state and no bird_size specified?
select state from birdstrikes where state is null and bird_size = '' limit 1,1;
-- blank

-- Filtering with date
-- Date is “2000-01-02”
SELECT * FROM birdstrikes WHERE flight_date = "2000-01-02";

-- All entries where flight_date is between “2000-01-01” AND “2000-01-03”
SELECT * FROM birdstrikes WHERE flight_date >= '2000-01-01' AND flight_date <= '2000-01-03';

-- BETWEEN
SELECT * FROM birdstrikes where flight_date BETWEEN "2000-01-01" AND "2000-01-03";

-- Exercise 6: 
describe birdstrikes;
select datediff(now(), (select flight_date from birdstrikes where state = 'colorado' and weekofyear(flight_date)= 52))
-- Answer: 7940