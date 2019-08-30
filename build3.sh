#!/bin/bash
# Too lazy to write bjam or make
mkdir lib
mkdir lib/python3
g++ -I/usr/local/include -I/usr/include/python3.7m -fPIC -c -o skewnorm_boost.o skewnorm_boost.cpp 
g++ -shared -Wl,-soname,"skewnorm_boost.so" -L/usr/local/lib skewnorm_boost.o -lboost_python3 -fpic -o lib/python3/skewnorm_boost.so
g++ -I/usr/local/include -I/usr/include/python3.7m -fPIC -c -o studentst_boost.o studentst_boost.cpp 
g++ -shared -Wl,-soname,"studentst_boost.so" -L/usr/local/lib studentst_boost.o -lboost_python3 -fpic -o lib/python3/studentst_boost.so
rm *.o