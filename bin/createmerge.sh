#!/bin/bash

MSG=$1
if [ -z $MSG ]; then
    MSG="Adding Feature"
fi

ON_BRANCH=$2
if [ -z "$ON_BRANCH" ]; then
    echo "No onbranch specified. using main"
    ON_BRANCH="main"    
fi

FEATURE=`cat data/nextfeature.txt`

#echo  $FEATURE
NEXT_FEATURE=$(( 10#${FEATURE}+1 ))
NEXT_FEATURE=$(printf "%03.f" $NEXT_FEATURE)
echo $NEXT_FEATURE > data/nextfeature.txt

git checkout $ON_BRANCH
git checkout -b feat/f$FEATURE

for COMMIT in `seq 1 3`; do
    echo "Cool feature: ${FEATURE}_part$COMMIT" >> foo.txt
    git add foo.txt
    git commit -m "$MSG ${FEATURE}_part$COMMIT."
done    

git checkout $ON_BRANCH
