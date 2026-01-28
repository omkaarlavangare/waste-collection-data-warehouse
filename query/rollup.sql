/* Task 14 RollUp query*/
SELECT 
   d.Year AS year,
   s.City AS city,
   s.Stationid AS station_id,
   SUM(f.Wastecollected) AS total_waste
FROM 
   FactTrips f 
INNER JOIN DimDate d 
   ON f.Dateid = d.dateid
INNER JOIN DimStation s 
   ON f.Stationid = s.Stationid
GROUP BY 
ROLLUP (year, city, station_id);
