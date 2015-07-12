## get data frame for household power consumption measurements on Feb 1 & 2, 2007

getData <- function() {

  if(!exists('hpcon.sub')) { ## if data is not already loaded in environment
    message('household power consumpton data not found: reading data...')
    filePath <- "data/household_power_consumption.txt"
    hpcon.all <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE)
    hpcon.sub <<- hpcon.all[hpcon.all$Date %in% c("1/2/2007","2/2/2007") ,]
  }

  subsettedData <- c('datetime','globalActivePower','globalReactivePower','voltage','subMetering1','subMetering2','subMetering3')
  if(!exists(subsettedData)) {
    message('data subsets not found: parsing data...')
    datetime <<- strptime(paste(hpcon.sub$Date, hpcon.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    globalActivePower <<- as.numeric(hpcon.sub$Global_active_power)
    globalReactivePower <<- as.numeric(hpcon.sub$Global_reactive_power)
    voltage <<- as.numeric(hpcon.sub$Voltage)
    subMetering1 <<- as.numeric(hpcon.sub$Sub_metering_1)
    subMetering2 <<- as.numeric(hpcon.sub$Sub_metering_2)
    subMetering3 <<- as.numeric(hpcon.sub$Sub_metering_3)
    message('data setup complete')
  }

}
