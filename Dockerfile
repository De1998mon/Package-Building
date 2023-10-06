FROM ubuntu:20.04

RUN apt-get update && apt-get install -y tzdata

ENV TZ=Europe/Moscow

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y python3 python3-stdeb python-all dh-python python3-pip rpm

RUN mkdir /home/deb-pkg

RUN mkdir /home/rpm-pkg

ADD https://files.pythonhosted.org/packages/6a/73/12c32687e6491fa2f9c42210b26c5a3619ce39f56c603bb82c850c5529fa/litecrypt-0.0.8.tar.gz /home/

WORKDIR /home

RUN tar -xvf litecrypt-0.0.8.tar.gz -C ./deb-pkg/ && tar -xvf litecrypt-0.0.8.tar.gz -C ./rpm-pkg/

RUN pip3 install bcrypt sqlalchemy cryptography qrcode ttkbootstrap

COPY ./packaging.sh /home

RUN chmod +x ./packaging.sh

CMD ["/packaging.sh"]
