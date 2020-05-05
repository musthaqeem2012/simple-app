#!/bin/bash

#varurl= "http://3.135.194.173:8080/simple-app-3.0.1-SNAPSHOT/"
varurl="https://www.example.com/"


#curl -A 'Mozilla/4.05 [en] (X11; U; Linux 2.0.32 i586)' --location http://www.example.com

#status=`curl -i --silent --head $1 | head -1 | cut -f 2 -d' '`
#status = `curl -I -s -L http://www.example.com | grep "HTTP/1.1" | cut -f 2 -d' '`

status=$(curl -I -s -L ${varurl} | grep "HTTP/2" | cut -f 2 -d' ')
echo "status was : '${status}'"
 if [ $status -eq 200 ]; then
	echo "Smoke Test Completed successfully"
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
curl --silent ${varurl} > reports/smoke.xml
