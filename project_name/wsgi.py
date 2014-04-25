"""
WSGI config for {{ project_name }} project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

from {{ project_name }}.common.utils import select_target


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "{{ project_name }}.settings.%s" % select_target())

application = get_wsgi_application()
