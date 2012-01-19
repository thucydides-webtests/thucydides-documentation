#!/bin/bash

mkdir -p target/images
mkdir -p target/figs

rm -rf target/images
rm -rf target/figs
cp -r figs target
cp -r images target

# Build the Single HTML Page Version
asciidoc -b xhtml11 -a icons -a toc -a numbered -a pygments -o asciidoc -o target/thucydides.html thucydides.doc    
        
# Build the Multipage HTML Version
a2x -v -k -L -fchunked --xsl-file=docbook-xsl/chunked.xsl  --asciidoc-opts "-a icons -a toc -a numbered -a pygments"  --xsltproc-opts "--stringparam chunk.section.depth 1" -dbook -D target thucydides.doc   

sleep 30
