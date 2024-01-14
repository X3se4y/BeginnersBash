# BeginnersBash

I have created some automation scripts which might help you in your recon journey.

Please correct me if I am wrong and we will be happy to learn together.

Big thanks to g0lden and ars0n who insipred me to write this scripts.
https://www.youtube.com/@g0lden1
https://www.youtube.com/@rs0n_live

:)

-----------------------------------------------------------------------------------------------------

# Automation Recon scripts

First create a traget folder, create roots.txt and put all your root domains which you want to do recon. 

Then on the script will find the tragest and enumeration on it.

1.)First run domains.sh which will create two files alldomains.txt and masscan.txt

2.)Second run resolve.sh which will resolve all the domains and sort them into resolveddomains.txt

3.)Third run webserver.sh which will find alive hosts with help of httpx and put them into livedomains.txt 

4.)Fourth run recon.sh which will enumerate resolveddomains.txt and find alive hosts with httpx and creating an file called webservers.txt

5.)Fifth and Sixth you can run simultenously enpdpoint.sh will help you get new params and intresting stuff.

Aquatone.sh will help you to get visual inspection of target, all the endpoint.sh target will go through aquatone.sh

I hope it gives you clear idea how the script works and functionality of it, if you have anything please feel free to share it with me.

