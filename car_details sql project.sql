create database car_info;
use car_info;

-- to read the file--
select*from car_details;

-- Total cars count--
  -- first we remove the duplicates --
SET SQL_SAFE_UPDATES = 0;
WITH Duplicates AS (
  SELECT Name, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats
  FROM car_details
  GROUP BY Name, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats
  HAVING COUNT(*) > 1
)
DELETE FROM car_details
WHERE (Name, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats) IN (
  SELECT * FROM Duplicates
);
select*from car_details;
select count(*) from car_details;

-- The manager asked the employee how many cars will be availble in year 2023 --
select count(*) from car_details where year=2023;

-- The manager asked the employee how many cars will be available in year 2021,2022,2020 --
select count(*)as car_counts from car_details where year in (2020,2021,2022)
group by year;

-- The car count by yearwise --
select count(*)as car_count,year from car_details group by year 
order by car_count;

-- How many diesel cars available in 2020 --
select count(*) as car_count, fuel,year from car_details 
where fuel='Diesel' and year=2020 ; #16

-- How many petrol cars available in 2020 --
select count(*) as car_count,fuel,year from car_details
where fuel='Petrol' and year=2020; #35

-- The manager told the employee to give a print all the fuel cars come by all year --
select year,count(*)as petrol_cars_count from car_details where fuel ='Petrol' group by year;
select year,count(*)as petrol_cars_count from car_details where fuel ='Diesel' group by year;
select year,count(*)as petrol_cars_count from car_details where fuel ='CNG' group by year;

-- Which year has more than 100 cars --
Select year , count(*) as car_counts from car_details group by year having car_counts>100;

-- All car counts between year 2015 to 2023 --
select count(*) from car_details where year between 2015 and 2023;
select * from car_details where year between 2015 and 2023;

-- FInd the highest selling price car --
select max(selling_price) from car_details ;
select min(selling_price) from car_details;
select Name, max(selling_price) from car_details group by Name ;
select Name,min(selling_price) from car_details group by Name ;

-- TO find the cars less than 6000 km driven and petrol engine car and individual seller --
select km_driven,fuel,seller_type from car_details where km_Driven<6000 and fuel="petrol" and seller_type = "Individual";

-- To find the cars greater than 10000 km driven --
select * from car_details where km_driven>10000;






