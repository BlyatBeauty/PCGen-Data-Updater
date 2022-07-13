#!/bin/bash

git clone 'https://github.com/PCGen/pcgen.git' 'pcgen-master'
rsync -aP 'pcgen-master/data/' 'data/'
rm -rf 'pcgen-master'

exit
