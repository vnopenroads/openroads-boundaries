#!/usr/bin/env python

# Boundary 2 CSV
# Takes a GeoJSON with boundary data for OpenRoads and spits out a CSV
# This script is called by prep-boundaries.py

import unicodecsv
import json
import sys

fn = sys.argv[1]
test = False
min_id = 13000000000
max_id = 14000000000

if 'test' in sys.argv:
  test = True

def generate_area(area):
  areaId = area['properties']['ID_OR']
  areaJSON = json.dumps(area)
  areaName = area['properties']['NAME']
  areaType = area['properties']['TYPE']

  row = [areaId, areaJSON, areaType, areaName]

  return row

with open(fn + '.csv','w') as outfile:
  
  # write the CSV header
  writer = unicodecsv.writer(outfile)
  writer.writerow(['id','geojson','type','name'])

  with open(fn + '.geojson', 'rb') as infile:
    boundaries = json.load(infile)

    for area in boundaries['features']:
      if test:
        # Test data only contains a sample of the areas
        if min_id <= int(area['properties']['ID_OR']) < max_id:
          writer.writerow(generate_area(area))
      else:
        writer.writerow(generate_area(area))
