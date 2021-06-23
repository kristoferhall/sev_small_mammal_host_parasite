# KM Hall
# 2021
#
# Initial look at SEV small mammal host-parasite data, seasonal trapping data, and 
# meteorological data

library(tidyverse)
library(lubridate)


# function for viewing variable in data
var_counts <- function(data, var) {
  View(data %>% 
         group_by( {{ var }}) %>% 
         summarize(n()))
}


# host parasite data ----
hp_raw <- read_csv("data/raw/sev013_sm_host_parasite.csv")


# a few variables need to be renamed
hp_raw <- hp_raw %>% 
  rename(web_number = `web#`,
         nk_number = `nk#`,
         msb_number = `msb#`)

names(hp_raw)

var_counts(hp_raw, date)
var_counts(hp_raw, site)
var_counts(hp_raw, season)
var_counts(hp_raw, trap_night)
var_counts(hp_raw, web_number)
var_counts(hp_raw, trap_number)
var_counts(hp_raw, host_species)
var_counts(hp_raw, nk_number)
var_counts(hp_raw, host_sex)
var_counts(hp_raw, msb_number)
var_counts(hp_raw, feces)
var_counts(hp_raw, ecto)
var_counts(hp_raw, necrop)
var_counts(hp_raw, helminths)
var_counts(hp_raw, tissue)
var_counts(hp_raw, p_id)
var_counts(hp_raw, p_sex)
var_counts(hp_raw, p_count)
var_counts(hp_raw, comments)






