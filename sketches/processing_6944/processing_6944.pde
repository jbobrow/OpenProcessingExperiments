
size(640,480);
background(230,222,211);

smooth();
//Middle ellipses intersecting
noStroke();
fill(221,174,60, 175);
ellipse(342,192, 85,85);
fill(200,108,69, 175);
ellipse(355,192, 78,78);
fill(167,183,170);
arc(352,192, 78,78, radians(90),radians(270));
arc(342,192, 82,82, radians(360-82),radians(360+80));
fill(255);
quad(352,230, 374,218, 385,234, 362,247);
quad(407,202, 469,169, 476,185, 422,215);
quad(391,188, 477,142, 470,166, 405,201);
quad(495,132, 640,56, 640,75, 520,139);
//Place blackoutline topmost**
//middle pink rect
fill(204,150,163, 175);
noStroke();
rect(248,200, 70,60);


//working left to right
//left half-circle
fill(255);
stroke(0);
ellipse(-5,280,86,86);
strokeWeight(7);
ellipse(-5,280,50,50);
strokeWeight(2);
stroke(204,79,59);
ellipse(-5,280,45,45);

//rect under half ellipse
fill(0);
stroke(0);
quad(0,333, 10,325, 21,340, 0,356);
fill(255);
noStroke();
triangle(0,354, 0,344, 4,350);

//left arcs
noFill();
stroke(0);
arc(60,150, 200,180, radians(180), radians(260));
arc(60,200, 200,160, radians(180), radians(240));

//leftmost blue circle
strokeWeight(1);
fill(125,141,166);
ellipse(59,83, 35,35);

//large white triangle
noStroke();
fill(242,240,243);
triangle(0,480, 120,20, 250,480);

//left green diagonals
noStroke();
fill(86,105,75);
quad(116,273, 117,281, 0,425, 0,422);
quad(116,273, 116,280, 315,385, 315,380);

//yellow diagonal line on white triangle
stroke(228,182,35);
strokeWeight(3);
line(268,294, 161,375);
//black line above
stroke(0);
strokeCap(SQUARE);
line(268,290, 160,373);

//left orange diagonal, black under
strokeWeight(3);
stroke(223,104,70);
line(8,370, 230,250);
strokeWeight(1);
stroke(0);
line(7,372, 231,252);

//yellow left triangle
noStroke();
fill(231,184,10);
triangle(130,120, 165,70, 190,120);

//bottom left triangle
fill(213,212,182, 180);
triangle(0,417, 70,480, 0,480);
//bottom triangles
fill(166,104,53);
triangle(53,480, 219,366, 250,480);
fill(42,76,77);
quad(219,366, 250,480, 315,480, 235,355); 
//line across bottom left triangle
stroke(0);
line(0,417, 70,480);
//outer circles surrounding b/w
fill(214,217,226);
strokeWeight(0);
arc(279,422, 58,58, radians(236),radians(420));
noFill();
stroke(225,189,77);
strokeWeight(3);
arc(279,422, 61,61, radians(236),radians(420));
stroke(217,113,84);
arc(279,422, 92,92, radians(236),radians(418));
//black/white circle on green quad
fill(0);
noStroke();
ellipse(279,422, 28,28);
fill(255);
arc(279,422, 26,26, radians(60),radians(238));

//center diagonal lines on white triangle
fill(0);
quad(312,380, 116,263, 116,273, 310,379);
quad(116,263, 116,273, 0,425, 0,422);

//black lines on white triangle
stroke(0);
strokeWeight(3);
line(0,480, 120,20);
line(120,20, 250,480);
strokeWeight(1);
line(227,229, 0,83);
line(227,229, 6,139);
line(155,270, 20,345);
line(156, 273, 19, 348);

//circles, bottom right yellow triangle
fill(173,153,146);
ellipse(207,132, 45,45);
stroke(255);
fill(35,72,143);
ellipse(207,132, 33,33);

//middle circle inside of triangle
noStroke();
fill(216,216,190, 80);
ellipse(121,227, 46,46);
stroke(0);
strokeWeight(1);
fill(243,236,230);
ellipse(121,227, 33,33);

//black lines pattern, left middle
stroke(0);
strokeWeight(1);
int x = 230;
int xWidth = 40;
int yLow = 150;
int yHigh = 40;
int ySpace = 2;
//bottom three
line(x, yLow, x + xWidth, yLow);
yLow = yLow + ySpace;
line(x, yLow, x + xWidth, yLow);
yLow = yLow + ySpace;
line(x, yLow, x + xWidth, yLow);
//top two
line(x, yHigh, x + xWidth, yHigh);
yHigh = yHigh + ySpace;
line(x, yHigh, x + xWidth, yHigh);
//vertical two
strokeWeight(2);
int vertX = 245;
int vertYbot = 170;
int vertYtop =0;
int xSpace = 5;
line(vertX, vertYtop, vertX, vertYbot);
vertX = vertX + xSpace;
line(vertX, vertYtop, vertX, vertYbot);
//arc in between
noFill();
strokeWeight(1.5);
arc(257,75, 40,40, radians(85), radians(275));

//circle patterns middle left bottom
fill(0);
stroke(0);
strokeWeight(1);
ellipse(210,430, 80,80);
//colored arcs in between
fill(23,89,176);
arc(210,430, 79,79, radians(115),radians(145));
arc(210,430, 79,79, radians(238),radians(253));
arc(210,430, 79,79, radians(267),radians(292));
arc(210,430, 79,79, radians(54),radians(87));
fill(222,198,90);
arc(210,430, 79,79, radians(168),radians(192));
arc(210,430, 79,79, radians(328),radians(337));
fill(100,124,184);
arc(210,430, 79,79, radians(347),radians(370));
fill(251,239,241);
arc(210,430, 79,79, radians(90),radians(93));
arc(210,430, 79,79, radians(96),radians(99));
arc(210,430, 79,79, radians(102),radians(105));
arc(210,430, 79,79, radians(108),radians(111));
arc(210,430, 79,79, radians(255),radians(258));
arc(210,430, 79,79, radians(261),radians(264));
//inner ellipses
stroke(0);
fill(213,212,218);
ellipse(210,430, 63,63);
fill(0);
ellipse(215,427, 11,11);
//quad patterns coming out of ellipse
noStroke();
fill(255);
//left
quad(129,397, 134,382, 205,415, 205,417);
fill(214,67,47);
quad(179,402, 205,415, 205,417, 176,410);
fill(219,215,190);
quad(179,402, 176,410, 172,408, 174,401);
fill(0);
quad(172,408, 174,401, 172,400, 171,407);
quad(170,408, 171,400, 170,398, 168,408);
quad(169,398, 167,397, 165,408, 167,406);
fill(214,67,47);
quad(163,407, 166,396, 161,394, 158,406);
fill(105,87,85);
quad(154,404, 156,392, 134,382, 129,397);

//right
fill(255);
fill(230,222,211);
quad(223,407, 287,328, 294,337, 223, 409);
fill(214,67,47);
quad(232,395, 235,398, 223,409, 223,407);
noFill();
quad(232,396, 235,398, 248,385, 243,382);
fill(214,67,47);
quad(248,385, 243,382, 258,364, 264,369);
fill(230,222,211);
quad(258,364, 264,370, 269,364, 263,358);
fill(0);
quad(269,364, 263,358, 287,328, 294,337);
//outer stroke ellipse, cleaning up
stroke(0);
strokeWeight(2);
noFill();
ellipse(210,430, 80,80);
//last quad patterns, above ellipse
fill(255);//temp
noStroke();
quad(227,434, 228,433, 276,480, 265,480);
fill(214,67,47);
quad(227,434, 228,433, 247,451, 244,455);
fill(0);
quad(257,470, 262,466, 265,469, 259,473);
quad(267,470, 270,473, 263,478, 260,475);
quad(267,480, 273,476, 276,480, 270,482);


//arcs through left middle
//from left to right, is there a better way to do this?
noFill();

//1st color
stroke(221,124,105);
strokeWeight(4);
arc(129,407, 77,77, radians(140),radians(310));
//2nd color
stroke(203,65,65);
strokeWeight(5);
arc(173,352, 65,67, radians(130),radians(315));
//3rd color
stroke(173,76,67);
strokeWeight(4);
arc(223,312, 62,62, radians(144),radians(315));
//2nd black
stroke(0);
strokeWeight(4);
arc(175,353, 63,63, radians(130),radians(315));
//1st black
stroke(0);
strokeWeight(1);
arc(130,408, 74,74, radians(140),radians(310));
//4th color
stroke(230,108,103);
strokeWeight(4);
arc(257,280, 34,34, radians(140),radians(315));
//3rd black
stroke(0);
strokeWeight(1);
arc(223,312, 60,60, radians(144),radians(315));
//4th black
arc(257,280, 32,32, radians(140),radians(315));
//black diagonals across arcs
line(276,240, 85,420);
strokeWeight(2);
line(265,235, 123,365);

//right top little squares
fill(232,227,221);
stroke(222,203,144, 150);
strokeWeight(2);
rect(407,47, 37,37);
//inner
fill(222,203,144);
stroke(0);
strokeWeight(4);
rect(415,55, 20,20);

//right bottom pattern
//squares
noStroke();
fill(210,214,223);
rect(555,350, 30,30);
fill(190,74,75);
rect(585,350, 30,30);
fill(212,173,166);
rect(555, 380, 30,30);
fill(200,204,213);
rect(585,380, 30,30);
stroke(0);
strokeWeight(2);
noFill();
//horizontal
line(640, 350, 505,350);
line(640, 380, 505,380);
line(640,410, 505,410);
//vertical
line(615,305, 615,455);
line(585,305, 585,455);
line(555,305, 555,455);

//right side
//yellow circle, blue inner circle
stroke(0);
strokeWeight(0);
fill(214,188,95);
ellipse(500,165, 62,62);
fill(65,139,188);
ellipse(500,165, 50,50);

//white circle to the right
strokeWeight(2);
fill(236,235,240);
ellipse(590,190, 46,46);

//FIX? Opacity throwing color off
//ellipses, middle  right
//quad first, to the left
stroke(0);
fill(61,52,53);
quad(483,240, 501,270, 472,289, 453,260);
noStroke();
fill(208,70,44, 200);
ellipse(504,240, 60,60);
fill(162,148,161, 200);
ellipse(503,238, 54,54);

//line patterns, right half
stroke(0);
strokeWeight(2);
//edges, big portion
line(276,219, 640,27);
line(276,219, 425,480);
//lines, towards bottom right
line(293,209, 450,480);
line(312,200, 482,480);
line(329,192, 487,480);

//lines, towards top right
line(288,241, 640,53);
line(299,258, 640,77);
line(309,275, 501,174);
line(357,273, 599,146);
line(368,292, 599,146);
line(377,308, 484,240);
//outer part to the left, edges
line(290,317, 368,264);
line(290,317, 392,480);
//intersecting lines
line(301,336, 348,305);
line(310,351, 357,321);
line(321,369, 367,338);
line(333,387, 387,350);

line(307,307, 417,480);
line(332,315, 438,480);
//small lines crossing
line(580,58, 592,79);
line(555,72, 566,92);
line(470,117, 483,136);
line(446,130, 459,149);
line(370,170, 421,217);
line(387,235, 349,181);
line(501,173, 512,191);

//quads scattered about
fill(0);
noStroke();
quad(554,122, 565,141, 545,152, 534,133);
quad(547,179, 557,193, 541,202, 532,188);
quad(561,202, 572,221, 555,232, 543,212);
quad(507,280, 520,301, 492,321, 478,299);

//quad fills into line patterns
//from right to left
fill(110,114,126);
quad(580,59, 592,79, 566,92, 556,73);
fill(87,77,85);
quad(470,117, 483,137, 460,149, 447,130);
fill(0, 175);
quad(473,189, 501,174, 512,191, 483,207); 
fill(86,99,92, 150);
quad(369,170, 388,188, 362,201, 350,182); 
fill(178,164,161, 150);
quad(404,203, 420,217, 388,234, 375,218);
fill(181,182,138, 150);
quad(349,182, 361,200, 341,210, 331,193);
fill(109,105,68, 150);
quad(363,202, 373,218, 351,230, 341,212);
fill(0, 150);
quad(312,202, 323,219, 314,224, 302,207);
fill(199,48,55);
quad(294,211, 305,232, 289,240, 278,220);
fill(115,100,105);
quad(307,233, 315,249, 299,258, 290,242);
fill(241,96,129);
triangle(300,260, 317,251, 317,260);
//whites
fill(255);
quad(301,261, 317,261, 324,267, 310,275);
triangle(324,267, 317,261, 317,250);
quad(328,267, 346,257, 354,272, 338,283);
quad(355,274, 418,378, 402,392, 340,285);
stroke(0);
line(333,387, 387,350);
noStroke();
quad(338,359,  347,375, 333,385, 323,369);
quad(367,341, 376,356, 366,363, 355,348);
quad(341,334, 349,348, 339,355, 330,340);
quad(317,327, 326,340, 312,350, 303,336);
quad(349,308, 357,321, 344,329, 334,316);
quad(320,298, 330,315, 319,322, 309,307);
quad(349,233, 359,248, 347,254, 338,239);
quad(359,251, 367,264, 357,271, 348,257);
quad(369,269, 377,284, 369,290, 359,274);
quad(379,287, 387,301, 378,307, 370,293);
quad(381,285, 476,226, 472,246, 389,299);
quad(363,249, 473,191, 481,206, 371,264);
quad(583,60, 640,30, 640,52, 593,77);
quad(554,74, 563,92, 484,134, 473,118);
quad(446,131, 457,148, 394,182, 384,164);
triangle(401,201, 394,193, 393,207);
//ellipse outline
stroke(0);
strokeWeight(3);
noFill();
ellipse(342,192, 85,85);
//blacks
noStroke();
fill(35,29,31);
quad(327,267, 337,286, 320,297, 309,276);
quad(335,238, 346,256, 327,266, 316,248);
quad(328,341, 339,358, 322,369, 312,351);
quad(351,350, 360,368, 350,375, 339,358);
quad(368,429, 362,422, 357,425, 362,433);
//others, on left side
fill(83,74,75);
quad(307,307, 318,325, 302,335, 291,318);
fill(77,66,64);
quad(338,286, 349,306, 332,316, 322,297);
fill(80,78,91);
quad(332,317, 340,331, 329,339, 319,326);
fill(185,185,185);
quad(358,323, 367,339, 353,347, 344,331);
//browns
fill(202,137,79);
quad(361,370, 426,480, 418,480, 351,376);
quad(379,358, 450,480, 437,480, 366,366);
quad(390,302, 487,480, 482,480, 378,309);
triangle(371,267, 580,158, 380,284);
quad(424,387, 406,402, 402,394, 420,379);
quad(388,403, 392,410, 388,414, 384,406);
quad(374,414, 378,421, 368,429, 362,422);
//red/brown/black quad from bottom
noFill();
stroke(0);
strokeWeight(2);
quad(285,480, 574,261, 581,268, 300,480);
noStroke();
fill(196,49,39);
quad(286,480, 358,427, 362,433, 299,480);
fill(25,20,24);
quad(574,261, 581,268, 434,380, 429,372);
//black quad near mid bottom
quad(324,436, 467,480, 441,480, 322,443);

//blue ellipse
noStroke();
fill(11,96,160, 200);
ellipse(389,391, 86,86);






