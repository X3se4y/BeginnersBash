#!/bin/bash

#----------------------------#
#     Scripted by X3se4y     #   
#----------------------------#

#Base targert directory
baseDir="~Bugbounty/Bugbounty/Targets"

#We can use katana which is made by projectdiscovery to gather endpoints
if [[ -d $baseDir ]]; then
    for dir in "$baseDir"/*/; do
        if [[ -f "${dir}/roots.txt" ]]; then
            programname=$(basename "$dir")
            echo "Grabbing endopoints for $programname:"
            katana -u "${dir}/webservers.txt" -duc -silent -nc -jsl -kf -fx -xhr -ef woff,css,png,svg | anew "${dir}/resolveddomains.txt" 
            sort -u "${dir}/resolveddomains.txt" >> "${dir}/sorteddomains.txt"
        else
            programname=$(basename "$dir")
            echo "No root domains found with $programname!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist:"
fi
