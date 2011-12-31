#!/bin/bash

mkdir -p target/images
mkdir -p target/figs

rm -rf target/images
rm -rf target/figs
cp -r figs target
cp -r images target

# Build the Single HTML Page Version
asciidoc -b xhtml11 -a icons -a toc2 -a numbered -a pygments -o asciidoc -o target/index.html thucydides.doc 
