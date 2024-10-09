#!/bin/bash

grep -c "sample" ./dataset1/file* | cut -d: -f1 | xargs grep -c "CSC510" | grep -E "(:[3-9]$)|(:[1-9][1-9]+$)" | tee temp1.txt | cut -d: -f1 | xargs ls -l | gawk '{ printf "%04d\n", $5 }' > temp2.txt && paste -d':' temp1.txt temp2.txt | sort --field-separator=: -k2 -k3 --reverse | sed 's/file_/filtered_/'