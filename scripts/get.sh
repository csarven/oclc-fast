#!/bin/bash

#http://experimental.worldcat.org/fast/download/FASTAll.nt.zip
#data.txt contains individual URLs which happen to be more than what's in FASTAll.nt.zip

root=$(dirname `pwd`)
pathToData="$root"/data;
pathToZip="$pathToData"/zip;

mkdir -p "$pathToZip";

while read url; do
  wget "$url" -P "$pathToZip"/
done < uri-list
