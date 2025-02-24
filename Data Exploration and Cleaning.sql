-- check total row (92859)
SELECT count(*)
FROM `2023-tripdata-duperemoved`

-- check count duplicate ride_ids (90911)
SELECT count(distinct (ride_id))
FROM `2023-tripdata-duperemoved`

--  check duplicate ride_id(1947)
SELECT ride_id,
COUNT(ride_id)
from `2023-tripdata-duperemoved`
GROUP BY ride_id
HAVING COUNT(ride_id) > 1

-- Check count of duplicate rows (7527)
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `2023-tripdata-duperemoved`

-- adding rownum
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
ROW_NUMBER() OVER (PARTITION BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual) AS rownumber
FROM `2023-tripdata-combined`

SELECT * 
FROM 2023_tripdata_combined_cleaned2
WHERE ride_id IS NULL
OR rideable_type IS NULL
OR started_at IS NULL
OR ended_at IS NULL
OR start_station_name IS NULL
OR start_station_id IS NULL
OR end_station_name IS NULL
OR end_station_id IS NULL
OR start_lat IS NULL
OR start_lng IS NULL
OR end_lat IS NULL
OR end_lng IS NULL
OR member_casual IS NULL


SELECT started_at, ended_at
FROM `2023-tripdata-duperemoved`
LIMIT 10;

SELECT COUNT(*) AS longer_than_a_day
FROM 2023_tripdata_combined_cleaned2
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;   
  -- longer than a day - total rows = 0

SELECT COUNT(*) AS less_than_a_minute
FROM 2023_tripdata_combined_cleaned2
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1
  -- less than a minute = 91113
  
-- Determine ride_length
SELECT ride_id,started_at, ended_at,
TIMEDIFF(ended_at,started_at) AS ride_length
FROM 2023_tripdata_combined_cleaned2

-- Convert to minutes
SELECT ride_id,started_at,rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
MINUTE(TIMEDIFF(ended_at,started_at)) AS ride_length
FROM 2023_tripdata_combined_cleaned2


-- Determine day of week ride took place
SELECT ride_id,started_at,rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,ride_length,
DAYOFWEEK(started_at) AS day_of_the_week
FROM `2023_tripdata_w ride length converted to minutes`


-- Add Day of week column and filter more than 1 minute ride_length
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,ride_length,
DAYOFWEEK(started_at) AS day_of_the_week
FROM `data combination-removed duplicates plus ride length`

SELECT COUNT(*) AS less_than_a_minute
FROM 2023_tripdata_combined_cleaned2
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1
  -- less than a minute = 91113
  
  

  
  SELECT COUNT(*) AS longer_than_a_day
FROM `2023-tripdata-duperemoved`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;   
  -- longer than a day - total rows = 0
  
  SELECT COUNT(*) AS less_than_a_minute
FROM `2023-tripdata-duperemoved`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1
  


-- Ride Lenght Converted to minutes

SELECT ride_id,started_at,rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
MINUTE(TIMEDIFF(ended_at,started_at)) AS ride_length
FROM `2023-tripdata-duperemoved`


SELECT *
FROM `2023_tripdata_converted to minutes`
WHERE ride_length <= 1

SELECT *
FROM `2023_tripdata_converted to minutes`
WHERE ride_length <= 1
 -- less than a minute = 1720


SELECT COUNT(*) AS longer_than_a_day
FROM `2023_tripdata_converted to minutes`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;   
 -- more than a day is 0
 
 SELECT *
FROM `2023_tripdata_converted to minutes`
WHERE ride_length >= 1440
 -- more than a day is 0
 
 

SELECT ride_id,started_at,rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,ride_length,
DAYOFWEEK(started_at) AS day_of_the_week
FROM `2023_tripdata_converted to minutes`
WHERE ride_length >= 1
-- DAY OF THE WEEK MORE THAN 1 MINUTE