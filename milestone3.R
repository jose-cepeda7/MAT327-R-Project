library(readr)
violations <- read_csv("~/BIC_Issued_Violations_20250909.csv")
View(violations)
install.packages("ggplot2")
hist(violations$`FINE AMOUNT`, main="Histogram of Fine Amount", xlab="Fine Amount ($)")
hist(violations$`FINE AMOUNT`, breaks=100, main="Histogram of Fine Amount with 100 breaks", xlab="Fine Amount ($)")
hist(violations$`MAXIMUM FINE`,main="Histogram of Maximum Fine Amount", xlab="Maximum Fine Amount ($)")
hist(violations$`MAXIMUM FINE`,main="Histogram of Maximum Fine Amount With 100 Breaks", xlab="Maximum Fine Amount ($)",breaks=100)
ggplot(violations, aes(x = `VIOLATION DISPOSITION`)) + geom_bar(fill = "blue") + labs(title = "Frequency of Violation Dispositions",
  x = "Violation Disposition (Outcome)", y = "Count") + theme( axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(violations, aes(x = `BOROUGH OF VIOLATION`)) + geom_bar(fill = "orange") + labs(title = "Frequency of Borough Where Violation Happens",
  x = "Violation Location", y = "Count") + theme(axis.text.x = element_text(angle = 45, hjust = 1))