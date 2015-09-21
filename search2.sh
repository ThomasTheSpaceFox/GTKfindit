#!/bin/bash

WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI

FINDIT=$(cat find.it.txt)
DIRECT=$(cat find.direct.txt)
echo "GTKfindit -find what you need." > results.txt
echo "______________________________________" >> results.txt
echo "Search:$FINDIT" >> results.txt
echo "directory:$DIRECT" >> results.txt
echo "______________________________________" >> results.txt
echo "searching, please wait..."
echo "start time: $(date)" >>  results.txt
echo "______________________________________" >> results.txt
echo "" >> results.txt

find "$DIRECT" -name "$FINDIT" >> results.txt


echo "" >> results.txt
echo "" >> results.txt
echo "______________________________________" >> results.txt
echo "end of search results for $FINDIT" >> results.txt
echo "end time: $(date)" >>  results.txt
echo "under $DIRECT and sub-directories" >> results.txt
echo "" >> results.txt
echo "______________________________________" >> results.txt
echo "GTKfindit -find what you need. " >> results.txt
