#read the excel data
library(readxl)
retail=read_excel("D:\\R\\MARKET_BASKET_ANALYSIS\\inputs\\Online_Retail.xlsx")
#removes NAs or missing values from a data frame
retail <- retail[complete.cases(retail), ]
retail

# baket Analysis Stated

retail_sorted <- retail[order(retail$CustomerID),]
library(plyr)
library(dplyr)
retail %>% mutate(Description = as.factor(Description))
retail$Date <- as.Date(retail$InvoiceDate)
itemList <- ddply(retail,c("CustomerID","Date"), 
                  function(df1)paste(df1$Description, 
                                     collapse = ","))

#write.csv(itemList,"D:\\R\\MARKET_BASKET_ANALYSIS\\market_basket.csv", quote = FALSE, row.names = TRUE)

itemList$CustomerID <- NULL
itemList$Date <- NULL

#write.csv(itemList,"D:\\R\\MARKET_BASKET_ANALYSIS\\market_basket1.csv", quote = FALSE, row.names = TRUE)
colnames(itemList) <- c("items")

#write.csv(itemList,"D:\\R\\MARKET_BASKET_ANALYSIS\\market_basket2.csv", quote = FALSE, row.names = TRUE)

summary(itemList)

tr <- read.transactions('D:\\R\\MARKET_BASKET_ANALYSIS\\market_basket2.csv', format = 'basket', sep=',')
tr
summary(tr)


rules <- apriori(tr, parameter = list(supp=0.001, conf=0.8,maxlen=20))
rules <- sort(rules, by='confidence', decreasing = TRUE)
summary(rules)
inspect(rules[1:10])
topRules <- rules[1:10]
library(arulesViz)
plot(topRules)
plot(topRules,method="graph",interactive=TRUE,shading=NA)