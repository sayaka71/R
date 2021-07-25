#ヒストグラム＋密度関数----

df <- read.csv("csv/IMG_6046.csv")
summary(df)

#ggplot----
#ダサくなる
library(ggplot2)
ggplot(data=df, aes(x=Circularity)) + geom_histogram(aes(y=..density..))

ggplot(data = df, aes(x=Circularity, y=Perimeters)) + geom_density2d()
