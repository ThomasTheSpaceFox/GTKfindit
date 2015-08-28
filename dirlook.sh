#!/bin/bash
echo "looking for: $1"

WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI

COUNTER2=$(cat counter2.txt)+1
shopt -s nullglob
for f in $1
do
  if  test -e $f ; then
    COUNTER1=$(cat counter.txt)+1
    echo "$f" >> results.txt
    echo $COUNTER1 | bc > counter.txt
    echo $COUNTER2 | bc > counter2.txt
  fi
done
