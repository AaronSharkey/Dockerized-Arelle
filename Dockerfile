FROM python:3.8.7-buster

MAINTAINER Aaron Sharkey

RUN apt-get install libxml2-dev libxslt-dev libjpeg-dev git

RUN mkdir app

WORKDIR app

RUN git clone --recursive https://github.com/Arelle/Arelle .

COPY setup.sh .

COPY requirements.txt .

RUN pip3 install --upgrade pip

CMD ["python3 --version"]

RUN pip3 install -r requirements.txt

RUN python3 setup.py install

EXPOSE 8080

ENTRYPOINT ["/bin/sh"]

CMD ["setup.sh"]