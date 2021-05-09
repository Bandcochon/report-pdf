FROM docker.io/python:3.9-slim

WORKDIR /app

COPY . .

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get -y --no-install-recommends install \
    libcairo-gobject2 \
    libpango1.0-0 \
 && pip install -U pip \
 && pip install -r requirements.txt --target=. \
 && apt-get -y autoremove \
 && apt-get clean

ENV PORT=8888 ADDRESS=127.0.0.1

EXPOSE 8888

CMD ["python3", "main.py"]
