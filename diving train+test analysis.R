women
nrow(women)
s=sample(x=1:15,size=.7*nrow(women),replace=F)
s1=women[s,]
s1
s2=women[-s,]
s2
library(dplyr)
l1=women%>% group_by(height>60)
l1 
l2= =women[s,] >%> group_by(weight<140)


fit1=lm(weight~height,data=s1)
summary(fit1)
p5 = predict(fit1, newdata=s2,type ='response')
p5
cbind(predicted=p5,actual=s2$weight,height=s2$height)
