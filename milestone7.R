xbarFA = mean(BIC$`FINE AMOUNT`)
xbarMF = mean(BIC$`MAXIMUM FINE`)
nFA= 11184
nMF= 11184
tFA = -qt(0.025, nFA-1)
tMF = -qt(0.025, nMF-1)
sFA = sd(BIC$`FINE AMOUNT`)
sMF = sd(BIC$`MAXIMUM FINE`)
xbarFA - tFA*sFA/sqrt(nFA)
# 2198.686
xbarFA + tFA*sFA/sqrt(nFA)
# 2358.706
xbarMF - tMF*sMF/sqrt(nMF)
# 5370.892
xbarMF + tMF*sMF/sqrt(nMF)
# 5748.994