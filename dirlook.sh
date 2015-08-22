#!/bin/sh
echo "looking for: $1"

COUNTER2=$(cat /root/GTKfindit/counter2.txt)+1
shopt -s nullglob
for f in $1
do
  if  test -e $f ; then
    COUNTER1=$(cat /root/GTKfindit/counter.txt)+1
    echo "$f" >> /root/GTKfindit/results.txt
    echo $COUNTER1 | bc > /root/GTKfindit/counter.txt
    echo $COUNTER2 | bc > /root/GTKfindit/counter2.txt
  fi
done