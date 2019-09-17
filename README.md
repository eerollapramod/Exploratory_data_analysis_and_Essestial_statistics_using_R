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

|   Metabolite    |  Unit   |  Role                             |  Comments                                      |
| --------------- | ------- | --------------------------------- | ---------------------------------------------- |
|  Glucose        | mmol/l  |  Source of Energy                 |                                                |
|  Insulin        | pmol/l  |  Promotes glucose metabolism      |                                                |
|  C-peptide      | pmol/l  |  By-product of insulin production | Persent at higer concentrations than insulin   |
|  Lipoprotein (a)| mg/l    |  Lipid transport                  | Lower limit of detection is 4.0 mg/l           |
