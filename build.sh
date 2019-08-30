#!/bin/bash
mkdir lib
mkdir lib/python
# Too lazy to write bjam or make
g++ -I/usr/local/include -I/usr/include/python -fPIC -c -o skewnorm_boost.o skewnorm_boost.cpp 
g++ -shared -Wl,-soname,"skewnorm_boost.so" -L/usr/local/lib skewnorm_boost.o -lboost_python -fpic -o lib/python/skewnorm_boost.so
g++ -I/usr/local/include -I/usr/include/python -fPIC -c -o studentst_boost.o studentst_boost.cpp 
g++ -shared -Wl,-soname,"studentst_boost.so" -L/usr/local/lib studentst_boost.o -lboost_python -fpic -o lib/python/studentst_boost.so
rm *.o