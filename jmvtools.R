
# install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))

library(jmvtools)

jmvtools::check(home='C:\\Users\\seol\\Documents\\jamovi')
options(jamovi_home='C:\\Users\\seol\\Documents\\jamovi')
jmvtools::check()

# download jmvbaseR
# https://github.com/jamovi/jmvbaseR

# install it and copy it into jamovi_home

# setwd !!!

setwd("~/jmvbaseR-master")

# 처음때만 실행, compile 기능을 수행함.
jmvtools::install()   

## Creating ttest module----------------------

setwd("~/jmvbaseR-master")

jmvtools::create('SuperAwesome')

setwd('SuperAwesome')

# addAnalysis()
# addAnalysis(name=ttest, title=independent)

jmvtools::addAnalysis(name='ttest', title='Independent Samples T-Test')

jmvtools::install()


## Creating Correlation module---------

jmvtools::create('Correlations')

setwd('Correlations')

# Creating module box------

#call addAnalysis(), name correlation

jmvtools::addAnalysis(name='correlation', title='correlation')

# see "*.a.yaml"
# insert function into "*.b.R"

jmvtools::install()

# go to directory "Correlations", and side load "correlations_0.0.0..jmo"
# in jamovi program




