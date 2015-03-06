plot4 <- function() {
    # read file
    hpc <- read.table('household_power_consumption.txt',
                      header=T,sep=';',na.strings='?')
    hpc2 <- hpc[(hpc$Date=='1/2/2007'|hpc$Date=='2/2/2007'),]
    hpc2$DateTime <-strptime(paste(hpc2$Date,hpc2$Time),
                             '%d/%m/%Y %H:%M:%S')
    rm(hpc)
    
    png('plot4.png',width=480,height=480,bg='darkgray')
    
    # plot 2 x 2 panels
    par(mfrow=c(2,2))
    
    # plot 1
    with(hpc2,
         plot(DateTime,Global_active_power,
              type='l',
              xlab='',
              ylab='Global Active Power'
         )
    )
    
    # plot 2
    with(hpc2,
         plot(DateTime,Voltage,
              type='l',
              xlab='datetime',
              ylab='Voltage'
         )
    )
    
    # plot 3
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
    legend('topright',bty='n',lty=1,col=c('black','red','blue'),
           legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
    
    # plot 4
    with(hpc2,
         plot(DateTime,Global_reactive_power,
              type='l',
              xlab='datetime'
         )
    )
    
    dev.off()
}