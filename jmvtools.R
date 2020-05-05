
# install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))

# 1. Getting started-----------

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

# 2. Creating ttest module----------------------

setwd("~/jmvbaseR-master")

jmvtools::create('SuperAwesome')

setwd('SuperAwesome')

jmvtools::install()


# addAnalysis()
# addAnalysis(name=ttest, title=independent)

jmvtools::addAnalysis(name='ttest', title='Independent Samples T-Test')

jmvtools::install()


## Creating Correlation module---------

setwd("~/jmvbaseR-master")

jmvtools::create('Correlations')

setwd('Correlations')

# Creating module box------

#call addAnalysis(), name correlation

jmvtools::addAnalysis(name='correlation', title='correlation')

# see "*.a.yaml"
# insert function into "*.b.R"

# compiler mode: "tame" in UI file.
# https://dev.jamovi.org/ui-basic-design.html

jmvtools::install()

# go to directory "Correlations", and side load "correlations_0.0.0..jmo"
# in jamovi program
# Exercising Reliability analysis module in jamovi




