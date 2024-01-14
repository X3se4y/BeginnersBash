#!/bin/bash
#----------------------------#
#     Scripted by X3se4y     #   
#----------------------------#

#Base targert directory
baseDir="~Bugbounty/Bugbounty/Targets"

#Resolving subdomains with dnsx and sorting it
if [[ -d $baseDir ]]; then
    for dir in "$baseDir"/*/; do
        if [[ -f "${dir}/alldomains.txt" ]]; then
            programname=$(basename "$dir")
            echo "Resolving subdomains for $programname:"
            dnsx -l "${dir}/alldomains.txt" -silent | anew "${dir}/resolveddomains.txt" 
            sort -u "${dir}/resolveddomains.txt"
        else
            programname=$(basename "$dir")
            echo "No domains file found with $programname!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist:"
fi
