# Question - 4: 
# Principal Components Analysis and Hierarchical Cluster Analysis

rm(list=ls())

# Activating funtions and packages
source("hcluster.r")
install.packages("matlab")
require(matlab, quietly = TRUE)
install.packages("car")
require(car)

######################################
############# Part a) ################
######################################

#Reading data and creating row names and columns
X <- as.matrix(read.table("winedata.csv", sep =",", header=F, row.names=1))
sam <- row.names(X)
varb <- colnames(X)

#c Creating a while loop to plot a sample of your own choice to compare the different spectra
LOOP <- 1
while(LOOP == 1) {
  cat("Please einter your Sample number to plot Or press 0 to exit:\n")
  varb_n <- scan("", what=double(0),nlines=1)
  varb_n <- as.vector(varb_n)
  if(length(varb_n) == 0 | varb_n == 0 | varb_n[1]>50)
  {
    cat("Skipping...\n")
    # Breaking loop if user enters 0
    LOOP <- 0
  } else {
    # Opening o graphic window 
    x11()
    # Creating plots for the sample of user's choice
     plot(X[varb_n, ], xlab = "Wavelength", ylab = "Spectroscopy", main = "Wine Spectroscopy Plot", xaxt="n")
    axis(1, at = seq(1, 251, by =50), labels = seq(250, 500, by=50))
  }
}
####################################
############ Part b) ###############
####################################

# PCA using Eigen

# Finding covariance
covariance <- cov(X)
# Calculating Eigen value fof the covariances of X
eigenvalue <- eigen(covariance)
# Creating loadings matrix L
L <- eigenvalue$vectors
# Creating scores matrix S
S <- X %*% L

# Creating Eiggen value matrices
eigenscores <- eigenvalue$values
eigenmatrix <- as.matrix(eigenscores)

# Creating a "for" loop to capture the Percentage Variance
for (i in 1:length(eigenscores)) {
  percentage_variance <- (eigenscores[i]/sum(eigenscores))*100
  cat(sprintf("\nThe percent variance captured for PC%g is %g",i,percentage_variance))
}

#######################################
############## Part c)  ###############
#######################################

# A "while" loop to capture user's desired sample choice and using them to generate plots


LOOP <- 1
while(LOOP == 1) {
  cat("Enter the column numbers to plot: \n")
  p_component1 <- scan("", what=double(0), nlines = 1)
  cat("Enter the column numbers to plot: \n")
  p_component_2 <- scan("", what=double(0), nlines = 1)
  p_component1 <- as.vector(p_component1)
  p_component2 <- as.vector(p_component_2)
  for (i in p_component1) {
    percentage_1 <- (eigenscores[i]/sum(eigenscores))*100
  }
  for (i in p_component2) {
    percentage_2 <- (eigenscores[i]/sum(eigenscores))*100
  }
  if (length(p_component1) == 0 | length(p_component2) == 0 | p_component1 == 0 | p_component2 == 0) {
    cat("Skipping..\n")
    LOOP <- 0
  } else {
    # Creating plot for chosen PCs by the user
    x11()
    plot(S[,p_component1], S[,p_component2], xlab = print(paste("PC:", p_component1,"=>",format(percentage_1, digits=3,format="f"),"%")), ylab = print(paste("PC:",p_component2,"=>",format(percentage_2,digits=3,format="f"),"%")), main = "PCA Score plot")
    
    ####################################
    ############# Part d) ##############
    ####################################
    
     # Dendogram for chosen PC by the user
     # Had to source "hcluster.r" function to generate dendogram
    hcluster(X, "Raw Data")
    hcluster(S[,1:p_component2], "PC Data")
  }
}
