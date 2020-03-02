load(file = 'translink.data')
s = data[[1]]$text
m = gregexpr(' \\d+ ', s)
x = regmatches(s, m)
x = trimws(x[[1]])