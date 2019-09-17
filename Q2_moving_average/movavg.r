movavg <- function(X,z) {
	for (i in 1:(length(X)-(z-1))) {
		a <- mean(X[i:(i+(z-1))])
		if (i==1) {
			Y <- a
		} else {
			Y <- c(Y,a) # builds list of values by appending latest mean to end of list
			            #   when i==1, a==15.9 & Y==15.9
			            #   when i==2, a==17.6 & Y==c(15.9, 17.6)
			            #   when i==3, a==18.4 & Y==c(15.9, 17.6, 18.4)
			            # after i==2, Y is always a vector and after every iteration is replaced by a new vector
			            # with two elements: the previous vector and the new mean
			            # c() function flattens these into a one-dimensional vector
		}
	}
	return(as.matrix(Y))
}
