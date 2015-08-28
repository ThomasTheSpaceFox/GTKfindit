#!/bin/bash

WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI

FINDIT=$(cat find.it.txt)
DIRECT=$(cat find.direct.txt)
echo "GTKfindit -find what you need." > results.txt
echo "Search:$FINDIT" >> results.txt
echo "directory:$DIRECT" >> results.txt
echo "searching, please wait..."
echo "start time: $(date)" >>  results.txt
echo "0" > counter.txt
echo "0" > counter2.txt
echo "" >> results.txt

find $DIRECT -type d > SUBDIRLST.txt
BULB=$(cat SUBDIRLST.txt)
shopt -s nullglob
for f in $BULB
do
$WHEREAMI/dirlook.sh "$f/$FINDIT"
done

echo "" >> results.txt
echo "" >> results.txt
echo "end of search results for $FINDIT" >> results.txt
echo "end time: $(date)" >>  results.txt
echo "under $DIRECT and sub-directories" >> results.txt
echo "GTKfindit found $(cat counter.txt) results" >> results.txt
echo -e "in $(cat counter2.txt) directories." >> results.txt
echo "" >> results.txt
echo "GTKfindit -find what you need. " >> results.txt
