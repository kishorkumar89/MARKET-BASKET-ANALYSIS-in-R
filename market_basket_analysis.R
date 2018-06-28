#read the excel data
library(readxl)
retail=read_excel("D:\\R\\MARKET_BASKET_ANALYSIS\\inputs\\Online_Retail.xlsx")
#removes NAs or missing values from a data frame
retail <- retail[complete.cases(retail), ]
summary(retail)
retail
library(dplyr)
retail %>% mutate(Description = as.factor(Description))
retail
retail$Date <- as.Date(retail$InvoiceDate)
retail$Time <- format(retail$InvoiceDate,"%H:%M:%S")
retail$InvoiceNo <- as.numeric(as.character(retail$InvoiceNo))
glimpse(retail)
