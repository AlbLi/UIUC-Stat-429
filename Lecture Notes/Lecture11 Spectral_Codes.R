###Chapter 6###
library(xts)
library(astsa)

#Xt= Acos(2 *pi*t*w)

#Aliasing
t = seq(0, 24, by=.01)
X = cos(2*pi*t*1/2) # 1 cycle every 2 hours (w=0.5)
tsplot(t, X, xlab="Hours")
T = seq(1, length(t), by=250) # observed every 2.5 hrs
points(t[T], X[T], pch=19, col=4)
lines(t, cos(2*pi*t/10), col=4) # (w=0.1)
axis(1, at=t[T], labels=FALSE, lwd.ticks=2, col.ticks=2)
abline(v=t[T], col=rgb(1,0,0,.2), lty=2)


#Example 6.1

#Xt=x1+x2+x3, q=3
#w1=0.006, w2=0.1, w3=0.4

#x1=2cos(2*pi*t*0.006)+3sin(2*pi*t*0.006)
#Amplitude of x1=sqrt(2^2+3^2)

x1 = 2*cos(2*pi*1:100*6/100) + 3*sin(2*pi*1:100*6/100)
x2 = 4*cos(2*pi*1:100*10/100) + 5*sin(2*pi*1:100*10/100)
x3 = 6*cos(2*pi*1:100*40/100) + 7*sin(2*pi*1:100*40/100)
x = x1 + x2 + x3
par(mfrow=c(2,2))
tsplot(x1, ylim=c(-10,10), main=expression(omega==6/100~~~A^2==13))
tsplot(x2, ylim=c(-10,10), main=expression(omega==10/100~~~A^2==41))
tsplot(x3, ylim=c(-10,10), main=expression(omega==40/100~~~A^2==85))
tsplot(x, ylim=c(-16,16), main="sum")

