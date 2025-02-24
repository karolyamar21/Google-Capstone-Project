-- check total row (103826)
SELECT count(*)
FROM `2023-tripdata-combined_test3`

-- check count duplicate ride_ids (96299)
SELECT count(distinct (ride_id))
FROM `2023-tripdata-combined_test3`

--  check duplicate ride_ids
SELECT ride_id,
COUNT(ride_id)
from `2023-tripdata-combined_test3`
GROUP BY ride_id
HAVING COUNT(ride_id) > 1

-- Check count of duplicate rows (7527)
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `2023-tripdata-combined_test3`

-- adding rownum
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
ROW_NUMBER() OVER (PARTITION BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual) AS rownumber
FROM `2023-tripdata-combined_test3`

-- Delete duplicates using Group by(5411)
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
COUNT(*) AS CNT
FROM `2023-tripdata-combined_test3`
GROUP BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
HAVING COUNT(*) > 1


-- Delete duplicates using Group by version 2 (92859)
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
COUNT(*) AS CNT
FROM `2023-tripdata-combined`
GROUP BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
HAVING COUNT(*) = 1


-- Delete duplicates using Group by version 3
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
COUNT(*) AS CNT
FROM `2023-tripdata-combined_test4`
GROUP BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
HAVING COUNT(*) = 1


CREATE TABLE `2023-tripdata-Duperemoved` 
AS
(
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual,
COUNT(*) AS CNT
FROM `2023-tripdata-combined_test4`
GROUP BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
HAVING COUNT(*) = 1
)