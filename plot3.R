#####
# Plot 3
#####

library(tidyverse)
power <- read_delim("data/exdata_data_household_power_consumption/household_power_consumption.txt", 
                    delim = ";", escape_double = FALSE, trim_ws = TRUE, na = "?")
power %>%
      filter(Date %in% c("1/2/2007","2/2/2007")) %>%
      mutate(Time = as.character(Time)) -> power_temp
unite(power_temp, DateTime, Date:Time, sep = "/") -> power_new
power_new$DateTime <- strptime(power_new$DateTime, format = "%d/%m/%Y/%H:%M:%S")

plot(power_new$DateTime,power_new$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power_new,lines(DateTime,as.numeric(as.character(Sub_metering_1))))
with(power_new,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(power_new,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

png(filename = "plot3.png", width = 480, height = 480)
