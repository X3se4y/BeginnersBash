#!/bin/bash

chromiumPath=/usr/bin/chromium
auquatoneThreads=10



#----------------------------#
#     Scripted by X3se4y     #   
#----------------------------#

#Base targert directory
baseDir="/home/x3se4y/Bugbounty/Bugbounty/Targets"

#Using aquatone to get visual inspection of the target
if [[ -d $baseDir ]]; then
    for dir in "$baseDir"/*/; do
        if [[ -f "${dir}/roots.txt" ]]; then
            programname=$(basename "$dir")
            echo "Checking aquatone output directory"
            if [ ! -d "aqua_out" ]; then
            mkdir "${dir}/aqua_out"
            echo "Creating Aquatone output directory"
            fi
            echo "Starting Aquatone scan..."
            aquatone "${dir}/sorteddomains.txt" -ports large -chrome-path $chromiumPath -out ~/Bugbounty/Bugbounty/Targets/"${programname}"/aqua_out -threads $auquatoneThreads 
        else
            programname=$(basename "$dir")
            echo "No root domains found with $programname!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist:"
fi
