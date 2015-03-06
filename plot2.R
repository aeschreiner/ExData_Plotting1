plot2 <- function() {
    # read file
    hpc <- read.table('household_power_consumption.txt',
                      header=T,sep=';',na.strings='?')
    # select the 2 days of interest
    hpc2 <- hpc[(hpc$Date=='1/2/2007'|hpc$Date=='2/2/2007'),]
    # create a new column with date/time type POSIXct
    hpc2$DateTime <-strptime(paste(hpc2$Date,hpc2$Time),
                             '%d/%m/%Y %H:%M:%S')
    rm(hpc)
    
    # open a png file for graphics output
    png('plot2.png',width=480,height=480,bg='darkgray')
    
    # plot a time series
    with(hpc2,
         plot(DateTime,Global_active_power,
              type='l',
              xlab='',
              ylab='Global Active Power (kolowatts)'
              )
    )
    dev.off()
}