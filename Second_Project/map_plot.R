# https://at-noda.com/econwiki/index.php?R%E3%81%A7%E5%9C%B0%E5%9B%B3%E4%BD%9C%E6%88%90
# mapping plot ----

setwd("/Users/brunk/Downloads/R_downloads/ne_10m_land") 

# install.packages("maptools", dependencies=TRUE) # maptoolsパッケージのインストール
# install.packages("rgdal")
library(maptools) # maptoolsパッケージの読み込み
library(sf)
library(rgdal)
library(prettymapr)
world <- readOGR("ne_10m_land.shp") # シェープファイルの読み込み（7つのファイルが揃っていないとエラーが出るので注意して下さい）


lonlim_u = c(130,140)
latlim_u = c(28,50)
plot(world, xlim=lonlim_u, ylim=latlim_u, axes=TRUE, xlab="Longitude", ylab="Latitude",cex.lab=1)
segments(130.18370, 32.45107, 135.10000, 30.10000, lwd=2, col="black") # 適当な位置まで線を引く
points(130.18370, 32.45107, col=2, pch=17) 
text(141.50167, 30.00000, labels="Mt.Unzen", cex=1.5, col="black") 
# 方位描写
addnortharrow(pos = "topleft", padin = c(0.15, 0.15), scale = 0.8, lwd = 1, border = "black",text.col = "black")  

