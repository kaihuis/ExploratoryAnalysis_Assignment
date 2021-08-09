#####
# plot2
#####

library(tidyverse)
power <- read_delim("data/exdata_data_household_power_consumption/household_power_consumption.txt", 
                    delim = ";", escape_double = FALSE, trim_ws = TRUE, na = "?")
power %>%
      filter(Date %in% c("1/2/2007","2/2/2007")) %>%
      mutate(Time = as.character(Time)) -> power_temp
unite(power_temp, DateTime, Date:Time, sep = "/") -> power_new
power_new$DateTime <- strptime(power_new$DateTime, format = "%d/%m/%Y/%H:%M:%S")
plot(power_new$DateTime,power_new$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
png(filename = "plot2.png", width = 480, height = 480)
