-- MYSQL Project 

-- BASIC(Inculding Count,Sum,Max,Min,Avg,Distinct,Where,Between,
--       And,In,Group by,Having,Order by,Asc,Desc and basic queries etc):-

-- Q1). Read Cars Data
SELECT 
    *
FROM
    car_dekho;


-- Q2).Total Cars:Count of total records
SELECT 
    COUNT(*) AS Total_cars
FROM
    car_dekho; 


-- Q3).The Manager asked to employee that how many cars are available in 2023?
SELECT 
    COUNT(*) AS Total_cars_2023
FROM
    car_dekho
WHERE
    year = 2023;


-- Q4).The Manager asked to employee How many cars are available in 2020,2021,2022? 
SELECT 
    year, COUNT(*) AS Total_cars
FROM
    car_dekho
WHERE
    year IN (2020 , 2021, 2022)
GROUP BY year;


-- Q5).Clint asked me to print the total of all cars by year. 
SELECT 
    year, COUNT(*) AS Car_sum
FROM
    car_dekho
GROUP BY year;


-- Q6). Clint asked to car dealer agent that how many diesel cars are available in 2020?
SELECT 
    COUNT(*) AS total_cars
FROM
    car_dekho
WHERE
    year = 2020 AND fuel = 'diesel';
    

-- Q7).The Manager ordered to employee to print petrol,diesel, and CNG by year.    
SELECT 
    year, COUNT(fuel) AS total_cars
FROM
    car_dekho
WHERE
    fuel IN ('Petrol' , 'Diesel', 'CNG')
GROUP BY year;


-- Q8).Which year has more than 100 Cars ?
SELECT 
    year, COUNT(*) AS total_cars
FROM
    car_dekho
GROUP BY year
HAVING COUNT(*) > 100;


-- Q9).Car details between 2015 to 2023

SELECT 
    *
FROM
    car_dekho
WHERE
    year BETWEEN 2015 AND 2023
ORDER BY year ASC;


-- Q10).Name of cars with Max,Min,Avg selling_price

SELECT 
    Name,
    AVG(selling_price) AS Avg_price,
    MAX(selling_price) AS Max_price,
    MIN(selling_price) AS Min_price
FROM
    car_dekho
GROUP BY Name;


-- Q11).Count of distinct Cars
SELECT 
    COUNT(DISTINCT (Name))
FROM
    car_dekho;
    
-- INTERMEDIATE:(Concat,Subqueries,Window Functions such as ROW_NUMBER(),
-- RANK(),DENSE_RANK,SUM() OVER(),AVG()OVER() etc and Many other advance queries):-    

-- Q12).Find the top 3 new cars Name and mileage with having these conditions:Petrol fuel,
-- selling_price below 500000 ,Automatic transmission and Individual seller_type) 


SELECT 
    Name, mileage, year
FROM
    car_dekho
WHERE
    fuel = 'Petrol'
        AND selling_price < 500000
        AND transmission = 'Automatic'
        AND seller_type = 'Individual'
ORDER BY year DESC
LIMIT 3;


-- Q13). Give me a data about Cars incuding Name , year, selling_price,
--  fuel, engine and seats in one line which has 250Nm torque.

#concat


SELECT 
    CONCAT(Name,
            '-',
            year,
            '-',
            selling_price,
            '-',
            fuel,
            '-',
            engine,
            '-',
            seats) AS Car_Data
FROM
    car_dekho
WHERE
    torque = '250Nm';
    
 
-- Q14). Find the Car's Maximum selling_price and it's Name which contain greater then Avg of km_driven.
 
 #subqueries
 
SELECT 
    MAX(selling_price) AS Maxi_price, Name
FROM
    car_dekho
WHERE
    km_driven > (SELECT 
            AVG(km_driven)
        FROM
            car_dekho)
GROUP BY Name
ORDER BY Maxi_price DESC
LIMIT 1;   

-- Q15. Find the Row Number ,Rank , DenseRank and Try to understand difference among them.
#Window_Functions

select *,
row_number() over(partition by fuel order by Name desc) as Row_No from car_dekho;

select *,
rank() over(partition by fuel order by Name desc) as Rank1 from car_dekho;

select *,
dense_rank() over(partition by fuel order by Name desc) as DenseRank from car_dekho;


-- Q16). Analyze the cumulative seats generated over Name.

select *,
sum(seats) over(order by Name desc) as Cumulative_seats from car_dekho;


-- MYSELF PREMSHANKAR SAINI




 

