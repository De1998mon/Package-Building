FROM ubuntu:20.04

RUN apt-get update && apt-get install -y tzdata git

ENV TZ=Europe/Moscow

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y python3 python3-stdeb python-all dh-python python3-pip rpm

WORKDIR /home

RUN git clone https://github.com/De1998mon/Package-Building.git

RUN pip3 install -r /home/Package-Building/litecrypt-*/litecrypt.egg*/requires.txt

WORKDIR /home/Package-Building

RUN mkdir /home/Package-Building/deb-pkg

RUN mkdir /home/Package-Building/rpm-pkg

RUN chmod +x ./packaging.sh

CMD ["/packaging.sh"]
