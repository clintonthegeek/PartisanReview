# PartisanReview

BASH script to scrape archives of literary criticism journal The Partisan
Review. Every issue of The Partisan Review can be found online in an
antiquated HTML viewer:

http://hgar-srv3.bu.edu/web/guest/collections/partisan-review/contents
 
After loading up an issue take note of its url. Open the viewer frame into a
full window if it is embedded within another page.

Provide two arguments: The first, in the URL, is the issues unique identifier
you wish to download, for example 'PR1939V6N2' for Winter 1939. The second is
the issue's total number of pages as seen in the viewer, for instance '128':
 
`./PartisanReview.sh PR1939V6N2 128`
 
If the img2pdf package is installed, then a PDF file will be generated. If
not, then you will be left with a folder containing the issue's pages in
JPG format.
