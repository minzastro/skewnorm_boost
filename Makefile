GPP=g++ -fPIC
PY_INCLUDE_DIR := $(shell python -c 'from __future__ import print_function; from distutils.sysconfig import get_python_inc; print(get_python_inc())')

OBJECTS = skewnorm studentst

all: $(OBJECTS)

$(OBJECTS): %:%_boost.cpp %_boost.so
	$(GPP) -I$(PY_INCLUDE_DIR) -c -o $@_boost.o $^
	$(GPP) -shared -Wl,-soname,"$@_boost.so" -L/usr/lib $@_boost.o -lboost_python -o $@_boost.so
