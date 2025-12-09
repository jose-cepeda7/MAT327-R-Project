BIC_no_na = subset(BIC, !is.na(`ACCOUNT TYPE`) & !is.na(`VIOLATION ACCOUNT STATE`) & !is.na(`EARLY SETTLEMENT VIOLATION`) & !is.na(`NUMBER OF COUNTS`) )
BIC_no_na$`ACCOUNT TYPE` <- as.factor(BIC_no_na$`ACCOUNT TYPE`)
BIC_no_na$`VIOLATION ACCOUNT STATE` <- as.factor(BIC_no_na$`VIOLATION ACCOUNT STATE`)
BIC_no_na$`EARLY SETTLEMENT VIOLATION` <- as.factor(BIC_no_na$`EARLY SETTLEMENT VIOLATION`)
BIC_no_na$`TYPE OF VIOLATION` <- as.factor(BIC_no_na$`TYPE OF VIOLATION`)
BIC_no_na$`VIOLATION DISPOSITION` <- as.factor(BIC_no_na$`VIOLATION DISPOSITION`)
null_model <- lm(`FINE AMOUNT` ~ 1, data = BIC_no_na)
full_scope <- formula(`FINE AMOUNT` ~ `MAXIMUM FINE` + `NUMBER OF COUNTS` + `ACCOUNT TYPE` + `VIOLATION ACCOUNT STATE` + `EARLY SETTLEMENT VIOLATION`)
best_model_forward <- step(null_model, direction = "forward", scope = full_scope, data = BIC_no_na)
summary(best_model_forward)
model_summary = summary(best_model_forward)
model_summary$r.squared
# 0.06422483
model_summary$coefficients
#.                                       Estimate   Std. Error      t value      Pr(>|t|)
#(Intercept)                         1.639949e+03 2.568130e+02   6.38577374  1.774047e-10
#`EARLY SETTLEMENT VIOLATION`TRUE   -2.060704e+03 8.494699e+01 -24.25870983 1.093281e-126
#`ACCOUNT TYPE`CL2 - Broker          6.647055e+02 3.604446e+02   1.84412681  6.519152e-02
#`ACCOUNT TYPE`CL2 - Exempt          2.488441e+03 2.616587e+02   9.51025580  2.297296e-21
#`ACCOUNT TYPE`License               2.166372e+03 2.626084e+02   8.24944041  1.772551e-16
#`ACCOUNT TYPE`Micro-Hauler License  2.848189e+03 4.202434e+03   0.67774739  4.979461e-01
#`ACCOUNT TYPE`Registered            1.981085e+02 2.977909e+03   0.06652602  9.469603e-01
#`ACCOUNT TYPE`Unlicensed            8.150802e+02 2.600949e+02   3.13378035  1.730232e-03
#`MAXIMUM FINE`                     -1.101614e-02 4.365686e-03  -2.52334746  1.163831e-02
#`NUMBER OF COUNTS`                  7.256594e+01 3.187414e+01   2.27663983  2.282685e-02
hist(residuals(best_model_forward), main = "Histogram of Residuals", xlab = "Residuals", breaks = 40)
plot(x = BIC_no_na$`FINE AMOUNT`, y = residuals(best_model_forward), main = "Actual Fine Amount vs. Residuals", xlab = "Actual FINE AMOUNT", ylab = "Residuals ")
abline(h = 0, col = "red", lty = 2)