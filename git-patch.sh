#!/bin/bash

create_patch = false
apply_patch = false

while getopts ":p:a:" o; do
	case "" in
		p)
			$create_patch = true
			;;
		a)
			$apply_patch = true
			;;
		*)
			;;
	esac
done

shift $((OPTIND-1))

if [ \( $create_patch -eq true ) ]
then
	git diff --no-prefix > patchfile # TODO add option for custom patch file name
elif [ \( $apply_patch -eq true ) ]
then
	patch -p1 < patchfile # TODO add option for custom patch
fi
