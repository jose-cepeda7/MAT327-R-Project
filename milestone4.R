BIC <- read_csv("~/BIC_Issued_Violations_20250909.csv")
quantile(BIC$`MAXIMUM FINE`, na.rm = TRUE)
# 0%    25%    50%    75%   100% 
# 0      0      0  10000 830000 
quantile(BIC$`FINE AMOUNT`, na.rm = TRUE)
# 0%     25%     50%     75%    100% 
# 0     250     650    2500 1300000 
BIC1 = subset(BIC, `FINE AMOUNT` > 0 & !is.na(`FINE AMOUNT`) )
BIC = subset(BIC1, !is.na(`MAXIMUM FINE`) & `MAXIMUM FINE` < 150001 & `FINE AMOUNT` < 100001)
quantile(BIC$`FINE AMOUNT`)
quantile(BIC$`MAXIMUM FINE`)
hist(BIC$`FINE AMOUNT`, main="Histogram of Fine Amount", xlab="Fine Amount ($)")
hist(BIC$`FINE AMOUNT`, main="Histogram of Fine Amount 100 breaks", xlab="Fine Amount ($)", breaks =100)
hist(BIC$`MAXIMUM FINE`,main="Histogram of Maximum Fine Amount", xlab="Maximum Fine Amount ($)")
hist(BIC$`MAXIMUM FINE`,main="Histogram of Maximum Fine Amount 100 breaks", xlab="Maximum Fine Amount ($)", breaks = 100)