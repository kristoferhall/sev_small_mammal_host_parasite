# obtain_data_from_edi.bash downloads data files and EML from EDI

## download sev013 - SEV small mammal host-parasite data and EML
curl -o data/raw/sev013_sm_host_parasite.csv 'https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sev.13.270186&entityid=ab8e4f93cba8b4f07c07baa86678a29a'

curl -o metadata/sev013.xml 'https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-sev.13.270186&contentType=application/xml'

