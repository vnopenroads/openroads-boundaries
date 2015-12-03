#!/usr/bin/env python

# Boundary 2 CSV
# Takes a GeoJSON with boundary data for OpenRoads and spits out a CSV
# This script is called by prep-boundaries.py

import unicodecsv
import json
import sys

fn = sys.argv[1]

with open(fn + '.csv','w') as outfile:
  
  # write the CSV header
  writer = unicodecsv.writer(outfile)
  writer.writerow(['id','geosjon','type','name'])

  with open(fn + '.geojson', 'rb') as infile:
    boundaries = json.load(infile)

    for area in boundaries['features']:
      areaId = area['properties']['ID_OR']
      areaJSON = json.dumps(area)
      areaName = area['properties']['NAME']
      areaType = area['properties']['TYPE']
      
      writer.writerow([areaId, areaJSON, areaName, areaType])
