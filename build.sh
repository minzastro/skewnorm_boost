#!/bin/bash
# Too lazy to write bjam or make
g++ -I/usr/local/include -I/usr/include/python -fPIC -c -o skewnorm.o skewnorm.cpp 
g++ -shared -Wl,-soname,"skewnorm.so" -L/usr/local/lib skewnorm.o -lboost_python -fpic -o skewnorm.so
