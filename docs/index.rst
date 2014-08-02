.. django project template documentation master file, created by
   sphinx-quickstart on Mon Jun 23 10:55:20 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

django-genesis (project template)
=================================

Kick-start your django development with this project template.

Project website: https://github.com/byteweaver/django-genesis

Issue tracker: https://github.com/byteweaver/django-genesis/issues

Key features
------------

- support for multiple targets (e.g. development, production, test)
- requirement tracking and management
- easy deployment to server
- integrated into development process (github)

Abstract
--------

This project template solves every day problems with django and provides some useful additional features. It is designed to be used with the latest stable django (1.6.5) and python (3.4) version. Furthermore it is ready to be deployed on a Debian GNU/Linux based system within no time and tries to simplify the deployment process.

Usage
-----

.. code-block:: Bash

    $ django-admin.py startproject --template=https://github.com/byteweaver/django-genesis/archive/master.zip --extension=py,md,html,sh --name=Makefile <project_name>

Documentation
=============

The following sections contain a detailed documentation on the project template.

Project template
----------------

.. toctree::
   :maxdepth: 2

   project/targets

Deployment
----------

.. toctree::
   :maxdepth: 2

   deployment/index
   deployment/system
   deployment/project

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
