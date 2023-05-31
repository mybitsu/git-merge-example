#!/bin/bash

FEATURE=`cat data/nextfeature.txt`

#echo  $FEATURE
NEXT_FEATURE=$(( 10#${FEATURE}+1 ))
NEXT_FEATURE=$(printf "%03.f" $NEXT_FEATURE)
echo $NEXT_FEATURE > data/nextfeature.txt

git checkout main
git checkout -b feat/feature$FEATURE

for COMMIT in `seq 1 3`; do
    echo "Cool feature: ${FEATURE}_part$COMMIT" >> foo.txt
    git add foo.txt
    git commit -m "Adding Feature ${FEATURE}_part$COMMIT."
done    

git checkout main
