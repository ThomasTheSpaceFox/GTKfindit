#!/bin/sh

FINDIT=$(cat /root/GTKfindit/find.it.txt)
DIRECT=$(cat /root/GTKfindit/find.direct.txt)
echo "GTKfindit -find what you need." > /root/GTKfindit/results.txt
echo "Search:$FINDIT" >> /root/GTKfindit/results.txt
echo "directory:$DIRECT" >> /root/GTKfindit/results.txt
echo "searching, please wait..."
echo "start time: $(date)" >>  /root/GTKfindit/results.txt
echo "0" > /root/GTKfindit/counter.txt
echo "0" > /root/GTKfindit/counter2.txt
echo "" >> /root/GTKfindit/results.txt

find $DIRECT -type d > /root/GTKfindit/SUBDIRLST.txt
BULB=$(cat /root/GTKfindit/SUBDIRLST.txt)
shopt -s nullglob
for f in $BULB
do
/root/GTKfindit/dirlook.sh "$f/$FINDIT"
done

echo "" >> /root/GTKfindit/results.txt
echo "" >> /root/GTKfindit/results.txt
echo "end of search results for $FINDIT" >> /root/GTKfindit/results.txt
echo "end time: $(date)" >>  /root/GTKfindit/results.txt
echo "under $DIRECT and sub-directories" >> /root/GTKfindit/results.txt
echo "GTKfindit found $(cat /root/GTKfindit/counter.txt) results" >> /root/GTKfindit/results.txt
echo -e "in $(cat /root/GTKfindit/counter2.txt) directories." >> /root/GTKfindit/results.txt
echo "" >> /root/GTKfindit/results.txt
echo "GTKfindit -find what you need. " >> /root/GTKfindit/results.txt
