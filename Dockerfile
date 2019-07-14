FROM python:3.7-alpine
MAINTAINER London App Developer Ltd

ENV PYTHONUNBUFFERED 1

#Copiamos las dependencias y las instalamos
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

#Creamos el directorio app que sera reflejo de nuestra carpeta app
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Creamos un usuario -D hace referencia a que solo podra usar la app
RUN adduser -D user
USER user