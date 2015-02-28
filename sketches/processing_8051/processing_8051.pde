
// draw mondrian composition with red, blue and yellow
// sheng-fen chien <schien@mail.ncku.edu.tw
// march 2010

// canvas 465x480
size(465, 480);
// set background as black
background(0);
// draw the largest red (231,62,23) block; upper-left 120,0; lower-left 120,338
noStroke();
fill(231, 62, 23);
rect(120, 0, 465-120, 338);
// draw the blue (82,90,165) block; upper-right 108,353
// noStroke();
fill(82, 90, 165);
rect(0, 353, 108, 480-353);
// draw the yellow (249,244,2) block; upper-left 447,425
// noStroke();
fill(249, 244, 2);
rect(447, 425, 465-447, 480-425);
// draw white blocks
// left-top; lower-right 108,135
// noStroke();
fill(255, 255, 255);
rect(0, 0, 108, 135);
// left-middle; upper-left 0,155
rect(0, 155, 108, 338-155);
// bottom-middle; upper-right 437,353
rect(120, 353, 437-120, 480-353);
// above yellow; lower-left 447,407
rect(447, 353, 465-447, 407-353);


