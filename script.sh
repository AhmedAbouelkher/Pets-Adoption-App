#!/usr/bin/bash

#flags
while getopts m: aflag; do
		case $aflag in
				m) COMMIT=$OPTARG;;
		esac
done

git add . && git commit -m "${COMMIT}" && git push origin master