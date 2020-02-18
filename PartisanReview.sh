#!/bin/bash
# Ripper for individual issues of The Partisan Review literary magazine.
# Ver 1.0
# Clinton Ignatov
# https://github.com/clintonthegeek/PartisanReview/
# Licensed under the GPL 3.0

if [ $# -eq 0 ]
then
    echo "Every issue of The Partisan Review can be found online in an antiquated HTML"
    echo "viewer: http://hgar-srv3.bu.edu/web/guest/collections/partisan-review/contents"
    echo " "
    echo "After loading up an issue take note of its url. Open the viewer frame into a"
    echo "full window if it is embedded within another page."
    echo " "
    echo "Provide two arguments: The first, in the URL, is the issues unique identifier"
    echo "you wish to download, for example 'PR1939V6N2' for Winter 1939. The second is"
    echo "the issue's total number of pages as seen in the viewer, for instance '128':"
    echo " "
    echo "./PartisanReview.sh PR1939V6N2 128"
    echo " "
    echo "If the img2pdf package is installed, then a PDF file will be generated. If"
    echo "not, then you will be left with a folder containing the issue's pages in"
    echo "JPG format."

else
    mkdir $1
    cd $1
    for ((i=1;i<=9;i++)); do wget -nv http://www.bu.edu/partisanreview/books/$1/HTML/files/assets/common/page-substrates/page000$i.jpg; done
    if [ $2 -lt 100 ]
       then
       for ((j=10;j<=$2;j++)); do wget -nv http://www.bu.edu/partisanreview/books/$1/HTML/files/assets/common/page-substrates/page00$j.jpg; done
    else
        for ((k=10;k<=99;k++)); do wget -nv http://www.bu.edu/partisanreview/books/$1/HTML/files/assets/common/page-substrates/page00$k.jpg; done
        for ((l=100;l<=$2;l++)); do wget -nv http://www.bu.edu/partisanreview/books/$1/HTML/files/assets/common/page-substrates/page0$l.jpg; done
    fi
    if hash img2pdf 2>/dev/null; then
        img2pdf --output ../$1.pdf *.jpg
        cd ..
        rm -r $1
    else
        cd ..
    fi
fi
