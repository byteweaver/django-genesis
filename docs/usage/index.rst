Getting started
===============

Project creation
----------------

A system wide django installation is required to utilize the project creation feature of the ``django-admin.py`` command. Ot
To create a new django project based on the django genesis template call the following command. The last parameter ``<project_name>`` has to be replaced with the desired real project name.

.. code-block:: bash

   $ django-admin.py startproject --template=https://github.com/byteweaver/django-genesis/archive/master.zip --extension=py,md,html,sh --name=Makefile <project_name>
