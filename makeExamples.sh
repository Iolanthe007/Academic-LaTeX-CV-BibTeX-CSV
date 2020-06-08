#!/bin/bash

rm -rf examples
mkdir -p examples
for file in *.pdf; do
	gm convert $file "examples/$file.png"
done
