library(twitteR)
library(stringr)
library(tm)

load(file = 'translink.Rdata')
s = data[[2]]$created
s
s=gsub('/',' ',s)
s[[1]]

str_detect(s,"clear",negate=TRUE)
a=strsplit(s," |/")
a[[1]][1]

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
    if(as.integer(splt_i[[1]][1])==year & 
       as.integer(splt_i[[1]][2])==month &
       as.integer(splt_i[[1]][3])==day & 
       as.integer(splt_i[[1]][4])==hour){
        curtweet=c(curtweet,i)
    }
    
  }
  for(i in curtweet){
    i$text=gsub('/',' ',i$text)
    if(str_detect(i$text,"detour") & 
       str_detect(i$text,"clear",negate=TRUE)& str_detect(i$text," over",negate=TRUE)){
      print("detour")
      print(i$text)
    }
    else{
      print("detour cleared")
      print(i$text)
    }
  }

}
translink(2020,02,01,21)#over check
translink(2020,02,02,20)#cloverdale
translink(2020,01,26,03)#3 at a time
