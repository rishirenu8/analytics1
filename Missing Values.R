---
  title: "Missing values"
author: "Nikhlesh Daga"
date: "2/22/2019"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Missing value treatment is an important step in any modeling exercise. While some of the algorithms can handle missing values well, others cannot. We cannot always just remove the rows or columns because getting data is a costly and time consuming exercise.


## Required packages

```{r,warning=FALSE}
library(Hmisc)
library(rpart)
library(DMwR)
library(mice)
```

## Read in the data


```{r}
path = 'https://raw.githubusercontent.com/nikhlesh17/Training/master/titanic.csv'
titanic <- read.csv(path)
```
sum(is.na(titanic$age))
```{r}
sapply(titanic,function(x) sum(is.na(x)))

mean(titanic$age)
mean(titanic$age,na.rm = T)
complete.cases(titanic)  # which row have complete data in T/ F
sum(complete.cases(titanic))  # no of rows have which no missing data
sum(!complete.cases(titanic))  # no of rows which have missing data
titanic_cc <- titanic[complete.cases(titanic),]  #rows which are complete
titanic_ncc <- titanic[!complete.cases(titanic),] #rows which have missing values
str(titanic_cc)
str(titanic_ncc)
```

## Missing value mechanisms

**Missing completely at random (MCAR)**: data are missing independently of both observed and unobserved data; such cases can be thrown out without biasing the results
Example: a student is absent due to accident on way to school.

**Missing at random (MAR)**: nonresponse depends on the information in the available data
Example: the chance of "income" data missing varies by age, gender, etc., information on which are recorded.

**Missing Not at Random (MNAR)**: missing observations related to values of missing data themselves 
Example 1: A student is absent in a test because he is a bad student and/or has not prepared well. Missingness depends on the unobserved score in the test he is absent.

Its very easy to ignore the MCAR data but for MNAR, we need to understand the reason behind missingness and fix accordingly.

## Major ways of handling missing values

1. **Delete the variable**
  
  If we have enough data available and the column in question is not an important column, we can just go ahead and delete the corresponding column or do not include that column in your analysis.

2. **Delete the rows**
  
  Once again, if we have enough data available, we can delete the rows with missing data or do not include them in our analysis. 

3. **Imputation with mean/median values**
  
  In this technique, we impute the missing values with mean/median values. In some cases, we might want to impute with median values e.g. when the data is skewed.


```{r}
impute(titanic$age,mean)
impute(titanic$age,median)
impute(titanic$age,100)   # Specific value
```

4. **KNN imputation**
  
  This method make use of K nearest neighbors concept. For every value to be imputed, the algorithm identifies the k nearest neighbor based on euclidean distance and impute sthe value based on weighted average. We can impute multiple columns at one go but we also need to be careful that we ar enot using the response variable while imputing.

```{r}
library(DMwR)
knnOutput <- knnImputation(titanic[, !names(titanic) %in% "survived"])  
anyNA(knnOutput)
sapply(knnOutput, function(x) sum(is.na(x)))

5. **MICE**
  
  MICE or multivariate Imputation by Chained equations is one step ahead with missing value treatment. It uses the mice() function to produce multiple copies of the dataframe, each with different imputations of the data. The complete() function returns the imputed data and we can select one of them as the complete data.

```{r}
# takes time to run
mice1 <- mice(titanic[, !names(titanic) %in% "survived"], method="rf")  # perform mice imputation, based on random forests.
#This is where we can see the values
#mice1$imp$age
# Pick the one which seems fine 
#miceOutput <- complete(mice1,1)  # generate the completed data(by default first)
#anyNA(miceOutput)
```

References - 
  
  https://www.r-bloggers.com/missing-value-treatment/
  