#!/bin/bash

CASES=$(basename -s _input -a input/*)
STUDENTS=$(basename -s _res -a res/*)

for student in $STUDENTS
do
	echo -e "\033[36;1m""$student""\033[0m"
	for case in $CASES
	do
		echo -en "\033[34;1m""$case : ""\033[0m"
		./res/"$student"_res < ./input/"$case"_input > "$student"_output
		if [$(diff "$student"_output ./output/"$case"_output | wc -l) -eq 0 ]; then
			echo -en "\033[32;1m""OK  ""\033[0m"
		else
			echo -en "\033[31;1m""KO  ""\033[0m"
			if [ -e "./logs/$student_log" ]; then
				echo $case >> ./logs/"$student"_log
				diff "$student"_output ./output/"$case"_output >> ./logs/"$student"_log
			else
				echo $case > ./logs/"$student"_log
				diff "$student"_output ./output/"$case"_output > ./logs/"$student"_log
			fi
			echo "" >> ./logs/"$student"_log
		fi
		rm -f "$student"_output
	done
	echo ""
done
