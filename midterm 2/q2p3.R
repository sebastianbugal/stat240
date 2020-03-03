library(RSQLite)
library(DBI)
dbcon = dbConnect(SQLite(), dbname="stat240.sqlite")
names(dbReadTable(dbcon, "citiesP"))
query1="SELECT citiesp.province, citiesp.name FROM citiesP INNER JOIN citiesA ON citiesP.name=citiesA.name"
a=dbGetQuery(dbcon,query1)
data=table(a$province)
data
barplot(data)
#the above command has a doubled column province is displayed twice thats why error
