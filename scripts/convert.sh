#!/bin/bash

root=$(dirname `pwd`)
pathToData="$root"/data;
pathToZip="$pathToData"/zip;

mv "$pathToData"/FAST.nt "$pathToData"/FAST.nt.bak
for i in "$pathToZip"/*.zip; do
  unzip -o "$i" -d "$pathToData"/
done

for i in "$pathToData"/*.nt; do cat "$i" >> "$pathToData"/FAST.nt; done;
docker run -it --rm -v "$pathToData":/data rfdhdt/hdt-cpp rdf2hdt -f turtle /data/FAST.nt /data/FAST.hdt
