#!/bin/bash


function printIt() { echo; echo; echo =========; echo == $* ; echo =========; }

# change timer to 300 seconds or more
release="updateThis";

includePackages="no" ; # set to yes to include dev lab artifacts
includeMavenRepo="no" ; # set to yes to include maven Repo
targetHost="yourTools.yourcompany.com"

if [ $release != "updateThis" ] ; then
	printIt Building $release , rember to use ui on csaptools to sync release file to other vm
	$STAGING/bin/mkcsap.sh $release $includePackages $includeMavenRepo $targetHost
	
	includePackages="yes" ; # set to yes to include dev lab artifacts
	includeMavenRepo="yes" ; # set to yes to include maven Repo
	release="$release-full"
	
	printIt Building $release , rember to use ui on csaptools to sync release file to other vm
	$STAGING/bin/mkcsap.sh $release $includePackages $includeMavenRepo $targetHost
	
else
	printIt update release variable and timer
fi
