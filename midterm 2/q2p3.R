library(RSQLite)
library(DBI)
dbcon = dbConnect(SQLite(), dbname="stat240.sqlite")
names(dbReadTable(dbcon, "citiesP"))


query="SELECT  DISTINCT citiesP.province  FROM citiesP INNER JOIN citiesA ON citiesP.name=citiesA.name"
a=dbGetQuery(dbcon, query)
nrow(a)
#the above command has a doubled column province is displayed twice thats why error
