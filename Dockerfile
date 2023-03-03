FROM python:3.11-slim-buster
 
# Create app directory
RUN mkdir /api-peliculas
# setup working directory
WORKDIR /api-peliculas
#install dependencies ubuntu & Curl
RUN apt-get update
RUN apt-get install -y curl
#Copy application
COPY . /api-peliculas/
# install application dependencies
RUN pip3 install -r /api-peliculas/requirements.txt
# define enviroments variable
ENV FLASK_APP "entrypoint:app"
ENV FLASK_ENV "development"
ENV APP_SETTINGS_MODULE "config.default"
ENV PORT 5000
# init bd and create schemas
RUN flask db init
RUN flask db revision --rev-id 584a053c5616
RUN flask db migrate
RUN flask db upgrade
 
EXPOSE ${PORT}
# init flask with map any ip outside from container
CMD ["flask","run" ,"--host", "0.0.0.0"]