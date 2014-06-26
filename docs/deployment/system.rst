System requirements
===================

This guide covers how to deploy your project behind a nginx proxy server with a gunicorn daemon running as Debian system service. All python requirements will be contained in a dedicated virtual environment.

Summary
-------

- Debian GNU/Linux (wheezy)
- nginx
- PostgreSQL

Debian packages
---------------

$ apt-get install nginx git
python3 python3-dev python-virtualenv


Nginx configuration
-------------------

Optional: Think about turning your configuration folder into a git repository to keep track of your changes.

.. code-block:: bash

    $ cd /etc/nginx
    $ git init
    $ git add -A
    $ git commit -m 'initial configuration files'

Create directories for nginx root and default site directories:

.. code-block:: bash

    $ mkdir -p /var/www/default
    $ chown -R www-data:www-data /var/www

Add content for a default site to a subdirectory in the root directory:

.. code-block:: bash

    $ echo '<html>welcome to nginx!</html>' > /var/www/default/index.html
    $ chown www-data:www-data /var/www/default/index.html

OR copy content of debian default file:

.. code-block:: bash

    $ cp /usr/share/nginx/www/index.html /var/www/default/
    $ chown www-data:www-data /var/www/default/index.html

and update nginx configuration to use this directory for default site:

.. code-block:: bash

    $ sed - i 's#/usr/share/nginx/www#/var/www/default#g' /etc/nginx/sites-enabled/default

Change ownership of all files contained in ``/var/www`` always to ``www-data```.

PostgreSQL
----------

The desired database backend for production usage.
