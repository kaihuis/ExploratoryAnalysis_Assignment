#####
# Exploratory Analysis  - peer-review assignment
#####
library(readr)
power <- read_delim("data/exdata_data_household_power_consumption/household_power_consumption.txt", 
                                           delim = ";", escape_double = FALSE, trim_ws = TRUE, na = "?")

#str(consumption)
#dim(consumption)
head(consumption)

power %>%
      filter(Date %in% c("1/2/2007","2/2/2007")) -> power_new
hist(as.numeric(as.character(power_new$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
title(main="Global Active Power")
png(filename = "plot1.png", width = 480, height = 480)
