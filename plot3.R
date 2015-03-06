plot3 <- function() {
    # read file
    hpc <- read.table('household_power_consumption.txt',
                      header=T,sep=';',na.strings='?')
    # select out the 2 days of interest
    hpc2 <- hpc[(hpc$Date=='1/2/2007'|hpc$Date=='2/2/2007'),]
    # create a new column with datetime type POSIXct
    hpc2$DateTime <-strptime(paste(hpc2$Date,hpc2$Time),
                             '%d/%m/%Y %H:%M:%S')
    rm(hpc)
    
    # open a png file for graphics output
    png('plot3.png',width=480,height=480,bg='darkgray')
    
    # plot 3 time series
    with(hpc2,
         plot(DateTime,Sub_metering_1,
              type='l',
              col='black',
              xlab='',
              ylab='Energy sub-metering'
         )
    )
    with(hpc2,
         lines(DateTime,Sub_metering_2,
               col='red'
         )
    )
    with(hpc2,
         lines(DateTime,Sub_metering_3,
               col='blue'
         )
    )
    # add a legend
    legend('topright',lty=1,col=c('black','red','blue'),
           legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
      
    dev.off()
}