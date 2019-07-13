FROM python:3.7-alpine
MAINTAINER London App Developer Ltd

ENV PYTHONUNBUFFERED 1

#Copiamos las dependencias y las instalamos
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#Creamos el directorio app que sera reflejo de nuestra carpeta app
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Creamos un usuario -D hace referencia a que solo podra usar la app
RUN adduser -D user
USER user