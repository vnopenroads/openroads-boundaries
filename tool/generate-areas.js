'use strict';
/* This script prepares boundary data for import into the OR database */

var csv = require('csv');
var fs = require('fs');
var _ = require('lodash');
var geojsonExtent = require('geojson-extent');

// For countries we only add the bbox, not the full geometry
const country = require('../polygons/or_Country-bbox.json');
const regions = require('../polygons/or_Region.json');
const provinces = require('../polygons/or_Province.json');
const municipalities = require('../polygons/or_Municipality.json');
const barangays = require('../polygons/or_Barangay.json');

const areas = country.features
      .concat(regions.features)
      .concat(provinces.features)
      .concat(municipalities.features)
      .concat(barangays.features);

// Takes an array with geojson feature objects [{geojson},{geojson}]
// The first map substitutes the full boundary for each area with a
//   simpler polygon containing only the bounding box.
// The second map turns it into: [ [id,geojson,type,name],[id,geojson,type,name] ]

var final = _(areas)
  .map((area) => _(area)
    .update('geometry', (a) => geojsonExtent.polygon(area))
    .value()
  )
  .map((o) => [
    o.properties.ID_OR,
    o,
    o.properties.TYPE,
    o.properties.NAME
  ])
  .value();

var csvData = csv.stringify(final);
var writer = fs.createWriteStream('./admin-boundaries-db.csv');

writer.on('finish', function () {
  console.log('Success! Boundaries were written to CSV file.');
});
csvData.pipe(writer);
