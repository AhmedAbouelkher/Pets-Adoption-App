#!/usr/bin/bash

#flags
while getopts m:l:u: aflag; do
		case $aflag in
				m) COMMIT=$OPTARG;;
				l) REPO=$OPTARG;;
				u) UPNREPO=$OPTARG;;
		esac
done

if [ ${UPNREPO}]
then
    echo 'Uploading'
else
    git add . && git commit -m "${COMMIT}" && git push origin master
fi