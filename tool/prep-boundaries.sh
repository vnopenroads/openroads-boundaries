#!/bin/bash

# This script prepares Philippine boundary data for import into the OpenRoads
# database. It ingests a series of shapefiles and outputs one CSV file that
# can be copied to the postgres db.
#
# $ bash prep-boundaries.sh
#     Generates a CSV for all boundaries
# $ bash prep-boundaries.sh test
#     Generates a CSV for only the test boundaries, containing all areas in 
#     Region IV-B (Mimaropa) - 13000000000


FN="../tmp-export/admin-boundaries"
SOURCE="../polygons/*.shp"

args=("$@")

rm -r ../tmp-export
mkdir ../tmp-export

for i in $(ls $SOURCE); do
  if [ -f tmp-merged.shp ]
  then
    echo "merging……"
    ogr2ogr -update -append tmp-merged.shp $i
  else
    echo "merging the shapefiles" 
    ogr2ogr tmp-merged.shp $i
  fi
done

echo "converting the merged shapefile to geosjon"
ogr2ogr -f 'GeoJSON' $FN.geojson tmp-merged.shp

# Clean up after ourselves
rm tmp-merged.*

echo "generating the CSV from the geosjon"
if [ "${args[0]}" = "test" ]; then
  python boundary2csv.py $FN test
else 
  python boundary2csv.py $FN
fi
