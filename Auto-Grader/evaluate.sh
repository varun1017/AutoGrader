#!/bin/bash
touch marksheet.csv
touch distribution.txt
cd organised
for var in `ls`
do 
    cd $var
    mkdir student_outputs
    for arg in `ls | grep \.cpp`
    do 
        mar=0
        timeout 5 g++ -o executable $arg 2>/dev/null
        for abc in `ls ../../mock_grading/inputs | cut -d "." -f 1`
        do
            cd student_outputs
            touch $abc.out 
            cd ..
            if [[ -f "executable" ]]
            then
                timeout 5 ./executable < ../../mock_grading/inputs/$abc.in > student_outputs/$abc.out 2>/dev/null | cat
                if cmp -s ./student_outputs/$abc.out ../../mock_grading/outputs/$abc.out 
                then
                    ((mar=mar+1))
                fi
            fi
        done
        echo "$var,$mar" >> ../../marksheet.csv
    done
    cd ..
done
cd ..
for mar in `sort -k 2 -t , -n -r marksheet.csv | cut -d "," -f 2`
do
    echo $mar >> distribution.txt
done
