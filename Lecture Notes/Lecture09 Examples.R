library(astsa)

#Example 4.31
tsplot(rec)
acf2(rec)

sarima(rec, p=2, d=0, q=0) # fit the model
sarima.for(rec, n.ahead=24, p=2, d=0, q=0)
abline(h=61.8585, col=4) # display estimated mean


tsplot(gnp)
tsplot(log(gnp))
acf2(log(gnp))
tsplot(diff(log(gnp)))
acf2(diff(log(gnp)))

sarima(diff(log(gnp)),1,0,0)
sarima(log(gnp), 1, 1, 0) # AR(1)


sarima(diff(log(gnp)), 1, 0, 0) # AR(1)
sarima.for(log(gnp),n.ahead=24, 1, 1, 0) # AR(1)
sarima.for(diff(log(gnp)),n.ahead=5, 1, 0, 0)

#Example 5.15
par(mfrow=c(2,1))
tsplot(cardox, col=4, ylab=expression(CO[2]))
title("Monthly Carbon Dioxide Readings - Mauna Loa Observatory ", cex.main=1)
tsplot(diff(diff(cardox,12)), col=4,
       ylab=expression(nabla~nabla[12]~CO[2]))

acf2(diff(diff(cardox,12)))

sarima(cardox, p=0,d=1,q=1, P=0,D=1,Q=1,S=12)
sarima(cardox, p=1,d=1,q=1, P=0,D=1,Q=1,S=12)

sarima.for(cardox, 60, 1,1,1, 0,1,1,12)
abline(v=2018.9, lty=6)
##-- for comparison --##
sarima.for(cardox, 60, 0,1,1, 0,1,1,12) # not shown

