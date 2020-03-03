library(twitteR)
library(stringr)
library(tm)

load(file = 'translink.RData')
s = data[[2]]$text
s=tolower(s)
s
s=gsub('/',' ',s)
s[[1]]


str_detect(s,"clear",negate=TRUE)
a=strsplit(s," |/")
a[[1]][1]

m = gregexpr(' \\d+ | \\d+ \\d+', s)
m
x = regmatches(s, m)
x = trimws(x[[1]])
x
as.integer(x)[2]

translink = function(year, month, day, hour){
  load(file = 'translink.Rdata')
  curtweet=NULL
  stop=NULL
  start=NULL
  returning=NULL
  
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
    
    i$text=tolower(i$text)
    i$text=gsub('/',' ',i$text)
    
    if(str_detect(i$text,"detour") & 
       str_detect(i$text,"clear",negate=TRUE)& 
       str_detect(i$text," over",negate=TRUE)){
      
      print("detour")
      
      i_splt_regroute=strsplit(i$text, "regular route")
      m = gregexpr(' \\d+ | \\d+ \\d+', i_splt_regroute[[1]][1])
      x = regmatches(i_splt_regroute[[1]][1], m)
      x = trimws(x[[1]])
      start=c(start,as.integer(x))
      print(x)
      print(i$text)
    }
    
    else{
      print("detour cleared")
      
      i_splt_regroute=strsplit(i$text, "regular route")
      m = gregexpr(' \\d+ | \\d+ \\d+', i_splt_regroute[[1]][1])
      x = regmatches(i_splt_regroute[[1]][1], m)
      x = trimws(x[[1]])
      stop=c(stop,as.integer(x))
      print(x)
      print(i$text)
    }
  }
  
  returning= as.data.frame(start,stop)
  return(returning)

}
A=translink(2020,02,01,21)#over check
B=translink(2020,02,02,20)#cloverdale
C=translink(2020,01,26,03)#3 at a time
C$stop
translink(2020,02,23,15)#multiple nums
