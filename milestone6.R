library(readr)
BIC <- read_csv("BIC.csv")
cor(BIC$`MAXIMUM FINE`, BIC$`FINE AMOUNT`)
# -0.02734039
plot(x = BIC$"MAXIMUM FINE", y = BIC$"FINE AMOUNT", main = "Scatterplot of Fine Amount vs. Maximum Fine", 
     xlab = "Maximum Fine", ylab = "Fine Amount",col = "cornflowerblue" )