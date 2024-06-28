pdfjam --outfile 10.pdf --paper a4paper kidssongs.pdf
pdf2ps 10.pdf 10.ps
ps2pdf -dDEVICEWIDTHPOINTS=595 -dDEVICEHEIGHTPOINTS=842 10.ps 10.pdf
