Project deployment
==================

Github deploy key
-----------------

Create a ssh keypair for deployment and save it to the ``/var/www/.ssh/{{project_name}}/`` directory. Change ownership of the directory and key files to ``www-data`` and grant access privileges only to the ``www-data`` user (600).

Then add the public key as deploy key to your project on github. You find the ``deploy key`` page as a tab below the settings page. Click on the ``add deploy key`` button and paste the content of your public key file.

SSH configuration
-----------------

To deploy multiple projects for the same user we have to add a ssh configuration to manage multiple deploy keys. The configuration file is stored at ``/var/www/.ssh/config``.

.. code-block:: config

    Host {{project_name}}.github.com
    HostName github.com
    User git
    IdentityFile /var/www/.ssh/{{project_name}}/id_rsa

Clone project source code
-------------------------

.. code-block:: bash

    $ cd /var/www
    $ git clone {{project_name}}.github.com:{{project_user}}/{{project_name}} {{project_name}}
