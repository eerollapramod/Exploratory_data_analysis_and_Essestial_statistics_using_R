histplot <- function(x,sam) {
nn <- ceiling(sqrt(length(x)))
BW <- (max(x)-min(x))/nn
xxx <- hist(x, freq = TRUE, main=sam)
N <- xxx$counts # Get the freq distribution
MIDS <- xxx$mids # Get the centres
Xaxis <- seq(min(x), max(x), by = 0.01)
MU <- mean(x)
SIGMA <- sd(x)
y <- exp(-0.5 * ((Xaxis - MU)/SIGMA)^2) / (sqrt(2*pi) * SIGMA)
matplot(Xaxis, (y * BW * sum(N)), type="l", col = 2, lty = 1, lwd = 1, add = TRUE)
abline(a=NULL,b=NULL, h=NULL, v=MU, col=3, lty=2, lwd=1) #  Add mean
abline(a=NULL,b=NULL, h=NULL, v=MU-SIGMA, col=4, lty=2, lwd=1) # Add mean-stdev
abline(a=NULL,b=NULL, h=NULL, v=MU+SIGMA, col=4, lty=2, lwd=1) # Add mean+stdev
}
