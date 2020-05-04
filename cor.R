
devtools::install_github("easystats/correlation")

library(correlation)
library(tidyverse)

# correlation--------------

cor<- correlation(iris)
cor
summary(cor)
as.table(cor)

library(dplyr)
library(see)

cor %>% as.table() %>% plot()

# Grouped dataframes--------------

iris %>% 
  select(Species, Sepal.Length, Sepal.Width, Petal.Width) %>% 
  group_by(Species) %>% 
  correlation()

# Tetrachoric, Polychoric, Biserial------------

correlation(iris, include_factors = TRUE, method = "auto")

# Partial Correlations-------------

iris %>% 
  correlation(partial = TRUE) %>% 
  summary()

# Gaussian Graphical Models (GGMs)--------------

library(see) # for plotting
library(ggraph) # needs to be loaded

mtcars %>% 
  correlation(partial = TRUE) %>% 
  plot()

# Multilevel Correlations---------------

iris %>% 
  correlation(partial = TRUE, multilevel = TRUE) %>% 
  summary()

# if the partial argument is set to FALSE, 
# it will try to convert the partial coefficient into regular ones

iris %>% 
  correlation(partial = FALSE, multilevel = TRUE) %>% 
  summary()
