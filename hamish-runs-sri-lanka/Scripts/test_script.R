library(jsonlite)



df <- jsonlite::read_json('activities_response.json')



df$start_date_local_date <- as.Date(df$start_date_local)
df <- df[df$start_date_local_date > as.Date("2018-02-19")]



