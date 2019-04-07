#!/bin/bash

# Usage: bash ecostress-download.sh USERNAME PASSWORD URL
# USERNAME and PASSWORD are your NASA EarthData credentials
# URL is to the html page where the ECOSTRESS h5 have been staged for you
# Example: bash ecostress-download.sh spestana password1 https://e4ftl01.cr.usgs.gov/PullDir/030475988817891/

wget -r -np -R "index.html*" --user $1 --password $2 $3
