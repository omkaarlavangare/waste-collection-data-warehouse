
/* Task 13 GroupingSets*/
SELECT 
   s.Stationid AS station_id,
   t.TruckType AS truck_type,
   SUM(f.Wastecollected) AS total_waste
FROM 
   FactTrips f 
INNER JOIN DimStation s
   ON f.Stationid = s.Stationid
INNER JOIN DimTruck t
   ON f.Truckid = t.Truckid
GROUP BY 
GROUPING SETS (station_id, truck_type);
