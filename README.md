# {{ project_name|title }}


{% if False %}
Use the following command to create a new django project based on this template:

    $ django-admin.py startproject --template=https://github.com/byteweaver/django-genesis/archive/master.zip --extension=nginx,py,md,html,sh --name=Makefile <project_name>

{% endif %}

## Requirements

* make
* python-virtualenv

## Setup for development

Setup virtualenv and install requirements:

    $ make

Apply migrations and create database:

    $ ./bin/python manage.py migrate

Run development server (private localhost):

    $ ./bin/python manage.py runserver

Or run development server (public to local network):

    $ ./bin/python manage.py runserver 0.0.0.0:8000
