#!/bin/bash
mkdir organised
cp mock_grading/roll_list organised/
cd organised
mkdir $(<roll_list cut -d/ -f1)
rm roll_list

	
for var in `ls`
do
	cd ../mock_grading/submissions	
	for abc in `ls -d $var*`
	do
		cd ../../organised/$var		
		ln -s ../../mock_grading/submissions/$abc $abc
		cd ../../mock_grading/submissions
	done
	cd ../../organised
done
