library(tidyverse)
library(haven)

# load data and save into new data frame
nfhs <- read_dta("IAHR52FL.dta")

# select the variables and save into new data frame
hh <- select(nfhs, hhid:shstruc) 
