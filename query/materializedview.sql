/* Task 16 Materialized View query*/
CREATE MATERIALIZED VIEW max_waste_stats AS (
SELECT  
   s.city AS city,
   s.Stationid AS station_id,
   t.TruckType AS truck_type,
   max(f.Wastecollected) AS max_waste 
FROM 
   FactTrips f 
INNER JOIN DimStation s
   ON f.Stationid = s.Stationid
INNER JOIN DimTruck t
   ON f.Truckid = t.Truckid
GROUP BY city, station_id, truck_type
);
