VIRTUALENV_BINARY?=virtualenv
VIRTUALENV_PYTHON_BINARY?=python

PYTHON_BINARY="./bin/python"


virtualenv:
	test -x $(PYTHON_BINARY) || $(VIRTUALENV_BINARY) --distribute --python $(VIRTUALENV_PYTHON_BINARY) .

clean:
	rm -r {lib,include,bin}
