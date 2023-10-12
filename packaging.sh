#!/bin/bash

cd /home/Package-Building/deb-pkg/litecrypt-*

python3 setup.py --command-packages=stdeb.command sdist_dsc --build-depends="python3 (>= 3.6)"

cd /home/Package-Building/deb-pkg/litecrypt-*/deb_dist/litecrypt-*/

dpkg-buildpackage -us -uc -rfakeroot

# Пакет .deb находится по пути /home/Package-Building/deb-pkg/litecrypt-0.0.8/deb_dist/python3-litecrypt_0.0.8-1_all.deb

cd /home/Package-Building/rpm-pkg/litecrypt-*

python3 setup.py bdist_rpm --requires="python3 >= 3.6"


# Пакеты .rpm находится по пути /home/Package-Building/rpm-pkg/litecrypt-*/dist/litecrypt-0.0.8-1.noarch.rpm

cd /home/Package-Building

mkdir packages

cp -r ./rpm-pkg/litecrypt-*/dist/*.rpm ./packages

cp -r ./deb-pkg/litecrypt-*/deb_dist/*.deb ./packages
