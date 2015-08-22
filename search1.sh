#!/bin/sh

FINDIT=$(cat /root/GTKfindit/find.it.txt)
DIRECT=$(cat /root/GTKfindit/find.direct.txt)
echo -e "begin first phase /n" > /root/GTKfindit/results.txt
echo "Search:$FINDIT" >> /root/GTKfindit/results.txt
echo "directory:$DIRECT" >> /root/GTKfindit/results.txt

for f in $DIRECT$FINDIT
do
echo "found:" >> /root/GTKfindit/results.txt
echo "$f" >> /root/GTKfindit/results.txt
done