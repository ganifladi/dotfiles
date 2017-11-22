#!/bin/bash

# cut extension
FILE=$(echo $1 | rev | cut -d '.' -f 2 | rev)

# create a working dir
mkdir ./tmp
cp $1 ./tmp
cd ./tmp

# merge n sites on one page
pdfnup -n 2 $1

# remove copied pdf
rm $1

# pdfnup creates duplets, so split this whole pdf up
pdfseparate $FILE-2up.pdf split-%d.pdf

# remove odd, duplicates and original -2up.pdf file
rm *[24680].pdf
rm $FILE-2up.pdf

# add leading zeros to files (1. advanced, 2. simple)
#for f in split-[0-9]*; do
#    mv $f $(printf split%05d.pdf ${f#split});
#done
for n in $(seq 9); do
    mv split-$n.pdf split-0$n.pdf
done

# reunite the left pdf
pdfunite *.pdf ../booklet.pdf

# cleanup
cd ..
rm -r ./tmp
