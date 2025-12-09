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
#.                                      Estimate   Std. Error      t value      Pr(>|t|)
#(Intercept)                         1639.949434   256.812957   6.38577374  1.774047e-10
#`EARLY SETTLEMENT VIOLATION`TRUE   -2060.704327    84.946988 -24.25870983 1.093281e-126
#`ACCOUNT TYPE`CL2 - Broker           664.705476   360.444559   1.84412681  6.519152e-02
#`ACCOUNT TYPE`CL2 - Exempt          2488.440947   261.658677   9.51025580  2.297296e-21
#`ACCOUNT TYPE`License               2166.372198   262.608382   8.24944041  1.772551e-16
#`ACCOUNT TYPE`Micro-Hauler License  2848.188955  4202.434423   0.67774739  4.979461e-01
#`ACCOUNT TYPE`Registered             198.108460  2977.909464   0.06652602  9.469603e-01
#`ACCOUNT TYPE`Unlicensed             815.080188   260.094868   3.13378035  1.730232e-03
#`MAXIMUM FINE`                        -0.011016     0.004366  -2.52334746  1.163831e-02
#`NUMBER OF COUNTS`                    72.565937    31.874140   2.27663983  2.282685e-02
hist(residuals(best_model_forward), main = "Histogram of Residuals", xlab = "Residuals", breaks = 40)
plot(x = BIC_no_na$`FINE AMOUNT`, y = residuals(best_model_forward), main = "Actual Fine Amount vs. Residuals", xlab = "Actual FINE AMOUNT", ylab = "Residuals ")
abline(h = 0, col = "red", lty = 2)