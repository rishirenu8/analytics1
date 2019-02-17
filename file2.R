#my first r file
#hast tag is used to put a comment
women
#cntrl+entr to execute command
?women
?mean
#to seek help you should put question mark before the function
mtcars
mean(mtcars$mpg)
#mean to be calculated by mean()and by adding dollar sign for the respective column
?names(mtcars)
names(mtcars)
mean(mtcars$hp)
#name gives names of object
colMeans(mtcars)
#colMeans gives average of column
rowMeans(mtcars)
head(mtcars,1)
?head
tail(mtcars)
#head gives first six row by default if 1 is not mentioned
#tail gives last six rows by default if 1 is not mentioned
hist(mtcars$mpg)
#hist gives histograms
hist(mtcars$mpg,breaks=3)
?break
#head and tail if we enter minus sign it will delete that row and will display rest of it
#vectors
x=c(1,2,3,4,5)
x
class(x)
x1= c(2L, 8L)
x1
class(x1)
x3=c("A","B")
x3
class(x3)
x4=c(TRUE,FALSE,T,F)
class(x4)
(x5=1:1000)
mean(x5)
(x7=rnorm(1000))
mean(x7)
sd(x7)
(x8=rnorm(1000000))
plot(density(x7))
hist(x7)
hist(x7,freq=F)
points(density(x7))
(x9=rnorm(100,mean=60,sd=10))
hist(x9)
hist(x9,freq=F)
points(density(x9))
library(e1071)
kurtosis(x9)
skewness(x9)


x10=runif(100,30,90)
?runif
x10
trunc(x10)
#trunc rounds off
round(x10,1)
floor(x10)
ceiling(x10)
#floor-minimun,ceiling-maximum,trunc-remove decimal
x11=ceiling(x10)
x11
?trunc
(e3=0.6222)
floor(e3)
trunc(e3)
sort(x11)
#sort arranges the data
sort(x11,decreasing = T)
x11[x11 >60]
#[]used to execute the same set with some condition
x11[1:10]
?c
x11[-c(1:20)]


#matrices
m1 = matrix(1:24,nrow=6)
m1
dim(m1)
(m2=matrix(1:56,ncol=8))
m3=matrix(1:24,ncol=6,byrow=T)
m3
#byrow changes data that is to be filled
colnames(m3)=month.name[1:6]
m3
rownames(m3)=paste("Product",1:4,sep = "_")
m3
rowMeans(m3)             
colMeans(m3)
rowSums(m3)
colSums(m3)
r2=-10.25555
floor(r2)
trunc(r2)
m1
m1[1:2]

m3
m3[3,5]
m3[c(1:3),]
colMeans(m3[c(1:3),])
m3[,c("April","June")]
max(m3)
min(m3)
range(m3)


#question
#data.frame
n=30
rollno = paste("F",1:30,sep="/")
rollno
sname = paste("stud",1:30,sep = "-")
sname          
set.seed(1234)
gender=sample(c("M","F"),size = n,replace = T,prob = c(0.5,0.5))
gender

table(gender)

#prop.table calculates proportion
college=sample(c("SRCC","FMS","IIM"),size = n,replace = T,prob = c(.4,.3,.3))
college
(t2=table(college))
prop.table(t2) 

(marks1 = round(rnorm(n=n,mean=60,sd=10),0))
(marks2 = round(rnorm(n=n,mean = 55,sd=15),0))
rollno; sname;gender;college;marks1;marks2
length(gender)


students=data.frame(rollno,sname,gender,college,marks1,marks2)
students
head(students)
students$rollno
students[,c(2,5:6)]
students[,c("sname","marks1","marks2")]


str(students)
summary(students)
quantile(students$marks1)
?rnorm
quantile(students$marks1,probs = seq(0,1,0.1))
?seq
quantile(students$marks1,probs = seq(0,1,.25))
#seq o.1 indicates interval
quantile(students$marks1,probs = seq(0,1, .33))
summary(students)
students$rollno=as.character(students$rollno)
students$sname=as.character(students$sname)
str(students)
summary(students)
head(students)
write.csv(students,'fms.csv',row.names = F)


students2 = read.csv('fms.csv')
students2
head(students2)
students3= read.csv(file.choose())
library(dplyr)
head(students)
students[students$marks1>60,]
students[students$gender=='F',]
students[students$gender=='F'| students$college=='SRCC',]

#pipe   | is used for or
#highest from all college
students %>% filter(gender=='M')
students %>% group_by(gender) %>% summarise(mean(marks1),mean(marks2))
students %>% group_by(college) %>% summarise(max(marks1),max(marks2))
students %>% filter(college=='FMS') %>% select(marks1,marks2)
students
#data.frame
n=30
rollno = 1:30
(rollno = paste('F',1:30,sep='-'))
(sname = paste('Student',1:30, sep='&'))

set.seed(1234)
(gender = sample(c('M','F'), size=n, replace=T, prob=c(.7,.3)))
table(gender)
(t1=table(gender))
prop.table(t1)

set.seed(12)
(college = sample(c('SRCC','FMS','IIM'), size=n, replace=T, prob=c(.4,.3,.3)))
(t2=table(college))
prop.table(t2)
n=30
(rollno = paste('F',1:30,sep='-'))
(sname = paste('Student',1:30, sep='&'))
set.seed(1234)
(gender = sample(c('M','F'), size=n, replace=T, prob=c(.7,.3)))
(t1=table(gender))
prop.table(t1)
set.seed(12)
(college = sample(c('SRCC','FMS','IIM'), size=n, replace=T, prob=c(.4,.3,.3)))
(t2=table(college))
prop.table(t2)

(marks1 = round(rnorm(n=n, mean=60,sd=10),0) )
(marks2 = round(rnorm(n=n, mean=55,sd=15),0) )
rollno; sname; gender; college;marks1;marks2
length(gender)
students = data.frame(rollno, sname, gender, college, marks1, marks2)
class(students)
students
head(students)
students$
  students$rollno
students[,5:6]
students[,c(2,5:6)]
students[,c('sname','marks1','marks2')]
str(students)
summary(students)
quantile(students$marks1)
quantile(students$marks1, probs=seq(0,1,.1))
seq(0,1,.1)

quantile(students$marks1)
quantile(students$marks1, probs=c(0,.25,.5,.75,1))
seq(1,100)
seq(1,100,2)
seq(1,100,3)
quantile(students$marks1, probs=seq(0,1,.1))
quantile(students$marks1, probs=seq(0,1,.01))
seq(from=1,to=100,by=3)
quantile(students$marks1, probs=seq(0,1,.25))
summary(students)
str(students)
students$rollno =as.character(students$rollno)
students$sname =as.character(students$sname)
str(students)
summary(students)
str(students)
head(students)
write.csv(students, 'fms.csv', row.names = F)
students2 = read.csv('fms.csv')
head(students2)
students3 = read.csv(file.choose())
head(students3)

#students
head(students)
library(dplyr)
head(students)
students[students$marks1 > 60 , ]
students[students$gender =='F' , ]
students[students$gender =='F' | students$college == 'SRCC' , ]#pipe is used as females or from srcc and & is used as and 


#highest from all college
students %>% filter(gender=='M' & marks1 > 60)
students %>% group_by(gender) %>% summarise(mean(marks1), mean(marks2))
students %>% group_by(college) %>% summarise(max(marks1), max(marks2))
students %>% filter(college=='FMS') %>% select(marks1, marks2)
students
?`dplyr-package`
students[students$gender =='F' & students$college == 'SRCC' , ]
#deplyr helped us to use %>% this symbol
#which means filter
students %>% group_by(college) %>% summarise(sum(marks1),mean(marks2))
?summarise
students %>% group_by(college) %>% summarise(min(marks1),min(marks2))
students %>% group_by(gender,college) %>% summarise(countTotal=n(),mean(marks1,max(marks2)))
students %>% tally()
students %>% mutate(totalmarks= marks1 + marks2)
#mutuate helps us to add another column
students %>% mutate(totalmarks= marks1 + 1.2 * marks2) %>% arrange(-totalmarks)
students %>% mutate(totalmarks= marks1 + 1.2 * marks2) %>% filter(totalmarks == max(totalmarks))
students %>% mutate(totalmarks= marks1 + 1.2 * marks2) %>% max(totalmarks) 
students %>% sample_n(5)
students %>% sample_frac(.2)
?filter
?top_n
top_n(students,1,marks1)
library(rjava)
library(xlsx)
