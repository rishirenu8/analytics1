#graphs

mtcars
names(mtcars)
table(mtcars$cyl)
table(mtcars$cyl,mtcars$am)
mtcars$mpg
#continous data _histogram ,box plot
hist(mtcars$mpg)
boxplot(mtcars$mpg , horizontal=T)
boxplot(mtcars$mpg)
boxplot(mpg~gear,data=mtcars,col=44:4)
t1=table(mtcars$gear)
t1
barplot(t1,col=1:3)
pie(c(10,3,5))
students
t2=table(students$college)
barplot(t2)
t3=table(students$gender)
t3
barplot(t3)
pie(t3)
