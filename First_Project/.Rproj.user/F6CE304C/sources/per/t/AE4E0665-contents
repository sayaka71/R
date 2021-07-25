# 主成分分析の練習
x <- trees$Height
y <- trees$Girth
z <- trees$Volume
plot(y,z)
tree_data <- data.frame(y = y, z = z)
# PCA
pca_model <- prcomp(tree_data, scale = T)
summary(pca_model)
# 図示
par(mfrow = c(1,2))
plot(z ~ y, data = tree_data, main = "Original")
biplot(pca_model, main="PCA")
par(mfrow = c(1,1))
