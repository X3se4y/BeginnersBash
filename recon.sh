#!/bin/bash

#----------------------------#
#     Scripted by X3se4y     #   
#----------------------------#

#Base targert directory
baseDir="~Bugbounty/Bugbounty/Targets"

#Now with the data we have collected we can use various tools to extend our scope
if [[ -d $baseDir ]]; then
    for dir in "$baseDir"/*/; do
        if [[ -f "${dir}/roots.txt" ]]; then
            programname=$(basename "$dir")
            echo "Recon for $programname:"
            subfinder -dL "${dir}/livedomains.txt" | anew "${dir}/resolveddomains.txt" 
            httpx -l "${dir}/resolveddomains.txt" -t 75 -silent | sed 's/https\?:\/\///' | anew "${dir}/webservers.txt" 
            sort -u >> "${dir}/webservers.txt"
            echo "Scanning for  open ports..."
            nmap -iL "${dir}/resolveddomains.txt" -T5 | anew "${dir}/openports.txt"
        else
            programname=$(basename "$dir")
            echo "No resolved domains found with $programname!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist:"
fi
