# Question-3: Multivariate Regresssion

rm(list=ls())
source("auto2.r")
source("rescale.r")



##################################################
################### Part - i #####################
##################################################

# Reading data and creating rows and column names from two datasets

train <- as.matrix(read.table("TRAINING_DATA.csv", sep=",", header = T, row.names=1))
test <- as.matrix(read.table("TESTING_DATA.csv", sep=",", header = T, row.names=1))

train.rows <- row.names(train)
train.cols <- colnames(train)                   

test.rows <- row.names(test)
test.cols <- colnames(test)

# Seperating  first columns from the rest of the columns 
ctrain <- as.matrix(train[ ,1])
ctest <- test[ ,1]
# Remaining columns
xtrain <- train[ ,-1]
xtest <- test[ ,-1]

#####################################################
##################### Part - ii #####################
#####################################################

# Using auto2 function to create below variables
a2xtrain <- auto2(xtrain, 0,0)
a2ctrain <- auto2(ctrain, 0,0)
a2xtest <- auto2(xtest , a2xtrain$meanx, a2xtrain$stdx)

######################################################
##################### Part - c #######################
######################################################

# Multivariate regression using pls.regression
######## "plsgenomics" package needed to use pls.regression
source("pls.regression.R")
# for loop to get predicted values
for (i in 1:10) {
  M_V_R <- pls.regression(a2xtrain$ax, a2ctrain$ax, Xtest = a2xtest, ncomp = i, unit.weights = T)
  # Rescaling to restore the concentration uits
  predicted_values <- rescale(as.matrix(M_V_R$Ypred), as.matrix(a2ctrain$meanx), as.matrix(a2ctrain$stdx))
  # RMSEP function to calculate RMSEP valus
  RMSEP <- function(X1,X2) {
    RMSEP <- sqrt(sum((X1-X2)^2)/length(X1))
    return(RMSEP)
  }
  rmsep1 <- RMSEP(ctest, predicted_values)
  print(paste(" RMSEP for LV", i, "is: => ", rmsep1))
  }

# creating barplot for the lowest LV2
# x11()
# isolating the LV with least value
M_V_R_2 <- pls.regression(a2xtrain$ax, a2ctrain$ax, Xtest = a2xtest, ncomp = 2, unit.weights = T)
# Rescaling the predicted values.
predicted_values2 <- rescale(as.matrix(M_V_R_2$Ypred), as.matrix(a2ctrain$meanx), as.matrix(a2ctrain$stdx))
# Barplot of pls model using LV2(lowest)
Barplot_LV <- barplot(M_V_R_2$P[,2], M_V_R_2$Q[,2], xlab = " 30 Variables", ylab = "Influence", col="green",main = "LV2 model Barplot" )
# Adding relevent text to the plot
text(Barplot_LV, M_V_R_2$P[,2], labels=1:30)

