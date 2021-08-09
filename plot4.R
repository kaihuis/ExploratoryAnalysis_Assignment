#####
# plot4
#####

library(tidyverse)
power <- read_delim("data/exdata_data_household_power_consumption/household_power_consumption.txt", 
                    delim = ";", escape_double = FALSE, trim_ws = TRUE, na = "?")
power %>%
      filter(Date %in% c("1/2/2007","2/2/2007")) %>%
      mutate(Time = as.character(Time)) -> power_temp
unite(power_temp, DateTime, Date:Time, sep = "/") -> power_new
power_new$DateTime <- strptime(power_new$DateTime, format = "%d/%m/%Y/%H:%M:%S")

par(mfrow=c(2,2), mar = c(4,4,2,2))

with(power_new,{
      plot(power_new$DateTime,power_new$Global_active_power,type="l", xlab="",ylab="Global Active Power")  
      plot(power_new$DateTime,power_new$Voltage, type="l",xlab="datetime",ylab="Voltage")
      plot(power_new$DateTime,power_new$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
      with(power_new,lines(DateTime,Sub_metering_1))
      with(power_new,lines(DateTime,Sub_metering_2,col="red"))
      with(power_new,lines(DateTime,Sub_metering_3,col="blue"))
      legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
      plot(power_new$DateTime,power_new$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})

png(filename = "plot4.png", width = 480, height = 480)
