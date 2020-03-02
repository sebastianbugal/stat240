library(RSQLite)
library(DBI)
dbcon = dbConnect(SQLite(), dbname="stat240.sqlite")
names(dbReadTable(dbcon, "citiesP"))


query="SELECT  DISTINCT rank2016, rank2011,name  FROM citiesP "
a=dbGetQuery(dbcon, query)
nrow(a)
a
plot(a$rank2016,a$rank2011,ylab='Ranking of 2011', xlab= 'Ranking of 2016',pch=1, cex=0.5,)
#the above command has a doubled column province is displayed twice thats why erro