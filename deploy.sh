#!/bin/sh

groupId="in/javahome"
artifactId="simple-app"
version="3.0.1-SNAPSHOT"
nexusUser="admin"
actualversion="3.0.1"

classifier=""
type="war"

nexusUser="admin"
repo="SAMPLE-SNAP"                                                                                                                                                                                                                              
# Nexus 3
base="http://3.135.207.159:8081/repository/${repo}"

if [[ $classifier != "" ]]; then
classifier="-${classifier}"
fi

# Read Password
#echo -n Please enter password for user ${nexusUser}:
#read -s password
#echo
password="admin123"

filename="${artifactId}-${version}${classifier}.${type}"

urlpath="${base}/${groupId}/${artifactId}/${version}/maven-metadata.xml" 


if [[ "${version}" == "LATEST" || "${version}" == *SNAPSHOT* ]] ; then
if [[ "${version}" == "LATEST" ]] ; then
version=$(xmllint --xpath "string(//latest)" <(curl -s "${base}/${groupIdUrl}/${artifactId}/maven-metadata.xml"))
fi
#timestamp=`curl -u ${nexusUser}:${password} -s "http://18.218.231.147:8081/repository/SAMPLE-SNAP/in/javahome/simple-app/3.0.1-SNAPSHOT/maven-metadata.xml" | xmllint --xpath "string(//timestamp)" -`
timestamp=`curl -u ${nexusUser}:${password} -s "${base}/${groupId}/${artifactId}/${version}/maven-metadata.xml" | xmllint --xpath "string(//timestamp)" -`
echo "my ts"
echo ${urlpath}
echo ${groupId}
echo "my ts ends"
buildnumber=`curl -u ${nexusUser}:${password} -s "${base}/${groupId}/${artifactId}/${version}/maven-metadata.xml" | xmllint --xpath "string(//buildNumber)" -`
#wget --user ${nexusUser} --password ${password} -P /nexus/artifacts "${base}/${groupId}/${artifactId}/${version}/${artifactId}-${actualversion}-${timestamp}-${buildnumber}.${type}"
wget --no-check-certificate "${base}/${groupId}/${artifactId}/${version}/${artifactId}-${actualversion}-${timestamp}-${buildnumber}.${type}" -O ${filename}
#wget --no-check-certificate "${base}/${groupId}/${artifactId}/${version}/${artifactId}-${actualversion}-${timestamp}-${buildnumber}.${type}" -O ${filename}
cp "${filename}" /opt/apache-tomcat-8.0.9/webapps/

 else
#wget --user ${nexusUser} --password ${password} -P /nexus/artifacts "${base}/${groupId}/${artifactId}/${version}/${artifactId}-${actualversion}${classifier}.${type}"                                                                            
wget --no-check-certificate "${base}/${groupId}/${artifactId}/${version}/${artifactId}-${actualversion}-${timestamp}-${buildnumber}.${type}" -O ${filename}

fi
