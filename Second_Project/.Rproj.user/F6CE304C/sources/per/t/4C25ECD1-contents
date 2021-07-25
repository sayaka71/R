#image_analysis ----
# import dataset
df_B <- read.csv("Weibull_B_Shape.csv")

names(df_B) <- c("Sample", "AR", "C", "ED", "S", "L", "P", "A")
head(df_B)

# 4~8 mm name: df_B_4_8
df_4_8 <- c(6047, 6051, 6055, 6058, 6061, 6064, 6068, 6073, 6077, 6081, 6085)
df_B_4_8 <- df_B[1:11,]

for (i in 1:11){
  df_B_4_8[i,] <- df_B[df_B$Sample == df_4_8[i],]
}

df_B_4_8
summary(df_B_4_8)
df_B_4_8$Sample <- c(1:11)
df_B_4_8

# plot
library(ggplot2)
ggplot(data = df_B_4_8, aes(x=A, y=C, colour=sample())) + geom_point(size=8, alpha=0.4)

# except name
dat <- df_B_4_8[,c(2:7)]
plot(dat, pch=as.numeric(df_B_4_8$name))

# PCA
# dat_PCA <- data.frame(Sample = df_B_4_8$Sample, AR = df_B_4_8$Aspect_Ratio, C = df_B_4_8$Circulality, ED = df_B_4_8$Equal_Diameter, S = df_B_4_8$Shortest_Length, L = df_B_4_8$Longest_Length, P = df_B_4_8$Perimeter, A = df_B_4_8$Area)
# head(dat_PCA)

# pca plot (all)
df_B
df_B$Sample = c(1:30)
df_B
pca_model <- prcomp(df_B[,2:8], scale = T)
summary(pca_model)
par(mfrow = c(1,2))
biplot(pca_model, main="PCA")

# pca plot　(4-8mm)
pca_model <- prcomp(df_B_4_8[,2:8], scale = T)
summary(pca_model)
par(mfrow = c(1,2))
biplot(pca_model, main="PCA")

# pc1 pc2 axis plot
pca_df <- data.frame(Sample = df_B_4_8$Sample,PC1 = pca_model$x[,1], PC2 = pca_model$x[,2])
pca_df
ggplot(data = pca_df, aes(x = PC1, y = PC2)) + geom_point(size = 8, colour = "red") +
  geom_text(colour = "white", aes(PC1, PC2, label = Sample), size = 5) + 
  annotate("text", x=-1.8,   y=0.9, label="Gully bed", size = 6, fontface = 'bold') + 
  annotate("text", x=2.5,   y=-0.5, label="Wall", size = 6, fontface = 'bold')

ggsave('fig_4b.eps')
par(mfrow = c(1,1))




