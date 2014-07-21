# Target
TARGET_FILE=.target
ifeq ($(wildcard $(TARGET_FILE) ),$(TARGET_FILE))
	TARGET?=$(shell cat $(TARGET_FILE))
else
	TARGET?=development
endif

VIRTUALENV_BINARY?=virtualenv
VIRTUALENV_PYTHON_BINARY?=python

PYTHON_BINARY=./bin/python
PIP_BINARY=./bin/pip
MANAGEPY_BINARY=$(PYTHON_BINARY) manage.py


all: requirements

virtualenv:
	test -x $(PYTHON_BINARY) || $(VIRTUALENV_BINARY) --python $(VIRTUALENV_PYTHON_BINARY) .

requirements: virtualenv
	$(PIP_BINARY) install -r requirements/base.txt
	$(PIP_BINARY) install -r requirements/$(TARGET).txt

test: TARGET=test
test: requirements
	$(MANAGEPY_BINARY) test --settings={{ project_name }}.settings.test

clean:
	rm -rf lib include bin share local

# DEBUG - command to show selected target
show-target:
	@echo "Current target is '$(TARGET)'."
