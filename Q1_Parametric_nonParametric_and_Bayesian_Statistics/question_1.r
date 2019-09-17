# Question 1 : Parametric, non-parametric and Bayesian Statistics
rm(list=ls())
install.packages("matlab")
require(matlab)

# Importing Data using read.table()
X<-as.matrix(read.table("metabolites.csv", sep = "," , row.names = 1))
sam<-row.names(X)
varb<-colnames(X)

###################################
######### Part - a ################
###################################

# Activating "histplot.r" function
source("histplot.r")

# Creating histogram using histplot function prior to normalising data
# Used "par" to generate subplots
#x11()
par(mfrow = c(2,2))
histplot(X[1,], "Cpeptide")
histplot(X[2,], "Glucose")
histplot(X[3,], "Insulin")
histplot(X[4,], "Lpa")

# QQ plots for Samples prior to normalising 

# Activation 'normplot.r' function
source("normplot.r")

# qq plot for Cpeptide
#x11()
par(mfrow = c(2,2))
# Used ppoint function to generate probability points
ppoints_1 <- ppoints(X[1, ])
Theo.quantile_1<- qnorm(ppoints_1)
qqplot_1<- qqplot(Theo.quantile_1, X[1, ], main = "Cpeptide", xlab = "Theoretical Quantiles", ylab = "Data Quantiles")
normplot(qqplot_1)

# qqplot for Glucose
ppoints_2 <- ppoints(X[2, ])
Theo.quantile_2<- qnorm(ppoints_2)
qqplot_2<- qqplot(Theo.quantile_2, X[2, ], main = "Glucose", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_2)

# qq plot for Insulin
ppoints_3 <- ppoints(X[3,])
Theo.quantile_3<- qnorm(ppoints_3)
qqplot_3<- qqplot(Theo.quantile_3, X[3, ], main = "Insulin", xlab = "Theoretical Quantiles", ylab = "Data Quantiles")
normplot(qqplot_3)

# qq plot for Lpa
ppoints_4 <- ppoints(X[4,])
Theo.quantile_4<- qnorm(ppoints_4)
qqplot_4<- qqplot(Theo.quantile_4,X[4, ], main = "Lpa", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_4)



###################################
######### Part - b ################
###################################

# Identifying outliers using 'Boxplot' from metabolites to take further action
# Identifying  outliers of Cpeptide
outliers.Cpeptide <- boxplot.stats(X[1, ])$out
print(outliers.Cpeptide)
# Identifying  outliers of Glucose
outliers.Glucose <- boxplot.stats(X[2, ])$out
print(outliers.Glucose)
# Identifying  outliers of Insulin
outliers.Insulin <- boxplot.stats(X[3, ])$out
print(outliers.Insulin)
# Identifying  outliers of Lpa
outliers.Lpa <- boxplot.stats(X[4, ])$out
print(outliers.Lpa)



# Removing Glucose outliers as the values are biologically not possible
# Glucose transformation is not needed as the data is distributed normally after removing outliers
sorted_glucose <- as.matrix(sort(X[2,], decreasing=FALSE))
new_glucose <- as.matrix(sorted_glucose[-c(200:195),])


###################################
######### Part - c ################
###################################

# log10 transformation of data
log_x <- log10(X)

# Finding where Cpeptide is less than insulin
sorted_Cpeptide <- which(X[1,]<X[3,], arr.ind = TRUE)
# Removing the Cpeptide values less than insulin
new_Cpeptide <- as.matrix(X[1, -c(79, 91, 112)]) 

# Transforming Cpepnew to normalise 
log_Cpep <- log10(new_Cpeptide)
sqrt_Cpep <- sqrt(new_Cpeptide)

# Histograms for Transformed data
#x11()
par(mfrow=c(3,2))
histplot(log_Cpep[,1], "Log10 Normalised Cpeptide data")
histplot(sqrt_Cpep[,1], "Square root Normalised Cpeptide data")
histplot(new_glucose[,1], "Adjusted Glucose data")
histplot(log_x[3,], "Log 10 Normalised Insulin data")
histplot(log_x[4,], "Log 10 Normalised Lp(a) data")
histplot((sqrt(X[4,])), "Square root Normalised Lp(a) data")


# qq plots after normalising data and removing outliers from glucose

#x11()
par(mfrow=c(3,2))
# qq plot for log10 normalised "Cpeptide".
ppoints_5 <- ppoints(log_Cpep[,1])
Theo.quantile_5<- qnorm(ppoints_5)
qqplot_5<- qqplot(Theo.quantile_5, log_Cpep, main = " Log10 normalised Cpeptide", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_5)
# qq plot for square root normallised Cpeptide
ppoints_6 <- ppoints(sqrt_Cpep[,1])
Theo.quantile_6<- qnorm(ppoints_6)
qqplot_6<- qqplot(Theo.quantile_6, sqrt_Cpep, main = " Square root normalised Cpeptide", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_6)
# qq plot for Adjusted Glucose
ppoints_7 <- ppoints(new_glucose[,1])
Theo.quantile_7<- qnorm(ppoints_7)
qqplot_7<- qqplot(Theo.quantile_7, new_glucose , main = " Adjusted Glucose", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_7)
# qq plot for Log10 normalised Insulin
ppoints_8 <- ppoints(log_x[3,])
Theo.quantile_8<- qnorm(ppoints_8)
qqplot_8<- qqplot(Theo.quantile_8, log_x[3,], main = " Log10 normalised Insulin", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_8)
# qq plot for Log10 normalised Lpa
ppoints_9 <- ppoints(log_x[4,])
Theo.quantile_9<- qnorm(ppoints_9)
qqplot_9<- qqplot(Theo.quantile_9, log_x[4,], main = " Log10 normalised Lpa", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_9)
# qq plot for square root normalised Lpa
ppoints_10 <- ppoints(sqrt(X[4,]))
Theo.quantile_10<- qnorm(ppoints_10)
qqplot_10 <- qqplot(Theo.quantile_10, sqrt(X[4,]), main = " Square root normalised Lpa", xlab = "Theoretical Quantiles", ylab = " Data Quantiles")
normplot(qqplot_10)

###################################
######### Part - d ################
###################################

# Reporting Means, Medains and SDs of normalised Cpeptide
Cpeptide_mean <- mean(sqrt_Cpep)
Cpeptide_median <- median(sqrt_Cpep)
Cpeptide_SD <- sd(sqrt_Cpep)
# Printing Cpeptide Mean, Median and Standard Deviation
print(paste ("Mean of normalised(sqrt) Cpeptide is:", Cpeptide_mean))
print(paste ("Median of normalised(sqrt) Cpeptide is:", Cpeptide_median))
print(paste ("SD of normalised(sqrt) Cpeptide is:", Cpeptide_SD))

# Reporting Means, Medains and SDs of normalised Glucose
Glucose_mean <- mean(new_glucose)
Glucose_median <- median(new_glucose)
Glucose_SD <- sd(new_glucose)
# Printing Glucose Mean, Median and Standard Deviation
print(paste ("Mean of Adjusted Glucose is:", Glucose_mean))
print(paste ("Median of Adjusted Glucose is:", Glucose_median))
print(paste ("SD of Adjusted Glucose is:", Glucose_SD))

# Reporting Means, Medains and SDs of normalised Insulin 
Insulin_mean <- mean(log_x[3,])
Insulin_median <- median(log_x[3,])
Insulin_SD <- sd(log_x[3,])
# Printing Insulin Mean, Median and Standard Deviation
print(paste ("Mean of normalised(log10) Insulin is:", Insulin_mean))
print(paste ("Median of normalised(log10) Insulin is:", Insulin_median))
print(paste ("SD of normalised(log10) Insulin is:", Insulin_SD))

# Reverting Means and Medians back to original units

# Cpeptide reconverted back to original values 
reconverted_Cpep_mean <- Cpeptide_mean^2
reconverted_Cpep_median <- Cpeptide_median^2
reconverted_Cpep_SD <- Cpeptide_SD^2
# Printing reconverted Cpeptide values
print(paste ("Reconverted Mean of normalised(sqrt) Cpeptide is:", reconverted_Cpep_mean))
print(paste ("Reconverted Median of normalised(sqrt) Cpeptide is:", reconverted_Cpep_median))
print(paste ("Reconverted SD of normalised(sqrt) Cpeptide is:", reconverted_Cpep_SD))


# Insulin reconverted back to original values 
reconverted_Insulin_mean <- 10^Insulin_mean
reconverted_Insulin_median <- 10^Insulin_median
reconverted_Insulin_SD <- 10^Insulin_SD
# Printing Reconverted Insuline values 
print(paste ("Reconverted Mean of normalised(log10) Insulin is:", reconverted_Insulin_mean))
print(paste ("Reconverted Median of normalised(log10) Insulin is:", reconverted_Insulin_median))
print(paste ("Reconverted SD of normalised(log10) Insulin is:", reconverted_Insulin_SD))

# Shapiro tests 
shapiro.test(log_Cpep)
shapiro.test(sqrt_Cpep)
shapiro.test(log_x[3,])
shapiro.test(log_x[4,])
shapiro.test(new_glucose)

