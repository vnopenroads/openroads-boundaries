## Prep boundaries

The `prep-boundaries.sh` takes the original shapefiles and generates a CSV that can be imported into the OpenRoads postgres db.

Since tests are being performed on a limited amount of administrative boundaries, it is possible to generate a CSV that only contains the relevant areas. Use `$ prep-boundaries.sh test` for this.
Any time a new administrative area is added to the tests, the script should run again and the database updated. Make sure to include its ID in the TEST_AREAS var.