library(RSQLite)
library(DBI)
dbcon = dbConnect(SQLite(), dbname="stat240.sqlite")
names(dbReadTable(dbcon, "citiesA"))
test_query="SELECT * FROM citiesP"
query="SELECT DISTINCT province,type FROM citiesP"
a=dbGetQuery(dbcon, query)
nrow(a)
#test=dbGetQuery(dbcon,test_query)
#test
