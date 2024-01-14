#!/bin/bash

#----------------------------#
#     Scripted by X3se4y     #   
#----------------------------#

#Base targert directory
baseDir="~Bugbounty/Bugbounty/Targets"

#Gathering Alive domains with httpx
if [[ -d $baseDir ]]; then
    for dir in "$baseDir"/*/; do
        if [[ -f "${dir}/resolveddomains.txt" ]]; then
            programname=$(basename "$dir")
            echo "Finding alive subdomains for $programname:"
            httpx -l "${dir}/resolveddomains.txt" -t 75 -silent | sed 's/https\?:\/\///' | anew "${dir}/livedomains.txt" 
            sort -u "${dir}/livedomains.txt"
        else
            programname=$(basename "$dir")
            echo "No resolved domains found with $programname!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist:"
fi
