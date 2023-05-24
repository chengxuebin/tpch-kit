#!/bin/bash

file="loaddata.sql"

if [ ! -f "$file" ] ; then
    touch "$file"
fi

echo 'USE tpch;' >> "$file"
echo 'SET FOREIGN_KEY_CHECKS=0;' >> "$file"

dir="$1"
for tbl in "$dir"/*.tbl; do
    table=$(basename "${tbl%.*}")
    echo "LOAD DATA LOCAL INFILE '$tbl' INTO TABLE $table" >> "$file"
    echo "FIELDS TERMINATED BY '|' LINES TERMINATED BY '|\n';" >> "$file"
done
echo 'SET FOREIGN_KEY_CHECKS=1;' >> "$file"

