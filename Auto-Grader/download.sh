#!/bin/bash
if (( $# != 2 )); then
    echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
    exit 1
fi
wget -r --no-parent --cut-dirs="$2" --reject="index.html*" "$1"
mv www.cse.iitb.ac.in mock_grading
