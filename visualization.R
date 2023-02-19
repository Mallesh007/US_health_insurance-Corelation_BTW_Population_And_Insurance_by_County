library(tidyverse)
my_data <- read.csv("Health insurance (18 and under).csv")
HtInsur <- my_data %>% filter(year==2015)
colnames(HtInsur)
HtInsur$uninsured1=(HtInsur$uninsured/HtInsur$population_18under)*100
population_under18 <- HtInsur$population_18under
percent_Uninsured_people_under18 <- HtInsur$uninsured1
cor(population_under18,percent_Uninsured_people_under18,use="pairwise.complete.obs")
pdf("visualization.pdf")
plot(population_under18,
     percent_Uninsured_people_under18,
     main = "% of people (Age 18 and under) without health insurance per \n county Vs Population (Age 18 and under) per county in the US",
     xlab = "Population (Age 18 and under) per county",
     ylab = "% of people (Age 18 and under) without health insurance per county",
     pch = 19)
legend(x="topright",
       legend =c("correlation"),
       fill=c("red"))
model <- lm(percent_Uninsured_people_under18 ~ population_under18, data = HtInsur)
abline(model, col="red")
#HtInsur <- HtInsur %>% filter(uninsured<=20000)
dt<- HtInsur$uninsured1
dtMin=min(dt,na.rm=TRUE)
dtMax=max(dt,na.rm=TRUE)
dtMean=mean(dt,na.rm=TRUE)
dtSd=sd(dt,na.rm=TRUE)
h<-hist(dt, breaks=20, density=50,
        main = "Frequency distribution for % of people (Age 18 and under) without \n health insurance per county in the US",
        xlab = "% of people (Age 18 and under) without health insurance per county",
        ylab = "Frequency",
        xlim=c(0,dtMax),
        ylim=c(0,1000),
        col ="gray") 
legend(x="topright",
       legend =c("normal curve"),
       fill=c("blue"))
x<-seq(dtMin,dtMax,1)
y1<-dnorm(x, mean=dtMean, sd=dtSd)
y1<-y1*diff(h$mids[1:2])*length(dt)
lines(x,y1,col="blue")

dev.off()

