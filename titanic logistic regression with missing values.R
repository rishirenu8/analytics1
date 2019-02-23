path = 'https://raw.githubusercontent.com/nikhlesh17/Training/master/titanic.csv'
titanic <- read.csv(path)
str(titanic)
is.na(titanic$age)
str(titanic)
g1=glm(survived~ age+ sex,data= titanic,family = 'binomial')
g1
summary(g1)
