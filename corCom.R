
# 1. Getting started-----------

library(jmvtools)

jmvtools::check(home='C:\\Users\\MYCOM\\Documents\\jamovi')
options(jamovi_home='C:\\Users\\MYCOM\\Documents\\jamovi')
jmvtools::check()

jmvtools::install()

devtools::document()

###correlation-------

mydata<- tibble(mtcars)
mydata
class(mydata)

library(correlation)

cor1 <- mydata %>%
  select(c(mpg,wt,drat)) %>% correlation(.)

cor1
