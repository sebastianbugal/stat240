library(RSQLite)
library(DBI)
dbcon = dbConnect(SQLite(), dbname="stat240.sqlite")
names(dbReadTable(dbcon, "citiesP"))


query="SELECT DISTINCT province,COUNT(name) FROM(SELECT * FROM citiesP INNER JOIN citiesA ON citiesP.name=citiesA.name) GROUP BY province"
a=dbGetQuery(dbcon, query)
a
nrow(a)
#the above command has a doubled column province is displayed twice thats why error
