#!/bin/bash

ulimit -t 1
echo $1 $2 $3 $4 $5 >> testruns.txt
case $2 in
  p1) $1 "" | diff 1.exp - && exit 0 ;;
  n1) $1 "3 1 2 2" | diff 10.exp - && exit 0 ;;
  n2) $1 "1 3 2 3" | diff 11.exp - && exit 0 ;;
  n3) $1 "5" | diff 2.exp - && exit 0 ;;
  n4) $1 "5 1" | diff 3.exp - && exit 0 ;;
  n5) $1 "5 7" | diff 4.exp - && exit 0 ;;
  n6) $1 "2 1 3" | diff 5.exp - && exit 0 ;;
  n7) $1 "1 2 3" | diff 6.exp - && exit 0 ;;
  n8) $1 "3 2 1" | diff 7.exp - && exit 0 ;;
  n9) $1 "3 1 2" | diff 8.exp - && exit 0 ;;
  n10) $1 "1 3 2" | diff 9.exp - && exit 0 ;;

  s) # single-valued fitness 
  let fit=0
  $1 "" | diff 1.exp - && let fit=$fit+1
  $1 "3 1 2 2" | diff 10.exp - && let fit=$fit+1
  $1 "1 3 2 3" | diff 11.exp - && let fit=$fit+1
  $1 "5" | diff 2.exp - && let fit=$fit+1
  $1 "5 1" | diff 3.exp - && let fit=$fit+1
  $1 "5 7" | diff 4.exp - && let fit=$fit+1
  $1 "2 1 3" | diff 5.exp - && let fit=$fit+1
  $1 "1 2 3" | diff 6.exp - && let fit=$fit+1
  $1 "3 2 1" | diff 7.exp - && let fit=$fit+1
  $1 "3 1 2" | diff 8.exp - && let fit=$fit+1
  $1 "1 3 2" | diff 9.exp - && let fit=$fit+1
  let passed_all="$fit >= 10"
  echo $fit > $5
  if [ $passed_all -eq 1 ] ; then 
    exit 0 
  else
    exit 1 
  fi ;;


esac 
exit 1
