# Target
TARGET_FILE=.target
ifeq ($(wildcard $(TARGET_FILE) ),$(TARGET_FILE))
	TARGET?=$(shell cat $(TARGET_FILE))
else
	TARGET?=development
endif

VIRTUALENV_BINARY?=virtualenv
VIRTUALENV_PYTHON_BINARY?=python

PYTHON_BINARY="./bin/python"
PIP_BINARY="./bin/pip"


show-target:
	@echo $(TARGET)

virtualenv:
	test -x $(PYTHON_BINARY) || $(VIRTUALENV_BINARY) --distribute --python $(VIRTUALENV_PYTHON_BINARY) .

requirements: virtualenv
	$(PIP_BINARY) install -r requirements/base.txt
	$(PIP_BINARY) install -r requirements/$(TARGET).txt

clean:
	rm -r {lib,include,bin}
