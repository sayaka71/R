# ----sample data analysis----
df <- read.csv("4453.csv")
summary(df)
# ggplot
library(ggplot2)
fig_image1 <- ggplot(df, aes(x = Area, y = Aspect_Ratio, colour = name)) + geom_point()
fig_image1

# names以外のデータ
df_data <- df[, c(1:7)]

# ----PCA分析，主成分分析----
prcomp(df_data, scale = TRUE)
biplot(prcomp(df_data, scale=TRUE))

# ----スピアマンの相関係数（正規分布していないとき）----
cor(df_data, method = "spearman")
pairs(df_data,panel=panel.smooth,lwd=2)

# マルチコの削除，Areaと短軸長軸等価直径は相関が強いのでAreaだけ残す
df_data <- df[, c(1,2,7)]

# PCA分析，主成分分析
prcomp(df_data, scale = TRUE)
biplot(prcomp(df_data, scale=TRUE))

# 標準化する（最大値・最小値が変数によってでちがうから）
df_scaled <- data.frame(scale(df_data))
head(df_scaled)

# 名前を入れる
df_scaled[, "name"] <- df$name
head(df_scaled)

# 決定木（Decision Tree）
library(rpart)
model <- rpart(name ~ ., data = df_scaled)
model   # Area面積で全部決まる結果に...

# Area面積抜きで決定木してみる, 最大深度= 4とする
df_cir_as <- df_scaled[,2:4]
model <- rpart(name ~ ., data = df_cir_as, control = rpart.control(maxdepth = 4))
model
library(rpart.plot)
rpart.plot(model, extra = 4)

# ----4472と4485で区別してみる決定木----
# df_4472_4485 <- df_cir_as[df_cir_as$name == "IMG_4472" | df_cir_as$name == "IMG_4485",]
# model <- rpart(name ~ ., data = df_4472_4485, control = rpart.control(maxdepth = 4))
# model
# library(rpart.plot)
# rpart.plot(model, extra = 4)
# 標準化せずに決定木　＜circurality, Aspect_ratio＞
df_4472_4485_raw <- df[df$name =="IMG_4472" | df$name == "IMG_4485",]
head(df_4472_4485_raw)
df_4472_4485_raw <- df_4472_4485_raw[,c(2,7,8)]
model <- rpart(name ~ ., data = df_4472_4485_raw, control = rpart.control(maxdepth = 4))
model
library(rpart.plot)
rpart.plot(model, extra = 4)
