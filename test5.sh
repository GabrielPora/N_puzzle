#!/bin/bash
YEP=0
for i in {1..100}
do
	echo $i
	#start=$(($(date +%s%N)/1000000))
	RES=`./npuzzle --misplaced --random 5 | grep solvable`
	#end=$(($(date +%s%N)/1000000))
	#ti=$((end - start))
	#if [ "1000" -le "$ti" ]
	#then
	#	echo $((end - start))
	#fi
	if [ "$RES" == "" ]
	then
		YEP=$((YEP + 1))
	fi
done
echo "result: "$YEP
