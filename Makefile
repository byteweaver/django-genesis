VIRTUALENV_BIN?=virtualenv
VIRTUALENV_PYTHON_BIN?=python

PYTHON_BINARY="./bin/python"


virtualenv:
	test -x $(PYTHON_BINARY) || $(VIRTUALENV_BIN) --distribute --python $(VIRTUALENV_PYTHON_BIN) .

clean:
	rm -r {lib,include,bin}
