>># MARKET BASKET ANALYSIS (MBA) in R
### WHY?
#### MBA is a Modeling Technique : If a customer picks a product 'P1' what is the probability that he buys product 'P2'. and if the probability is high place the products side by side.This technique describes the association between items in a shopping center.
##Technical Term
#What is the probability that i will buy item Y after i have already bought item X
##X &rarr; Y
where we call ***x*** as **antecedent** and call ***y*** as **precedent**.

## Example
### Assume in a grocers shop the following transaction happen
1. C1 &rarr; Bread,Butter,Jam
2. C2 &rarr; Bread,Butter,Jam
3. C3 &rarr; Bread,Butter,Milk
4. C4 &rarr; Bread,Milk
5. C5 &rarr; Milk,Jam

#### In this transaction summary we see that total sales for Bread is 4, Butter is 3 , Jam is 3 and Milk is 3.



#### The probable rules could for the above mention transaction could be:

1. Bread  &rarr; Butter  
2. Bread &rarr; Jam
3. Bread &rarr; Milk
4. Butter &rarr; Bread
5. Butter &rarr; Jam
6. Butter &rarr; Milk
7. Jam &rarr; Bread
8. Jam &rarr; Butter
9. Jam &rarr; Milk
10. Milk &rarr; Bread
11. Milk &rarr; Butter
12. Milk &rarr; Jam
13. Bread , Butter &rarr; Jam
#### ***etc

### Terminologies

##### 1. Frequent Item set: Items which are bought most frequently e.g Bread occuers in 80%(4 divides 5) of purchases.
##### 2. Support: The fraction of which our item set appeared in the total number of transaction. e.g the support for Bread & Butter is the number of times they together appeared in a data set to the total number of transaction(3/5 =.06 ).
##### 3. Confidence :  is conditional probability that customer buy product A will also buy product B. It measures how often items B appear in transactions that contain A.
Formuls: Formula - Confidence (A ==> B) = Support (A and B) / Support (A)
##### 4. Lift: If someone buys Product A,  what % of chance of buying product B would increase.
Formula - Lift (A ==> B) = Confidence (A ==> B) / Support (B)


# what we want  out of MBA
In market basket analysis, we pick rules with a lift of more than one because the presence of one product increases the probability of the other product(s) on the same transaction. Rules with higher confidence are ones where the probability of an item appearing on the RHS is high given the presence of the items on the LHS.

## Program
### Before the start of the program set the Current Working Directory to the directory in which you are working if its not default
>setwd(" your current working directory")
### Load your excel data to R :
>library(readxl)<br />
### Reading the excel file 
library(readxl)<br />
retail=read_excel("inputs\\Online_Retail.xlsx")<br />
retail=read_excel("D:\\R\\MARKET_BASKET_ANALYSIS\\inputs\\Online_Retail.xlsx")<br />
### Cleansing the Excel file i.e removing NAs or any row that contains null<br />
retail <- retail[complete.cases(retail), ]<br />
summary(retail)<br />



