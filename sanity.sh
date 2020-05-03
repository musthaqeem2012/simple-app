#!/bin/bash


if [ -z "$1" ]
then
    echo "usage: sanity.sh http://www.example.com"
    exit 1
fi

#curl -A 'Mozilla/4.05 [en] (X11; U; Linux 2.0.32 i586)' --location http://www.example.com

#status=`curl -i --silent --head $1 | head -1 | cut -f 2 -d' '`
#status = `curl -I -s -L http://www.example.com | grep "HTTP/1.1" | cut -f 2 -d' '`

status=$(curl -I -s -L $1 | grep "HTTP/1.1" | cut -f 2 -d' ')
echo "status was : '${status}'"
 if [ $status -eq 200 ]; then
	echo "Smoke Test completed successfully"
 else
	echo "Smoke Test Failed"
fi

#echo "status was other than '200': was '$status'"
#if [ $status != "200 OK" ]
#then
#    echo "status was other than '200': was '$status'"
#    exit 1
#fi

if [ ! -e "reports" ]
then
  mkdir "reports"
fi

#put the xml version of the page into a file
curl --silent $1 > reports/smoke.xml
