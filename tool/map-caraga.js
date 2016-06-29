var fs = require('fs');
var geojsonStream = require('geojson-stream');
var through2 = require('through2');
var caragaMap = require('./caraga-map.json');

var c = through2({ objectMode: true }, function (feature, enc, callback) {
  if (caragaMap[feature.properties.ID_OR]) {
    feature.properties.ID_OR = caragaMap[feature.properties.ID_OR];

    // Also set the correct name
    feature.properties.NAME_1 = 'Region XIII (Caraga)';

    if (feature.properties.ID_1_OR) {
      feature.properties.ID_1_OR = caragaMap[feature.properties.ID_1_OR];
    }
    if (feature.properties.ID_2_OR) {
      feature.properties.ID_2_OR = caragaMap[feature.properties.ID_2_OR];
    }
    if (feature.properties.ID_3_OR) {
      feature.properties.ID_3_OR = caragaMap[feature.properties.ID_3_OR];
    }
  }
  this.push(feature);
  callback();
});

var r = fs.createReadStream(process.argv[2]);
var parse = geojsonStream.parse();
var stringify = geojsonStream.stringify();
var w = fs.createWriteStream(process.argv[2] + '.geojson');

r.pipe(parse)
  .on('error', function (err) { console.log('parse error', err); })
  .pipe(c)
  .pipe(stringify)
  .pipe(w);
