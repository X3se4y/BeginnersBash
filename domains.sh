#!/bin/bash

#----------------------------#
#     Scripted by X3se4y     #   
#----------------------------#

#Base targert directory
baseDir="~Bugbounty/Bugbounty/Targets"

#Checking for roots.txt directory in targets folder 
if [[ -d $baseDir ]]; then
    for dir in "$baseDir"/*/; do
        if [[ -f "${dir}/roots.txt" ]]; then
            programname=$(basename "$dir")
            echo "Grabbing subdomains with subfinder for $programname:"
            subfinder -dL "${dir}/roots.txt" -silent | anew "${dir}/alldomains.txt" 
            echo "Grabbing subdomains with massdns for $programname:"
            massdns "${dir}/alldomains.txt" -r /usr/share/subbrute/windows/resolvers.txt -t A -q -o S | grep -v 142.54.173.92 | sort -u >> "${dir}/masscan.txt"            
        else
            programname=$(basename "$dir")
            echo "No root domains found with $programname!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist:"
fi
