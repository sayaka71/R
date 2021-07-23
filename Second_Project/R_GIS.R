# install packages
library(sf)
library(mapview)
library(rnaturalearth)
library(units)
library(remotes)
# remotes::install_git("https://gitlab.com/uribo/jmastats")
library(jmastats)
library(dplyr)
library(patchwork)
# 兵庫県の行政区域データを用意．
# 統計データとして，平成17, 22, 27年の国勢調査の人口データを使用（e-statからダウンロード可能）
library(jpndistrict)
library(here)
sf_pref28 <- jpn_pref(28, district = TRUE)
df_h17to27_pops <- readr::read_rds(here::here("data-raw", "population_h17-h22.rds"))
glimpse(sf_pref28)

# base
plot(sf_pref28)
plot(sf_pref28[,  "city"])

# ggplot
library(ggplot2)
sf_pref28[, "city"] 
ggplot() + 
  geom_sf(data = sf_pref28, aes(fill = city)) +
  theme_void()

  