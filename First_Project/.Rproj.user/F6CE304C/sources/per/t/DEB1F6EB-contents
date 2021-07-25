# --< install packages >
# tools → install: "ggplot2", "plotly", "hexbin"
# library(ggplot2)で使えるようにする！！
library(ggplot2)
library(plotly)
library(hexbin)
library(gplots)
library(RColorBrewer)
# --< data = cars >--
head(cars)
summary(cars)
# normal plot 線形回帰
plot(dist ~ speed,data = cars, type = "p", xlab = "Speed [km/h]", ylab = "Stopping Dist [km]")
lm.result <- lm(dist ~ speed, data = cars)
abline(lm.result, col = "red")
title("cars data")
summary(lm.result)
# ggplot() + geom_point(data = cars, aes(speed, dist))
# ggplot()で図を作成，geom_point()で散布図
# geom_smoothで線形回帰，95%信頼区間
figure.1 <- ggplot(data = cars, aes(speed, dist)) + geom_point(size = 2,color = "red") + geom_smooth(method = "lm") + ggtitle("Cars Data") + labs(x = "Speed [km/h]", y = "Stopping Dist [km]") 
figure.1 <- ggplotly(figure.1)
figure.1

# --< data = diamonds >--
head(diamonds)
summary(diamonds)
# hexbin (geom_hex), scale_fill_gradient()でグラデーション
figure.2 <- ggplot(diamonds, aes(carat, price)) + geom_hex() + labs(title = "Diamond") + scale_fill_gradient(low = "lightblue1",
                                                                                                             high = "darkblue",
                                                                                                             trans = "log10")
figure.2 <- ggplotly(figure.2)
figure.2

# --< data = Orange >--
head(Orange)
summary(Orange)
# 成長日記グラフ
figure.3 <- ggplot(Orange, aes(x = age, y = circumference, colour = Tree)) + geom_line() +  scale_color_brewer(palette = "Set1") + labs(x = "age (樹齢)", y = "circumference (周囲長)", title = "Orange Tree")
figure.3 <- ggplotly(figure.3)
figure.3


# --< data = mtcars >--
head(mtcars)
summary(mtcars)
heatmap.2(as.matrix(mtcars))
