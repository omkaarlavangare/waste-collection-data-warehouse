/* Create Dimensional Tables */
/*Create dimension table for date*/
CREATE TABLE IF NOT EXISTS MyDimDate (
   dateid SERIAL PRIMARY KEY,
   date DATE NOT NULL,
   year INT NOT NULL,
   quarter VARCHAR(2) NOT NULL,
   month INT NOT NULL,
   monthname VARCHAR(20) NOT NULL,
   day INT NOT NULL,
   weekdayname VARCHAR(20) NOT NULL
);

/*Create dimension table for waste*/
CREATE TABLE IF NOT EXISTS MyDimWaste (
   wasteid SERIAL PRIMARY KEY,
   wastetype VARCHAR(20) NOT NULL
);

/*Create dimension table for zone*/
CREATE TABLE IF NOT EXISTS MyDimZone (
   zoneid SERIAL PRIMARY KEY,
   zonename VARCHAR(10) NOT NULL,
   city VARCHAR(50) NOT NULL
);

/* Create a Fact Table */
CREATE TABLE IF NOT EXISTS MyFactTrips (
   tripnumber SERIAL PRIMARY KEY,
   wasteid INT NOT NULL REFERENCES MyDimWaste (wasteid),
   zoneid INT NOT NULL REFERENCES MyDimZone (zoneid),
   dateid INT NOT NULL REFERENCES MyDimDate (dateid),
   wasteintons NUMERIC(5, 2) NOT NULL
);
