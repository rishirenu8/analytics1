#modelling
#linear regression - simple , Multiple
#y~X1 (SLR) ; y~ x1+x2.......(MLR)
#y~dependent variable , X-Independent

head(women)
#y-weight,x=height
cor(women$height,women$weight)
#strength and direction of relationship
cov(women$height,women$weight)
#direction +ve
#height increases,weight increases
plot(women$height,women$weight)
#perform linear modelling
fit1 =lm(weight~height,data=women)
#lm is a command to linear modelling 

summary(fit1)
#f stats Pvalue << 0.05 : linear model exist
#atleast one IV significant in predicting DV
#Multiple Rsquare = 0.991 cOEFF of determination
#Multiple when you have IV,otherwise take ADJ RSQ
#99% of the variation in y is explained by Xs
#y= mx+c : y= -87+3.45= height
range(women$height)
#only do interpolation and not extrapolation
women$weight
women$height
(y= -87+ 3.45 * women$height)
#predicted weights for actual heights
fitted(fit1)
?fitted
residuals(fit1)
#difference between predicted and actual weights
summary(fit1)
summary(residuals(fit1))
summary(students$marks1)
(newdata1=data.frame(height=c(60.4,59.9)))
(p1=predict(fit1,newdata=newdata1,type='response'))
cbind(newdata1,p1)
?predict
?predict.lm
