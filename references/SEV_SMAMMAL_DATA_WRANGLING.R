###### DATA WRANGLING SCRIPT FOR SEV RODENTS ######
###### Date: August 11, 2019 ######
rm(list=ls(all=TRUE)) #give R a blank slate

# library(plyr)  # plyr::revalue is used, so the plyr package must be installed on computer - not loading whole library because it masks other functions.
library(tidyverse)
library(reshape2)


#set working directory --> adjust to your computer
#setwd("C:/Users/jrudgers/Desktop/SEV Data/Mammals/")

######  SEV  ######-----------
#read in data: sev008_rodentpopns_qaqc_final_data.tsv (N=33567) located SEV Data>Regional Rodents
SEV<-read_csv(file.choose())
summary(SEV)

str(SEV)
# convert a few variables to factor
SEV <- SEV %>% 
  mutate(season = as.factor(season),
         recap = as.factor(recap),
         location = as.factor(location),
         species  = as.factor(species),
         year   = as.numeric(year))

#exclude recaps (N=20331) 
SEV<-subset(SEV,recap=="n")

### FURTHER SUBSET OPTIONS currently disabled ###
#exclude trap = NA (N=20320) (these are cases when trap number was not written down)
#SEV<-subset(SEV,!(is.na(trap)))

#cull to summer/fall samples only (N=9908)
#SEV<-subset(SEV,season!="1")

#remove squirrels (N=9560)
#SEV<-subset(SEV,species!="SPSP")
#SEV<-subset(SEV,species!="AMIN")
#SEV<-subset(SEV,species!="AMLE")

#remove chipmunks (N=9530)
#SEV<-subset(SEV,species!="EUQU")
#SEV<-subset(SEV,species!="EUDO")

#remove rabbits (N=9529)
#SEV<-subset(SEV,species!="SYAU")v

#standardize habitat code
SEV$habitat<-as.factor(plyr::revalue(SEV$location,
                               c(blugrama="Blue grama grassland",goatdraw="Pinon-juniper woodland",
                                 '5pgrass'="Black grama grassland",'5plarrea'="Creosote shrubland",
                                 rsgrass="Black grama grassland",rslarrea="Creosote shrubland",
                                 savanna="Juniper savanna",two22="Juniper savanna")))

#create ecosystem type code
SEV$ecosystem<-as.factor(plyr::revalue(SEV$location,
                                 c(blugrama="grassland",goatdraw="woodland",
                                   '5pgrass'="grassland",'5plarrea'="shrubland",
                                   rsgrass="grassland",rslarrea="shrubland",
                                   savanna="woodland",two22="woodland")))

#create web/grid code
SEV$web_id<-as.factor(paste(SEV$location,SEV$web,sep="_"))


#create a season column that lumps summer data with fall for early years
SEV$season_fs<-as.factor(plyr::revalue(as.factor(SEV$season),c('2'="fall",'1'="spring",'3'="fall")))
summary(SEV)

#create a count variable so that mammals can be summarized
SEV$count<-as.numeric(1)



#reshape so that species are columns
#for now these will be total tallies, we will get per trap night later
SEVmatrix1<-dcast(SEV,ecosystem+habitat+location+year+season_fs+season+web_id~species,value.var="count",function(x) sum(x),fill=0)

#look at new dataframe (724 X 38)
summary(SEVmatrix1)

#normalize by number of trap nights
#create a separate vector of the number of trapping nights for each web
#SEV$YS<-as.factor(paste(SEV$year,SEV$season,sep="_"))
#library(tidyverse)
TN<-SEV %>% 
  group_by(year,season,web_id) %>% 
  summarise(max_nights=max(night,na.rm=TRUE))



#merge TN into SEVmatrix
SEVmatrix2<-merge(TN,SEVmatrix1,by=c("year","season","web_id"))
summary(SEVmatrix2)

#subset to species matrix only
SEVspp<-SEVmatrix2[,9:39]
head(SEVspp)

#and divide by trap nights X 148 traps per web
SEV_TN<-SEVspp %>%
  mutate_all(funs(. /(SEVmatrix2$max_nights*148)))
summary(SEV_TN)

#get rid of trap night count (357 X 38)
SEVmatrix3<-select(SEVmatrix2,-max_nights)

#put back together adjusted counts with variable names
SEV008matrix<-cbind(SEVmatrix3[,1:7],SEV_TN)

#look at data (724 X 38)
summary(SEV008matrix)

#write out data
write.csv(SEV008matrix,"SEV008_wide.csv", row.names = FALSE)


#gather into long format (22444X9)
SEVlong<-as.data.frame(SEV008matrix %>%
  gather(key=species,value = count,-c(year,web_id,season,season_fs,location,ecosystem,habitat)))
SEVlong$species<-as.factor(SEVlong$species)
SEVlong<-subset(SEVlong,count>0)
#write out long format data (3726X9)
write.csv(SEVlong,"SEV008_long.csv", row.names=FALSE)
