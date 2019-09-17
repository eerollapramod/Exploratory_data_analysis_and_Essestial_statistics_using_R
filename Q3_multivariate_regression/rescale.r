rescale <- function(X,a,b) {
  # Rescale X to the original units
  # given a and b. Here a is mean and b is std dev
  
  ndim <- dim(X)
	m = ndim[1]

	ONE <- matrix(1,m,1)
#	print(ONE)
#    rx = (x.*stds(ones(m,1),:))+means(ones(m,1),:);
	Y <- (X * (ONE %*% b)) + (ONE %*% a)
#  print(ONE %*% b)
#  print(ONE %*% a)
  return(Y)
}
