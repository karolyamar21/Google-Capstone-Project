SELECT *
FROM `2023_tripdata_for analysis`

-- Number of Ride per Member Type
SELECT member_casual as member_type, COUNT(*) as count
FROM `2023_tripdata_for analysis`
GROUP BY member_casual

----- Member 44883
----- Casual 16036


-- Ride per bike type mer member type
SELECT member_casual, rideable_type,
COUNT(*) as trips_ridetype_membertype
FROM `2023_tripdata_for analysis`
GROUP BY member_casual, rideable_type

-- member electric_bike', '24784'
-- member classic_bike 19864'
-- casual electric_bike', '9126'
-- casual classic_bike', '6434'
-- casual docked_bike', '476'
-- member docked_bike', '235'


-- Average ride lenth user type
SELECT member_casual,
AVG(ride_length) AS avg_ridelength
FROM `2023_tripdata_for analysis`
GROUP BY member_casual

-- member 12.0368
-- casual 13.2588

-- popular day of the week per rider type Version 1
SELECT count(day_of_the_week) as count, day_of_the_week, member_casual
FROM `2023_tripdata_for analysis`
GROUP BY day_of_the_week, member_casual
ORDER BY count

-- popular day of the week per rider type Version 2
SELECT day_of_the_week, member_casual,
COUNT(day_of_the_week) as count
FROM `2023_tripdata_for analysis`
GROUP BY day_of_the_week, member_casual
ORDER BY count


-- number of frequency of rides per month per member type
SELECT count(MONTH(started_at)) as countmonth, MONTH(started_at), member_casual
FROM `2023_tripdata_for analysis`
GROUP BY MONTH(started_at), member_casual
ORDER BY countmonth DESC




SELECT MONTH(started_at), member_casual,
count(MONTH(started_at)) as countmonth
FROM `2023_tripdata_for analysis`
GROUP BY MONTH(started_at), member_casual
ORDER BY countmonth DESC


-- MOST POPULAR sTATION
SELECT start_station_name, member_casual,
count(start_station_name) as count
FROM `2023_tripdata_for analysis`
GROUP BY start_station_name, member_casual
ORDER BY count DESC

-- MOST POPULAR sTATION mEMBER
SELECT start_station_name, member_casual,
count(start_station_name) as count
FROM `2023_tripdata_for analysis`
WHERE member_casual = 'member'
GROUP BY start_station_name, member_casual
ORDER BY count DESC
LIMIT 2
'Desplaines St & Kinzie St', 'member', '579'


-- MOST POPULAR sTATION Casual
SELECT start_station_name, member_casual,
count(start_station_name) as count
FROM `2023_tripdata_for analysis`
WHERE member_casual = 'casual'
GROUP BY start_station_name, member_casual
ORDER BY count DESC
LIMIT 2
-- Streeter Dr & Grand Ave', 'casual', '291'



-- Most Popular Route
SELECT end_station_name, start_station_name, member_casual,
COUNT(*) AS frequency
FROM `2023_tripdata_for analysis`
GROUP BY end_station_name, start_station_name, member_casual
ORDER BY frequency DESC
