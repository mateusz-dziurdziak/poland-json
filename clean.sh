#!/bin/bash

set -e
set -o nounset

for file in geo/*/*.geo.json; do
    jq -c '.features[].properties |= {"teryt": (if .JPT_KOD_JE != null then .JPT_KOD_JE else .teryt end)}' "$file" > "$file".tmp && mv "$file".tmp "$file"
done
