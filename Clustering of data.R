---
  title: "kmeans clustering"
author: "Nikhlesh Daga"
date: "2/22/2019"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
library(NbClust)
```

## kmeans clustering

1. Unsupervised learning i.e. there is no response variable to train the model.     
2. Aim is to maximize the within cluster homogenity and reduce the between cluster similarity.    
3. Assigns random centroids at start. Calculates the distance of each point with the nearest centroids and assigns it to the cluster. Recalculates the centroids(or means). The process goes on until convergence is achieved.     
4. User needs to pass the number of cluster initially.      


## Read in the data


```{r}
data(iris)
head(iris)
dim(iris)
data = iris[, -5] 
#Scaling the data --- (x - mean)/sd
normalized_data <- scale(data)
head(normalized_data)
```

## kmeans

```{r}
set.seed(123)
fit =  kmeans(normalized_data, centers=3)
fit
#fit$cluster      # A vector of integers (from 1:k) indicating the cluster to which each point is allocated.
#fit$centers      # A matrix of cluster centres.
#fit$totss        # The total sum of squares.
#fit$withinss     # Vector of within-cluster sum of squares, one component per cluster.
#fit$tot.withinss # Total within-cluster sum of squares, i.e. sum(withinss).
#fit$betweenss    # The between-cluster sum of squares, i.e. totss-tot.withinss.
#fit$size         # The number of points in each cluster.
#fit$iter         # The number of (outer) iterations.
```

76.7% denotes how well are the clusters separated from each other. Higher the value, better it is. 

## Plot the results

```{r}
par(mfrow = c(2,2))
plot(iris,col = iris$Species)
plot(iris,col = fit$cluster)
```

The plots look identical but also shows that some points are being mis-classified.

## Determine number of clusters

While there are couple of methods which can be used to identify the number of clusters, business or domain knowledge might sometimes add great value to this decision too.

```{r}
## Elbow curve or Scree plot
Cluster_Variability <- matrix(nrow=5, ncol=1)
for (i in 1:5) Cluster_Variability[i] <- kmeans(normalized_data,centers=i, nstart=4)$tot.withinss#nstart on creation of loop for every time will create 4 diffrent centroids and then will choose the value of the cluster
plot(1:5, Cluster_Variability, type="b", xlab="Number of clusters", ylab="Within groups sum of squares") 
#Nbclust package
numclust = NbClust(data, distance="euclidean",min.nc=2, max.nc=15, method="average")  
```
#numclust have 24 scientific formulas which gives how many number of clusters should be there 
?for
?kmeans
## Quick comparison

```{r}
table(iris$Species,fit$cluster)
```

The kmeans algorithms is mis-classifying few records. It is an algorithm which depends on the start, or in simple words, the initial centroids would have an impact on the output. It also shows us which cluster can be labeled as which species.
