Project targets
===============

This template extends django to support multiple targets (equivalent to environments) for settings and requirements. This allows us to maintain the source code for various platforms and environments within the same repository under version control without any troubles.

The default targets included in this template are ``development``, ``production`` and ``test``. All those extend a common set of either requirements or settings which is called ``base`` and is designed rather as a helper than a standalone target. For sure you are free to add additional targets suiting your personal needs.

Default target
--------------

The default target is ``development``. If you like to override the default target (e.g. on your web server for deployment) just create a file called ``.target`` in the project root directory containing the name of the new default target. This ``.target`` file is excluded from version control.

For example on a Debian GNU/Linux system you can can set the default target to ``production`` by calling the following command in your project root directory.

.. code-block:: bash

    $ echo 'production' > .target


Using different targets
-----------------------

There is also a way to call commands with a different target than the default one. To change the target of the ``make`` command just change or set the ``TARGET`` environment variable to the suiting target name. The ``Makefile`` will then adjust the requirements and settings like defined in the the value of the environment variable.

To call the requirements makefile target for example once in production mode enter the following command in your project root directory.

.. code-block:: bash

    $ make requirements TARGET=production

To do the same but keep the target for all following make calls of your session (would be possible to override the target for ever as well) by calling the following command.

.. code-block:: bash

    $ export TARGET=production


Technical details
-----------------

A target is just a set of two files like already mentioned, one for the requirements and one to set or override settings. The filename without the file extension equals the target's name. Those files are located at ``/requirements/{{target-name}}.txt`` and ``/{{project-name}}/settings/{{target-name}}.py``. The requirements target file just contains a new line separated list of PyPi package names. The handling for base PyPi packages is done by our helper scripts. Meanwhile the settings target file has to or should extend from the common base settings. This is achieved by importing those with a simple one liner: ``from {{project-name}}.settings.base import *``.

At the moment there are three entry points for the target selection. One is the ``Makefile`` which also contains the logic itself. The other two are patched into the default ``manage.py`` and ``{{project-name}}/wsgi.py`` scripts while the selection logic itself is centralised in the ``{{project-name}}/common/utils.py`` script.
