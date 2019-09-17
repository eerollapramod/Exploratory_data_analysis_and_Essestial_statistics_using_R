normplot <- function(bbb) {
# Get length of bbb
lx <- length(bbb$x)
# Work our values at 25% and 75%
q1 <- 0.25*lx
q3 <- 0.75*lx

dx <- bbb$x[q3]-bbb$x[q1]
dy <- bbb$y[q3]-bbb$y[q1]
slope <- dy/dx
centerx <- (bbb$x[q3]+bbb$x[q1])/2
centery <- (bbb$y[q3]+bbb$y[q1])/2
maxx <- max(bbb$x);
minx <- min(bbb$x);
maxy <- centery + slope*(maxx - centerx);
miny <- centery - slope*(centerx - minx);

mx <- as.vector(c(minx,maxx))
my <- as.vector(c(miny,maxy))

matplot(mx,my, type="l", lty=2, col=2, add=TRUE)
}