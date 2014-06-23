System requirements
===================

This guide covers how to deploy your project behind a nginx proxy server with a gunicorn daemon running as Debian system service. All python requirements will be contained in a dedicated virtual environment.

Summary
-------

- Debian GNU/Linux (wheezy)
- nginx

Debian packages
---------------

$ apt-get install nginx python3 python3-dev python-virtualenv


Nginx configuration
-------------------

root directory is /var/www/
