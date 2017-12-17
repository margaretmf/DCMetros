
# set working directory
# setwd("~.../Data")

# library for reading json files
library("rjson")

# json data
metro_stations_entrances_data <- fromJSON(file = "metro_stations_entrances.json")

# get name, lat, and lon
name <- c(); line <- c(); latitude <- c(); longitude <- c()
for (i in 1:length(metro_stations_entrances_data$features)) {
  name[i] <- metro_stations_entrances_data$features[i][[1]]$properties$NAME
  line[i] <- metro_stations_entrances_data$features[i][[1]]$properties$LINE
  latitude[i] <- metro_stations_entrances_data$features[i][[1]]$geometry$coordinates[2]
  longitude[i] <- metro_stations_entrances_data$features[i][[1]]$geometry$coordinates[1]
}

# save as dataframe
metro_stations_entrances_df <- data.frame(name,line,latitude,longitude)
names(metro_stations_entrances_df) <- c("Entrance Name","Line","Lat","Lon")

# set working directory
# setwd("~.../Data")

# write out
write.csv(metro_stations_entrances_df,"metro_stations_entrances_data.csv")
