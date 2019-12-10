#!/bin/bash
# This is a collection of functions I use to make life easier.

latcalc () {
 if [ -z "$1" ]; then echo -n "Ping Latency in ms: " ; read lat;
 else lat=$1 ; fi ;
 if [ -z "$2" ] ; then echo -n "Typical TCP window: (default is 131072) ";
  read win;
 else win=$2 ; fi ;
  echo | awk -v lat="$lat" -v win="$win" '{ t = ((win * 8) / (lat / 1000)) /\
 1048576 ; print t, "Mbps" ; }' 
}

epochconv () {
echo "$1" | perl -e '$it = <> ; use POSIX "strftime"; my $date = strftime'"\
"' "%Y/%m/%d %H:%M:%S", localtime $it ; print "$date" ' ;
}