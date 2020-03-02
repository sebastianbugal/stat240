library(twitteR)
library(stringr)
library(tm)

load(file = 'translink.Rdata')
s = data[[8]]$text
s
s=gsub('/',' ',s)
s[[1]]
a=strsplit(s," |/")
a[1]

m = gregexpr(' \\d+ | \\d+ \\d+', s)
x = regmatches(s, m)
x = trimws(x[[1]])
x
translink = function(year, month, day, hour){
  load(file = 'translink.Rdata')
  curtweet=NULL
  if(year<0){
    print("Error 1: Invalid value for year")
    return(NULL)
  }
  if(month>12|| month<1){
    print("Error 2: Invalid value for month(values between 1 and 12)")
    return(NULL)
  }
  if(day>31 || day<0){
    print("Error 3: Invalid value for day(values between 0 and 31)")
    return(NULL)
  }
  if(hour>24 || hour<0){
    print("Error 4: Invalid value for hour(values between 0 and 24)")
    return(NULL)
  }
  for(i in data){
    splt_i=strsplit(as.character(i$created),"-| |:")
    if(as.integer(splt_i[[1]][1])==year & as.integer(splt_i[[1]][2])==month &as.integer(splt_i[[1]][3])==day & as.integer(splt_i[[1]][4])==hour){
      curtweet=i
    }
  }
  
}
translink(2020,02,23,16)
