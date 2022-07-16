FROM python:alpine

WORKDIR /app

COPY sockd.conf /etc/

COPY sockd.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/sockd.sh

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY entrypoint.py .

RUN apk add --update-cache dante-server openvpn bash openresolv openrc
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["python", "entrypoint.py"]
