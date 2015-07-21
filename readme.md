This is a set of indicative political boundaries for the Philippines, used across the OpenRoads projects. Every area has an ID that is unique to the OpenRoads project, but the intention is to add a reference to the [PSGC](http://www.nscb.gov.ph/activestats/psgc/) wherever possible.

## Contributing PSGC
We'd be very happy to accept contributions that map each area in the shapefile to the PSGC. Please make sure you update both the reference file `openroads-admin-ids.csv` and the polygon shapefiles.

## Custom IDs
Since the original shapefiles didn't contain any reference to the PSGC, or contain there own unique ID, the OpenRoads project constructed its own ID.
This ID consists of 10 or 11 characters and has a structure similar to the PSGC.

| region | province | municipality | barangay |
| --- | --- | --- | --- |
| [0 / 00] | [00] | [0000] | [000] |

The region code consists of 1 or 2 digits.

In the original shapefiles, the provinces and municipalities contained some sort of ID. This was used as the basis to construct the OpenRoads ID. The barangay IDs were assigned in a more random fashion.

For example:

| id | type | name |
| --- | --- | --- |
| 2000000000 | 1 | Region II (Cagayan Valley) |
| 2110000000 | 2 | Batanes |
| 2110147000 | 3 | Basco |
| 2110147001 | 4 | Chanarian |

## Caveat
The shapefiles don't reflect [the latest changes](http://www.nscb.gov.ph/pressreleases/2015/PR-2015_24June2015_psgc.asp) to the administrative boundaries, most notably the creation of the Negros Island region.

## Attribution and license
