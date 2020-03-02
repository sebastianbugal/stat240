source('access.r')

data = userTimeline(
  'TransLink',
  n = 3200,
  includeRts = FALSE,
  excludeReplies = TRUE)

save(file = 'translink.RData', data)