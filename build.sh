#!/bin/bash

mkdir -p target/en/images
mkdir -p target/en/figs

mkdir -p target/fr/images
mkdir -p target/fr/figs

rm -rf target/en/images
rm -rf target/en/figs
cp -r figs target/en
cp -r images target/en

rm -rf target/fr/images
rm -rf target/fr/figs
cp -r figs target/fr
cp -r images target/fr

# Build the Single HTML Page Version
asciidoc -b xhtml11 -a icons -a toc -a numbered -o asciidoc -o target/thucydides.html thucydides.asciidoc    
asciidoc -b xhtml11 -a icons -a toc -a numbered -o asciidoc -o target/thucydides-fr.html thucydides-fr.doc    
        
# Build the Multipage HTML Version
a2x -v -k -L -fchunked --xsl-file=docbook-xsl/custom-chunked.xsl  --asciidoc-opts "-a icons -a toc -a numbered"  --xsltproc-opts "--stringparam chunk.section.depth 1" -dbook -D target/en thucydides.asciidoc   
a2x -v -k -L -fchunked --xsl-file=docbook-xsl/custom-chunked.xsl  --asciidoc-opts "-a icons -a toc -a numbered"  --xsltproc-opts "--stringparam chunk.section.depth 1" -dbook -D target/fr thucydides-fr.doc   

# Build the PDF version
a2x -fpdf -dbook --fop --no-xmllint -v thucydides.asciidoc
a2x -fpdf -dbook --fop --no-xmllint -v thucydides-fr.doc

#a2x -v -k -L -fchunked --xsl-file=docbook-xsl/chunked.xsl  --asciidoc-opts "-a icons -a toc -a numbered"  --xsltproc-opts "--stringparam chunk.section.depth 1" -dbook -D target/fr thucydides-fr.doc   

sleep 30
