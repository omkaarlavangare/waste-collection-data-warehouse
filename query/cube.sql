/* Task 15 cube query*/
SELECT 
   d.Year AS year,
   s.City AS city,
   s.Stationid AS station_id,
   AVG(f.Wastecollected) AS average_waste
FROM 
   FactTrips f 
INNER JOIN DimDate d 
   ON f.Dateid = d.dateid
INNER JOIN DimStation s 
   ON f.Stationid = s.Stationid
GROUP BY 
CUBE (year, city, station_id);
