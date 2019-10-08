GPP=g++ -fPIC

OBJECTS = skewnorm studentst

all: py2 py3

py2: BOOST = boost_python
py2: PY_INCLUDE_DIR := $(shell python2 -c 'from __future__ import print_function; from distutils.sysconfig import get_python_inc; print(get_python_inc())')
py2: $(OBJECTS)
	

py3: BOOST = boost_python3
py3: PY_INCLUDE_DIR := $(shell python3 -c 'from __future__ import print_function; from distutils.sysconfig import get_python_inc; print(get_python_inc())')
py3: $(OBJECTS)



$(OBJECTS): %:%_boost.cpp %_boost.so
	$(GPP) -I$(PY_INCLUDE_DIR) -shared -Wl,-soname,"$@" -L/usr/lib $< -l$(BOOST) -o $@_boost.so
#	$(GPP) -shared -Wl,-soname,"$@_boost.so" -L/usr/lib $@_boost.o -l$(BOOST) -o $@_boost.so

%.so: %.o
	

%.o: %.cpp
	$(GPP) -I$(PY_INCLUDE_DIR) -c -o $@ $^
