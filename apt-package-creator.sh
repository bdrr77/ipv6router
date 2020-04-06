#!/bin/bash
#This file downloads helios ll agent from git and builds it on your plateform

programName="ipv6router-utils"
ext=".deb"

#Get version number from config/version file called as $version
source ./$programName/opt/$programName/version
echo "test version $package_version"

## Build apt-package
sed -i "s/PACKAGE_VERSION/$package_version/g" $programName/DEBIAN/control
echo "Building apt package"
dpkg-deb --build "$programName"

mv "$programName$ext" "$programName-$package_version$ext"
