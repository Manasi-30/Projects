new2 <- read.csv("C:/Users/Manasi/Desktop/R/co2_loa.csv")
cor <- new3[-which(new3$cases == "0"), ]
cor
new3 <- read.csv("C:/Users/Manasi/Desktop/R/coronavirus_dataset.csv")
library("forecast")
library("ggplot2")
library("dplyr")

# creating a time-series by year
myts <- ts(new2[,2],start = 1958, end = 2008, frequency = 1)
myts
myts2 <- ts(cor[,6,],frequency = 3, start = c(2020, 1), end = c(2020, 3))
myts2
autoplot(myts, facets =  TRUE)

# naive

model1 <- naive(myts,h=5)
autoplot(model1)
accuracy(model1)
# MEANF
modelmean <- meanf(myts,h=5)
autoplot(modelmean)
accuracy(modelmean)

summ <- new3 %>% summarize(year =new3$date)
new3$date
