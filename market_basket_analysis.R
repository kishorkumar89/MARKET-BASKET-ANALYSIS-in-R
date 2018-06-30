#set working directory
setwd("D:/R/MARKET_BASKET_ANALYSIS")

#read the excel data
library(readxl)
retail=read_excel("inputs/Online_Retail.xlsx")

#removes NAs or missing values from a data frame
retail <- retail[complete.cases(retail), ]

# baket Analysis Stated

retail_sorted <- retail[order(retail$CustomerID),]
library(plyr)
library(dplyr)
retail %>% mutate(Description = as.factor(Description))
retail$Date <- as.Date(retail$InvoiceDate)
itemList <- ddply(retail,c("CustomerID","Date"), 
                  function(df1)paste(df1$Description, 
                                     collapse = ","))


itemList$CustomerID <- NULL
itemList$Date <- NULL
colnames(itemList) <- c("items")

write.csv(itemList,"output/market_basket2.csv", quote = FALSE, row.names = TRUE)


tr <- read.transactions('output/market_basket2.csv', format = 'basket', sep=',')
tr
summary(tr)


rules <- apriori(tr, parameter = list(supp=0.001, conf=0.8,maxlen=20))
rules <- sort(rules, by='confidence', decreasing = TRUE)
#summary(rules)
#inspect(rules[1:10])
topRules <- rules[1:10]
library(grid)
library(arulesViz)
#plot(topRules)
plot(topRules,method="graph",interactive=TRUE,shading=NA)
#plot(topRules, method="grouped")
# rrules:
write.csv(rules,"D:\\R\\MARKET_BASKET_ANALYSIS\\market_basket_RULES.csv", quote = FALSE, row.names = TRUE)

plot(topRules,method="graph",interactive=TRUE,shading=NA)






