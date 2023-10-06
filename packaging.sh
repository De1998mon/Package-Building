#!/bin/bash

cd /home/deb-pkg/litecrypt-0.0.8

python3 setup.py --command-packages=stdeb.command sdist_dsc

cd /home/deb-pkg/litecrypt-0.0.8/deb_dist/litecrypt-0.0.8/

dpkg-buildpackage -us -uc -rfakeroot

# Пакет .deb находится по пути /home/deb-pkg/litecrypt-0.0.8/deb_dist/python3-litecrypt_0.0.8-1_all.deb

cd /home/rpm-pkg/litecrypt-0.0.8

python3 setup.py bdist_rpm

# Пакеты .rpm находится по пути /home/rpm-pkg/litecrypt-0.0.8/dist/litecrypt-0.0.8-1.noarch.rpm

cd /home

mkdir packages

cp ./rpm-pkg/litecrypt-0.0.8/dist/litecrypt-0.0.8-1.src.rpm ./packages

cp ./rpm-pkg/litecrypt-0.0.8/dist/litecrypt-0.0.8-1.noarch.rpm ./packages

cp ./deb-pkg/litecrypt-0.0.8/deb_dist/python3-litecrypt_0.0.8-1_all.deb ./packages
