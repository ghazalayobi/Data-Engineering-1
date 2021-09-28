
-- HW3
-- Exercise 1 : Do the same with speed. If speed is NULL or speed < 100 create a “LOW SPEED” category, otherwise, mark as “HIGH SPEED”. Use IF instead of CASE!
use birdstrikes;
SELECT aircraft, airline, speed, 
    if(speed < 100 OR speed is null, "LOW SPEED", 'HIGH SPEED') AS SPEED_CATEGORY   
FROM  birdstrikes
ORDER BY SPEED_CATEGORY;
-- Answer : We created a new column which categorizes speed by Low Speed and High Speed

-- Exercise 2
SELECT count(DISTINCT aircraft) from birdstrikes;
-- Answer : 3

-- Exercise 3; 
select min(speed) from birdstrikes where aircraft like "h%";
-- Answer: 2862.5000

-- Exercise 4
-- Which phase_of_flight has the least of incidents?
-- 1st method
select count(*), phase_of_flight from birdstrikes group by phase_of_flight;
-- 2nd method
select phase_of_flight, count(*) as count from birdstrikes group by phase_of_flight order by count limit 1;
-- Answer : Taxi which is 2

-- Exercise 5 : What is the rounded highest average cost by phase_of_flight?
select round(avg(cost)), phase_of_flight as avg_cost from birdstrikes group by phase_of_flight order by round(avg(avg_cost)) desc limit 1;
-- 9475 Take-off-run 

-- exercise 6
-- What the highest AVG speed of the states with names less than 5 characters?
select avg(speed) as avg_speed, state from birdstrikes group by state having length(state)<5 and state !='' order by avg_speed desc limit 1;
-- Answer: 28862.5000 lowa