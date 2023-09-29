library(TSA)
library(astsa)

t=1:96; cos1=cos(2*pi*t*4/96); cos2=cos(2*pi*(t*14/96+.3))
plot(t,cos1, type='o', ylab='Cosines')
lines(t,cos2,lty='dotted',type='o',pch=4)

y=2*cos1+3*cos2; plot(t,y,type='o',ylab=expression(y[t]))

periodogram(y); abline(h=0); axis(1,at=c(0.04167,.14583))


#AR(1), phi=0.8
ARMAspec(model=list(ar=c(0.8)))



#Example 6.7, 6.9, 6.10
library(astsa)
arma.spec(ar=c(0.8))

par(mfrow=c(4,1))
arma.spec(main="White Noise", col=4)
arma.spec(ma=-.5, main="Moving Average", col=4)
arma.spec(ar=c(1,-.9), main="Autoregression", col=4)
arma.spec(ar=c(0.8), ma=0.5, main="ARMA(1,1)", col=4)

par(mfrow=c(3,1))
y=arima.sim(model=list(ar=0.8),n=200)
tsplot(y)
arma.spec(ar=c(0.8), main="AR(1)", col=4)

sp=spec(y)

