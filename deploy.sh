#!/bin/sh

repo="http://18.218.231.147:8081"
groupId=$1
artifactId=$2
version=$3

# optional
#classifier=$4
type=$4

if [[ $type == "" ]]; then
  type="jar"
fi
#if [[ $classifier != "" ]]; then
 # classifier="-${classifier}"
#fi

groupIdUrl="${groupId//.//}"
#filename="${artifactId}-${version}${classifier}.${type}"
filename="${artifactId}-${version}.${type}"

if [[ ${version} == *"SNAPSHOT"* ]]; then repo_type="snapshots"; else repo_type="releases"; fi

if [[ $repo_type == "releases" ]]
 then
   wget --no-check-certificate "${repo}/repository/releases/${groupIdUrl}/${artifactId}/${version}/${artifactId}-${version}${classifier}.${type}" -O ${filename} -k
 else
   #versionTimestamped=$(wget -q -O- --no-check-certificate "${repo}/repository/SAMPLE-SNAP/${groupIdUrl}/${artifactId}/${version}/maven-metadata.xml" | grep -m 1 \ | sed -e 's/\(.*\)<\/value>/\1/' | sed -e 's/ //g')
   versionTimestamped=$(wget -q -O- --no-check-certificate "${repo}/repository/SAMPLE-SNAP/${groupIdUrl}/${artifactId}/${version}/maven-metadata.xml" | grep -m 1\ timestamp)
   echo ${versionTimestamped}
   wget --no-check-certificate "${repo}/repository/SAMPLE-SNAP/${groupIdUrl}/${artifactId}/${version}/${artifactId}-${versionTimestamped}.${type}" -O ${filename}
 fi

