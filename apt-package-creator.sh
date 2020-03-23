#!/bin/bash
#This file downloads helios ll agent from git and builds it on your plateform

programName="ipv6router-utils"
ext=".deb"
$version = "0.0.1"

#Get version number from config/version file called as $version
#source ./$programName$configFilePath/version
echo $version

## Build apt-package
sed -i "s/PACKAGE_VERSION/$version/g" $programName/DEBIAN/control
echo "Building apt package"
dpkg-deb --build "$programName"

mv "$programName$ext" "$programName-$version$ext"
