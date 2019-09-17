hcluster <- function(X,aaa) {
	cat("\n HCLUSTER plots the dendrograms allowing the\n")
	cat("\n user to vary the distange and linkage methods.\n\n")
	cat("Distance methods\n")
	cat("1 = Euclidean; 2 = Manhattan; 3 = Maximum; 4 = Canberra; 5 = Binary; 6 = Minkowski\n\n")
	cat("Linkage methods\n")
	cat("1 = Single; 2 = Complete; 3 = Average; 4 = Centroid; 5 = Ward; 6 = Mcquitty; 7 = Median\n\n")
	LOOP=1
	while (LOOP==1) {
		cat("\nEnter the number corresponding to the distance and linkage methods..")
		cat("\nEnter number for DISTANCE method (e.g. 1 for Euclidean): ")
		dm <- scan("", what=integer(0), nlines=1)
		if (dm==1) {
			dmthd <- "euclidean"
		} else if (dm==2) {
			dmthd <- "manhattan"
		} else if (dm==3) {
			dmthd <- "maximum"
		} else if (dm==4) {
			dmthd <- "canberra"
		} else if (dm==5) {
			dmthd <- "binary"
		} else if (dm==6) {
			dmthd <- "minkowski"
		} else if (dm < 1 | dm > 6) {
			cat("\nDefaulting to Euclidean..\n")
			dmthd <- "euclidean"
		} else {
			cat("\nDefaulting to Euclidean..\n")
			dmthd <- "euclidean"
		}
		cat("\nEnter number for LINKAGE method (e.g. 1 for Single): ")
		lm <- scan("", what=integer(0), nlines=1)
		
		if (lm==1) {
			lmthd <- "single"
		} else if (lm==2) {
			lmthd <- "complete"
		} else if (lm==3) {
			lmthd <- "average"
		} else if (lm==4) {
			lmthd <- "centroid"
		} else if (lm==5) {
			lmthd <- "ward"
		} else if (lm==6) {
			lmthd <- "mcquitty"
		} else if (lm==7) {
			lmthd <- "median"
		} else if (lm < 1 | lm > 7) {
			cat("\nDefaulting to Single..\n")
			lmthd <- "single"
		} else {
			cat("\nDefaulting to Single..\n")
			lmthd <- "single"
		}
			
	
		#Calculate distance method
		d <- dist(X, method=dmthd)
		# Calculate the linkage
		dendrogram <- hclust(d, method = lmthd, members=NULL)
		# Plot dendrogram
		x11()
		plot(dendrogram, main=c("HCA: ", dmthd, lmthd, aaa))
		cat(c("HCA for ", dmthd, " distance and ", lmthd, " linkage for ", aaa, " data."))
		cat("\nAgain? (y/n): ")
		again <- scan("", what=character(0), nlines=1)
		if (again!="y") {
			LOOP=0
			} else {
			LOOP=1
			}
		}
	return(0)
	}

	
