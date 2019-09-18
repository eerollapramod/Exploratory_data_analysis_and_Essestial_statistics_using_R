# Exploratory Data Analysis and Essestial Statistics using R

This Respository contains an R script for each question that perform differnt statistical and data analysis task. Each question (folder) contains the main R script (`Question_#.r`), required datasets, and any R functions required to perform the analysis. 


## Dependencies

* The latest version of R must be installed as all scripts are written in R
* Any required packages and libraries can be automatically installed by running the R script.
* Any required functions are attached within the folders.
* It is recommended to have `X-client` installed in order to open the GUI pop-up window for graphics/plots. User can comment the `x11()` out to stop it from opening the pop-up window.


## Background

The project is split into four parts:
1. Parametric, non-parametric, and Bayesian Statistics
2. Moving agerage
3. Multivariate Regression
4. Principal Components Analysis and Hierarchical Cluster Analysis


## 1.  Parametric, non-parametric, and Bayesian Statistics

The file `metabolites.csv` contains data on 200 non-obese healthy men who have undergone an overnight fast. The table gives some additional information:

|  Metabolite     |  Unit   |  Role                             |  Comments                                      |
| --------------- | ------- | --------------------------------- | ---------------------------------------------- |
|  Glucose        | mmol/l  |  Source of Energy                 |                                                |
|  Insulin        | pmol/l  |  Promotes glucose metabolism      |                                                |
|  C-peptide      | pmol/l  |  By-product of insulin production | Persent at higer concentrations than insulin   |
|  Lipoprotein (a)| mg/l    |  Lipid transport                  | Lower limit of detection is 4.0 mg/l           |


Assuming that these data have been collated from various sources and may have been manually transcribed:

* **Part a)** Assessment of frequency distribution of each metabolite using Histogram and qqplot showed the normal distribution of C-peptide. However, the frequency distribution of `Glucose, Insulin, and Lipoprotein-a (Lp(a))` are concentrated to the left side of normal distribution. QQplot of these metabolits agree with histograms. 

* **Part b)** The frequency distribution of `Glucose` in qqplots show the outliers at biologically impossible (higher) concentrations.  These outliers are removed while the rest of the metabolites were untouched at this point.

* **Part c)** The data was normalised using various methods in order to get better results.

  1. The `raw data` was normalised using `log10` transformation.
  2. `C-peptide` was normalised using `log10` and `square root (sqrt)` transformations. However, the `sqrt` normalisation     produced better results compared to `log10` normalisation (refer to plots). 
  3. `Insulin` was normalised using `log10` transformation which produced positive results.
  4. `Glucose` did not require any transformation after removing the outliers as the frequency distribution was normal.
  5. However, `Lp(a)` did not show any improvement with neither `log10` nor `sqrt` transformation.

  The QQplots and Histograms can be produced after normalisation for further investigation by running the `part-c` code.

* **Part d)** 
  1. In this part, the script reports the means, medians and standard deviations of the normalised variables (metabolites). 
  2.  These means and the medians of the normalised variables (metabolites) were converted back into their original units to reported as part of the assignment requirement. 
  3. The normality of the data was also assesed using the shapiro test.


## 2. Moving Average

The `Moving Average` can be employed to ascertain and confirm certain trends in a given dataset. In this section, I programmatically perform a moving average on the supplied “vaccines” data. 

First, a brief description of the data follows. The health monitoring agency of a developing country has recently completed a substantial piece of work justifying the expenditure on vaccines aimed at reducing the incidence of the (almost always fatal) disease, XXX. The new vaccines were introduced in 1990, following a lengthy development programme initiated after the 1983/84 disaster. The dataset containing the incidence of the disease in thousands of sufferers from 1950 to 1999 is available in the supplied text file: `vaccine.txt`.

* **Part a)** In this section, the `raw data` was plotted using the `matplot()` function to intepret the data. The purpose of this plot was to find out the year with highest incidences  by using `which()` function with a threshold of `>90` (1984 in this instance). The graph shows the incidences over time and also shows when the disease was peaked during repeated intervals. At this point, it wasn't clear whether the introduction of the vaccince after 1984 disaster had any impact on these incidences. The text()function was used to overlay the identified years on the plot. 

* **Part b)** In this section, Moving Average was performed usnig the `movavg()` function with the `window size 11`, and overlayed the new plot (red) over the current one (black) ensuring that the axes are labelled accordingly and a legend is added so that the two lines can be easily distinguishable. 

  Raw data analysis shown there were no incidents reported after 1984 disaster. However, moving average shows the reported incidents until 1990 , averaging in the range of previous disasters. This proves that the introcution of vaccine after 1984 disaster had minimum affect on incidences reported.


## 3. Multivariate Regression

`Multivariate Regression` can be used to predict multiple dependant variable by using several independent variables. This gives the opportunity to analyse the data as it has multiple variable to consider. Analysing the correlation between independent variables (Potential multicollinearity) is another advantage of multivariate regression. It helps us predict the dependant variables by eliminating the ones that are not related to/affecting the output. This potential multicollinearity can sometimes result in inaccurate predictions when using bigger datasets. Multivariate regression is less biased compared to univariate models. This is due to ignorance of all possible factors influencing the resluts in univariate regression. 

**Data:** The two datasets, `TRAINING` and `TESTING` (in .CSV format) contain the information on a series of eye measurements. In both sets, the first column contains sample labels, the second column contains the measured glucose concentrations of the volunteer, and the remaining columns are made up of specific measurements pertaining to the eye such as pupil diameter, pupil angle, etc., and also body and room temperature, humidity.

The objective was to build a calibration model with the `TRAINING` dataset and use it to predict the glucose concentrations of the `TESTING` dataset and thus to determine the best LV by determining the `RMSEP`.

* **Part a)** In this section, 
  1. Both datasets were imported using `read.table()` function and extracted the row and column headers into separate     variables. 
  2. First columns pertaining to the concentrations were extracted into separate respective vectors (`CTRAIN` and `CTEST`) from the numeric matrix attained from `TRAINING` and `TESTING`. 
  3. The same was done for the remaining columns so both `XTRAIN` and `XTEST` are available.

* **Part b)** In this section, the `auto2()` function (available within the related folder) was used to create three variables: `A2XTRAIN, A2CTRAIN` and `A2XTEST`; auto2() allows the scaling parameters to be captured – those from A2XTRAIN were used to create A2XTEST; those from A2CTRAIN were used to rescale the predicted concentrations in part `b` below. Auto-scaling is strongly recommended as it can sort the data in a simplest way possible, which makes it easier to use the data when predicting the variables of testing data as accurately as possible.

* **Part c)** In this section, the Multivariate Regression was performed using pls.regression.
  1. Multivariate regression was performed using `pls.regression()` function (Using A2XTRAIN, A2CTRAIN and A2XTEST).
  2. A `for-loop` was set up in order to attain the predicted values.
  3. Set the number of `LVs` to 10 and calculate the RMSEP.
  4.  From this, the optimum `LV` was determined and the corresponding `RMSEP` value was quoted.
  5. The predicted values were "rescaled" (using the supplied `rescale()` function) using the parameters from A2CTRAIN which  restored the concentration units.

* **Part d)** Based on the optimum LV derived in iii, generated a bar plot via the `barplot()` function of the corresponding loadings extracted from the PLS model. Labeled the axes. 

After calculating the RMSEP values from the training data by limiting the number of LVs to 10, The most optimum variable with least RMSEP was picked to generate the predicted values as accurate as possible. From the calculations, LV2 is the most optimum variable for the predictions as it has the best RMSEP (1.268560) compared to the rest. Hence why this particular LV was used for predictions.

The barplot produced from this analysis shows the influence of 30 different variables on the concentrations of glucose on our samples.
  1. The variables (such as 1,16,20, etc) between the thresholds 0 to 0.2 had minimum effect on glucose concentration levels.
  2. The variables (such as 3, 15, 17, etc) between the thresholds 0.2 to 0.4 had maximum effect on glucose concentration levels.
  3. However, the variables (such as 2,4,5, etc) that are below the minimum 0 threshold have positive effect on subjects in stabilising the glucose levels.
  4. The predictions with multivariate regression can be useful in understanding the influencing factors of our samples.


## 4. Principal Components Analysis (PCA) and Hierarchical Cluster Analysis (HCA)

Principal component analysis is used in analysing the large datasets. It reduces the time and the computer resources used to analyse the large and complex datasets. This is done by separating the ideal Principal components that can capture the 100% variance of the original sample matrix. Hierarchical cluster analysis clusters the the similar samples from different groups together. The distances between these samples can be measures usng different distance Methods (`Euclidean, Manhattan, Maximum, Canberra, Binary and Minkowski`) and linkage methods (`Single, Complete, Average, Centeroid, Ward, Mcquitty and Median`). This is useful in understanding the relationship and influence between different simples.

**Data:** The tab-delimited text file called `"winedata.csv”` contains fluorescence spectra acquired from samples extracted from bottles of wine originating from 5 different countries. Each sample is labelled A1 to A50. There were 10 samples per country. The data is set in the standard form for a sample matrix with the samples being in rows (50 samples) and the variables   being in columns (251 variables). The variables describe the wavelength of fluorescence emission spectroscopy between 250-500 nm.

**Note: Since there are 251 variables the interval of 250-500 nm must be covered in steps of 1 – these are the values on the X-axis which correspond to the elements within each sample.**
 
* **Part a)** In this section, The data was loaded into R and the row names and column names were created. A `while-loop` was created to let the user plot a sample of his own choice so as to compare the different spectra. The loop terminates when the user enters a ‘zero’.

* **Part b)** In this part, scores matrix `S` and the loadings matrix `L` were generated by performing PCA via the eigenanalysis algorithm (`eigen()`) to solve the problem (i.e. found the covariance matrix of `X` and then calculated the eigenvectors and eigenvalue matrices `V` and `D`). A `for-loop` was set up to capture the percentage of variance for each principal component. This loop also prints the percentage of variance of each principal component. In this instance, 156 PCs need to be retained in order to capture the 100% of the variance of original matrix.

* **Part c)** In this section, a `while-loop` was set up to let the used enter the desired samples choice to generate the PCA plot. The user can exit the loop by entering "zero" for both first and second input sample choices. PCA plot generated from the `for-loop` shows the variances captured by the two retained (best) PCs. It shows that PC2 (7.35%) and PC1 (90.7%) together coapture the 100% of the variance.

* **Part d)** Within the same `while-loop`, an HCA is performed on the raw data X and on the PCA scores to compare them two. For the HCA dendrogram generated by the PCA scores, the number of columns to include depends on the second PC selected in c). Compare the two dendrograms.

The PCA plot and HCA dendrogram generated using PC2 vs PC1 proves how we can capture the 100% of variance of the original sample matrix.
