import os
import sys


def select_target():
    target = 'development'
    if os.path.isfile('.target'):
        target = open('.target', 'r').readline().strip()
        if not target or not os.path.isfile('{{ project_name }}/settings/%s.py' % target):
            sys.exit("Missing settings file for target '%s'." % target)
    return target
