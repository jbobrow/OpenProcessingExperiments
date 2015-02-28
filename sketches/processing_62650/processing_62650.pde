
size (640, 480);
background (173, 182, 166);

smooth ();

//Midground
fill (186, 192, 171);
noStroke();
quad (0, 209, 640, 380, 640, 480, 0, 480);



//upperrightcornerelement
fill (210, 205, 171);
noStroke();
triangle (520, 10, 638, 5, 550, 47);



//blackedgeline
noFill();
strokeWeight (3);
strokeCap (SQUARE);
stroke (11, 23, 21, 210);
beginShape();
vertex(640, 26);
vertex(571, 30);
vertex(607, 54);
vertex(640, 51);
endShape();



//ground
fill (210, 205, 171);
noStroke();
quad (0, 418, 640, 440, 640, 480, 0, 480);



//GreyLine1
noFill ();
strokeWeight (22);
stroke (149, 150, 134);
line (272, 490, 650, 330);

//GreyLine2
noFill ();
strokeWeight (19);
stroke (149, 150, 134);
line (-10, 330, 650, 157);

//GreyLine3
noFill ();
strokeWeight (16);
stroke (149, 150, 134);
line (-10, 180, 650, 61);



//blackbaseline1
noFill ();
strokeWeight (4);
stroke (11, 23, 21);
line (165, 378, 464, 434);

//blackbaseline2
noFill ();
strokeWeight (4);
strokeCap (ROUND);
stroke (11, 23, 21);
line (464, 434, 642, 384);

//blackedgeline
noFill ();
strokeWeight (4);
strokeCap (ROUND);
stroke (11, 23, 21);
line (528, 294, 642, 337);



//thinblackdaig1
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (325, 30, 568, 110);

//thinblackdaig2
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (124, 86, 640, 231);

//thinblackdaig3
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (0, 74, 527, 253);

//thinblackdaig4
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (0, 108, 640, 305);

//thinblackvert1
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (362, 0, 362, 43);

//thinblackvert2
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (443, 0, 443, 69);

//thinblackvert3
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (509, 0, 509, 70);

//thinblackvert4
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 90);
line (590, 0, 590, 90);

//thinblackdaig5
noFill ();
strokeWeight (1);
strokeCap (SQUARE);
stroke (11, 23, 21, 100);
line (0, 294, 534, 448);



//bluerect
fill (21,83,132);
noStroke ();
rectMode (CENTER);
rect (320, 177, 640, 28);

//bluetriangle
fill (21,83,132);
noStroke ();
triangle (0, 151, 0, 170, 375, 164);

//bluequad
fill (21,83,132);
noStroke ();
quad (213, 234, 470, 123, 760, 132, 400, 225);



//Redspot1
fill (157, 42, 42);
noStroke ();
ellipseMode(CENTER);
ellipse (408, 118, 17, 17);

//Redspot2
fill (157, 42, 42);
noStroke ();
ellipseMode(CENTER);
ellipse (489, 113, 18, 18);

//Reddash
noFill ();
stroke (157, 42, 42);
strokeWeight (17);
line (408, 118, 489, 113);

//Redarc
noFill();
stroke (157, 42, 42);
strokeWeight (5);
ellipseMode(CENTER);
arc (590, 91, 486, 260,  PI/2, TWO_PI);



//yellowquadbanner0
fill (243, 177, 45);
noStroke ();
quad (621, 92, 623, 148, 640, 154, 640, 98);

//yellowquadbanner1
fill (243, 177, 45);
noStroke ();
quad (498, 64, 545, 77, 530, 120, 505, 111);

//yellowquadbanner 2
fill (243, 177, 45);
noStroke ();
quad (407, 41, 413, 81, 427, 83, 435, 49);

//yellowquadbanner 3
fill (243, 177, 45);
noStroke ();
quad (328, 16, 332, 51, 344, 55, 350, 24);

//yellowquadbanner 4
fill (243, 177, 45);
noStroke ();
quad (258, -4, 263, 24, 272, 27, 279, 2);

//yellowquadbanner 5
fill (243, 177, 45);
noStroke ();
quad (214, 0, 215, 6, 221, 7, 223, 0);



//blackquadbanner1
fill (11, 23, 21);
noStroke ();
quad (559, 80, 568, 131, 593, 139, 609, 91);

//blackquadbanner 2
fill (11, 23, 21);
noStroke ();
quad (450, 52, 457, 96, 476, 101, 487, 63);

//blackquadbanner 3
fill (11, 23, 21);
noStroke ();
quad (363, 28, 369, 64, 382, 69, 391, 38);

//blackquadbanner 4
fill (11, 23, 21);
noStroke ();
quad (296, 6, 300, 39, 307, 42, 316, 12);

//blackquadbanner 5
fill (11, 23, 21);
noStroke ();
quad (235, 0, 237, 15, 246, 18, 249, 0);



//blackbox
noFill ();
strokeWeight (4);
strokeCap (SQUARE);
stroke (11, 23, 21);
quad (179, 8, 179, 34, 519, 34, 519, 24);

//blackarcs1
noFill ();
strokeWeight (4);
strokeCap (SQUARE);
stroke (11, 23, 21);
line (464, 223, 640, 275);

//blackarcroundnarrow1 
noFill();
stroke (11, 23, 21);
strokeWeight (4);
ellipseMode(CORNER);
arc (239, 72, 802, 176,  2.275, TWO_PI);

//blackarcs2
noFill ();
strokeWeight (4);
strokeCap (SQUARE);
stroke (11, 23, 21);
line (360, 223, 801, 316);

//blackarcroundwide2
noFill();
stroke (11, 23, 21);
strokeWeight (4);
ellipseMode(CORNER);
arc (362, 72, 560, 170,  2.25, TWO_PI);



//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (0, 59, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (2, 57, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (10, 54, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (16, 52, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (21, 51, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (26, 49, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (25, 48, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (31, 47, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (37, 44, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (42, 43, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (48, 41, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (53, 39, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (58, 38, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (60, 37, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (69, 35, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (74, 34, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (80, 33, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (86, 30, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (89, 28, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (94, 27, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (100, 26, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (105, 25, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (109, 24, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (110, 23, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (117, 22, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (116, 21, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (122, 19, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (128, 18, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (134, 17, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (136, 16, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (139, 14, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (147, 9, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (153, 7, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (161, 5, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (164, 4, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (167, 2, 4, 3);

//dottedline
fill (11, 23, 21, 100);
noStroke();
ellipse (171, 0, 4, 3);

