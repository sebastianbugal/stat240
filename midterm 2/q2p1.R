library(RSQLite)
library(DBI)
dbcon = dbConnect(SQLite(), dbname="stat240.sqlite")
names(dbReadTable(dbcon, "citiesA"))
query = "PRAGMA table_info(citiesA)"
countnu="SELECT COUNT() FROM citiesA"
a=dbGetQuery(dbcon, query)
b=dbGetQuery(dbcon, countnu)
a[2:3]
b
