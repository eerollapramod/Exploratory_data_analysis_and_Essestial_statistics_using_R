auto2 <- function(X,a,b) {
	# a would be mean and b would be std dev
  ndim <- dim(X)
	m = ndim[1]
	if (a==0 && b == 0) {
	   meanx <- apply(X,2,mean)
	   stdx <- apply(X,2,sd)
	   ONE <- matrix(1,m,1)
	   ax <- (X - (ONE %*% meanx))/(ONE %*% stdx)
	   return(list(ax=ax, meanx=meanx, stdx=stdx))
	   } else {
	   ONE <- matrix(1,m,1)
	   ax <- (X - (ONE %*% a))/(ONE %*% b)
	   return(ax)
	   }
}

