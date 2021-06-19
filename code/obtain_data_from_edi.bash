#!/usr/bin/env bash

# download sev013 from EDI - small mammal host-parasite data and XML
# wget does not seem to work, using curl works
# wget -nc -O data/raw/sev013_sm_host_parasite.csv https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.13.270186&entityid=ab8e4f93cba8b4f07c07baa86678a29a 
# wget -nc -O metadata/sev013.xml https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-sev.13.270186&contentType=application/xml

curl -o data/raw/sev013_sm_host_parasite.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.13.270186&entityid=ab8e4f93cba8b4f07c07baa86678a29a'

curl -o metadata/sev013.xml 'https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-sev.13.270186&contentType=application/xml'


# download small mammal seasonal trapping data
curl -o data/raw/SEV008_long.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.8.297977&entityid=253ee7e2d8c5a9984633593e4c65d5fd'

curl -o data/raw/SEV008_wide.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.8.297977&entityid=351d09c6730cb2e2b45bf97848669918'

curl -o data/raw/sev008_rodentpopns_qaqcd_final_data.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.8.297977&entityid=243c5530efdcb6473430889cdac1bed4'

curl -o data/raw/SEV_Small_Mammals_Species_List.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.8.297977&entityid=c9ea37c5a0a6b28a90828fdaaeafb0e7'

curl -o metadata/sev008_metadata.xml 'https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-sev.8.297977&contentType=application/xml'

curl -o references/SEV_SMAMMAL_DATA_WRANGLING.R 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.8.297977&entityid=af17431d49a0e46dba386ad4b71e1278'

# download met dat - sta 40 and 44 are of interest - 1989-1998
curl -o data/raw/Sevilleta_LTER_Hourly_Meteorological_Data_1988_1994.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.1.14&entityid=87ff32c8e179e69743c6514cbbc8b31c'

curl -o data/raw/Sevilleta_LTER_Hourly_Meteorological_Data_1995_1999.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.1.14&entityid=dbe548a38a8dc4c1c829657cee190c4d'

curl -o metadata/SEV_Meteorology.xml 'https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-sev.1.14&contentType=application/xml'

