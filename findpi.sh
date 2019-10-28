#!/bin/bash
# Finding unique values with sort source: https://stackoverflow.com/questions/6951223/finding-unique-values-in-a-data-file, user: Mike Mertsock
# Grepping only the ip code sourced from: https://stackoverflow.com/questions/11482951/extracting-ip-address-from-a-line-from-ifconfig-output-with-grep, user: Jens Bayer 
# ssh pi@EGENGROup7AHMGLCRR.local
ping EGENGROUP7AHMGLCRR.local -c 1 | egrep -ou '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}' | sort -u
