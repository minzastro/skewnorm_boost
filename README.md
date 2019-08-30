# skewnorm_boost
Exposing skewnorm and Student's t-distribootion from Boost.Math to Python
MUCH faster than scipy.stats.skewnorm/scipy.stats.t

# Requirements
Boost library is needed to compile this module. The following boost sub-packages are needed:
* math
* python
* python3 (for python3 bindings)

# Installation

## Method 1
1. run `make py2` for python2 or `make py3` for python3
2. Copy or link file from lib/python or lib/python3 anywhere in your PYTHONPATH.

## Method 2
1. Run build.sh to compile for python2.7 (or build3.sh for python 3.6).
1.1 If anything does not work - look into the script and correct pathes there.
2. Copy or link file from lib/python or lib/python3 anywhere in your PYTHONPATH.
