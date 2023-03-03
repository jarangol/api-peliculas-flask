# api-peliculas-flask
Flask REST api example

## Local execution
1. create venv
  >$ python3 -m venv /path/to/new/virtual/environment
2. activate venv
> $ source  /path/to/new/virtual/environment/bin/activate

3. export env variables:
```bash
export FLASK_APP="entrypoint:app"
export FLASK_ENV="development"
export APP_SETTINGS_MODULE="config.default"
```

4. Create DB and tables
```bash
$ flask db init
$ flask db migrate -m "Initial_db"
$ flask db upgrade
```

5. Start service
> $ flask run


## Docker execution

1. build image
> $ docker build -t jarangol/api-peliculas .

2. run container
> $ docker run -p 8080:5000 jarangol/api-peliculas