# Question - 2: Moving Average 

rm(list=ls())
# Installing and activating matlab
install.packages("matlab")
require(matlab)
# Source movavg function from current working directory
source("movavg.r")
# Reading data
A <- read.table("vaccine.txt",header = FALSE)

###############################################
################ Step - a #####################
###############################################

# Plotting the Raw Data using matplot
x11()
matplot(A[,1], A[,2], type="l", xlab = "Years", ylab = "Incidence (1000s)", main = "Incidence over time", col = 1)
# Using which function to create threshold
A2 <- which(A[,2]>90)
A3 <- A[,2]>50
# Overlaying  identified years on plot using 'text()' function
text(A[,1][A3],A[,2][A3],(1950:1999)[A3])

################################################
################# step - b #####################
################################################

# Performing moving average
wsize <- 11
movingavg <- movavg(A[,2], wsize)
window_half <- (wsize/2)
par(new = TRUE)
# Overlaying moving average on Raw data plot
matplot(A[(window_half):(length(A[,1])-window_half),1], movingavg, type = "l", xlab = "Years", ylab = "Incidence (1000s)", col= 2, xlim= c(1950,1999),ylim = c(8,204))
# Adding legend
legend(1950,195, legend = c("Raw Data","Moving Average"), col = c("black","red"),lty = 1, cex = 0.7)

      