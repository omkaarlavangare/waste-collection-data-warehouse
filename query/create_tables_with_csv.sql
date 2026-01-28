
/* Create Dimensional Tables */
/* Create Dimensional Table for Date data */
CREATE TABLE IF NOT EXISTS DimDate (
   dateid SERIAL PRIMARY KEY,
   date DATE NOT NULL,
   year INT NOT NULL,
   quarter INT NOT NULL,
   quartername VARCHAR(5) NOT NULL,
   month INT NOT NULL,
   monthname VARCHAR(15) NOT NULL,
   day INT NOT NULL,
   weekday INT NOT NULL,
   weekdayname VARCHAR(10) NOT NULL
);
/* Select query to read date data uploaded via csv in pgAdmin 4*/
SELECT * FROM DimDate LIMIT 5;

/* Create Dimensional Table for Truck data */
CREATE TABLE IF NOT EXISTS DimTruck (
   truckid INT NOT NULL PRIMARY KEY,
   trucktype VARCHAR(20) NOT NULL
);
/* Select query to read truck data uploaded via csv in pgAdmin 4*/
SELECT * FROM DimTruck LIMIT 5;

/* Create Dimensional Table for Station data */
CREATE TABLE IF NOT EXISTS DimStation (
   stationid INT NOT NULL PRIMARY KEY,
   city VARCHAR(20) NOT NULL
);
/* Select query to read station data uploaded via csv in pgAdmin 4*/
SELECT * FROM DimStation LIMIT 5;

/* Create Fact Table */
CREATE TABLE IF NOT EXISTS FactTrips (
   tripid INT NOT NULL PRIMARY KEY,
   dateid INT NOT NULL REFERENCES DimDate (dateid),
   stationid INT NOT NULL REFERENCES DimStation (stationid),
   truckid INT NOT NULL REFERENCES DimTruck (truckid),
   wastecollected NUMERIC(5, 2) NOT NULL
);
/* Select query to read fact table data uploaded via csv in pgAdmin 4*/
SELECT * FROM FactTrips LIMIT 5;
