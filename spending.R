
cat("\014") # clear the console
rm(list=ls())
dev.off() 

check = read.csv("~/Dropbox/Home/Financial/spending/Checking1.csv", header=F) 
head(check)
names(check) = c("date","amt","na","check_no","desc") 
check$card = "debit" 

cc1 = read.csv("~/Dropbox/Home/Financial/spending/CreditCard4.csv", header=F) 
names(cc1) = c("date","amt","na","check_no","desc") 
cc1$card = "cardWF" 

dat = rbind(check,cc1) 
dat$na = NULL 
dat$check_no = NULL 

cc2 = read.csv("~/Dropbox/Home/Financial/spending/bk_download.csv", header=F) 
cc2$card = "cardUS" 
cc2 = cc2[, c(3,7,5,8)] 
names(cc2) = c("date","amt","desc","card") 
head(dat) 
head(cc2) 
dat = rbind(dat,cc2) 

rm(cc1,cc2,check) 

dat$date = as.Date(dat$date, format="%m/%d/%Y") 
dat = subset(dat,dat$date>"2019-01-31") 

