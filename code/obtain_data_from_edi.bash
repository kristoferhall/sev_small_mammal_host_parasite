#!/usr/bin/env bash

# download sev013 from EDI - small mammal host-parasite data and XML
# wget does not seem to work, using curl works
# wget -nc -O data/raw/sev013_sm_host_parasite.csv https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.13.270186&entityid=ab8e4f93cba8b4f07c07baa86678a29a 
# wget -nc -O metadata/sev013.xml https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-sev.13.270186&contentType=application/xml

curl -o data/raw/sev013_sm_host_parasite.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.13.270186&entityid=ab8e4f93cba8b4f07c07baa86678a29a'

curl -o metadata/sev013.xml 'https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-sev.13.270186&contentType=application/xml'


# download small mammal seasonal trapping data

# download met dat - sta 40 and 44 are of interest - 1989-1998