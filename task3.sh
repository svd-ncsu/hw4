#!/bin/bash

gawk -F, 'BEGIN { OFS="," }
{
  if ($3 == 2 && $13 ~ /S/) {
    gsub(/female/, "F", $0);
    gsub(/male/, "M", $0);
    print $0;
  }
}' titanic.csv | tee /dev/tty | gawk -F, '
{
  if($7 != "" && $7 ~ /^[0-9]+(\.[0-9]+)?$/) {
    sum += $7; count+=1
  }
}
END { if (count > 0) print "Average Age: " sum/count; else print "No matching records" 
}'