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


show-target:
	@echo $(TARGET)

virtualenv:
	test -x $(PYTHON_BINARY) || $(VIRTUALENV_BINARY) --distribute --python $(VIRTUALENV_PYTHON_BINARY) .

clean:
	rm -r {lib,include,bin}
