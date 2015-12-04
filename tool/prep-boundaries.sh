#!/bin/bash

# This script prepares Philippine boundary data for import into the OpenRoads
# database. It ingests a series of shapefiles and outputs one CSV file that
# can be copied to the postgres db.
#
# $ bash prep-boundaries.sh
#     Generates a CSV for all boundaries
# $ bash prep-boundaries.sh test
#     Generates a CSV for only the test boundaries


FN="../tmp-export/admin-boundaries"
SOURCE="../polygons/*.shp"

# All areas from Region IV-B (Mimaropa) - 13000000000 are automatically being included.
INDIVIDUAL_TEST_AREAS='"1350635003","1390751003","2180316013","2180316014","3771538003","4120174012","7150216000","7691413004","17420820003","17420844025","17420846003"'

args=("$@")

rm -r ../tmp-export
mkdir ../tmp-export

for i in $(ls $SOURCE); do

  if [ "${args[0]}" = "test" ]; then
    # Filter the shapefiles to only contain the admin areas we're interested in
    #ogr2ogr -where 'ID_OR in ('$TEST_AREAS')' tmp_areas.shp $i
    ogr2ogr -where 'ID_OR in ('$INDIVIDUAL_TEST_AREAS') OR ID_OR between "13000000000" and "13999999999"' tmp_areas.shp $i
  else
    ogr2ogr tmp_areas.shp $i
  fi

  if [ -f tmp-merged.shp ]
  then
    echo "merging……"
    ogr2ogr -update -append tmp-merged.shp tmp_areas.shp
  else
    echo "merging the shapefiles" 
    ogr2ogr tmp-merged.shp tmp_areas.shp
  fi

  # Clean up the temp shapefile
  rm tmp_areas.*

done

echo "converting the merged shapefile to geosjon"
ogr2ogr -f 'GeoJSON' $FN.geojson tmp-merged.shp

# Clean up after ourselves
rm tmp-merged.*

echo "generating the CSV from the geosjon"
python boundary2csv.py $FN