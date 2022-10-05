library(tidyverse)
library(haven)

# load data and save into new data frame
nfhs <- read_dta("IAHR52FL.dta")

# select the variables and save into new data frame
hh <- select(nfhs, hhid:shstruc) 

# create histogram plot
ggplot(data = nfhs, mapping = aes(x = hv009)) +
  geom_histogram(binwidth = 1) +
  xlab("Number of household members")


# create a new data frame that contains only urban households
df_new <- subset(hh, subset = hv025 == 1)

# set type of urban with categorical variable
df_new$hv026<-as.factor(df_new$hv026)



# create a boxplot plot for the distribution of household size by type of urban area
boxplot(df_new$hv009 ~ df_new$hv026,names=c("large city","small city", "town"),ylab="HH Size")
typeof(df_new$hv026)


# find the means of the number of household members
df_new %>%
  group_by(hv026) %>% 
  summarise(mean(hv009)) 

# find the medians of the number of household members
df_new %>%
  group_by(hv026) %>% 
  summarise(median(hv009))