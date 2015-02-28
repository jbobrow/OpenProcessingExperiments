
size(500,500);
background(223, 214, 183);
smooth();

//overlay1
noStroke();
fill(207, 204, 185);
quad(0,0, 500,0, 500,30, 0,44);

//overlay2
noStroke();
fill(224, 219, 190);
quad(0,44, 500,30, 500,82, 0,73);

//overlay3
noStroke();
fill(203, 204, 186);
quad(0,193, 500,193, 500,307, 0,307);

//overlay4
noStroke();
fill(206, 207, 189);
quad(0,307, 500,307, 500,383, 0,387);

//lines
stroke(185,184,166);
strokeWeight(1);
strokeCap(SQUARE);
noFill();

beginShape();
vertex(0, 352);
bezierVertex(86, 355, 333, 357, 500, 348);
endShape();

beginShape();
vertex(0, 313);
bezierVertex(109, 318, 350, 318, 500, 314);
endShape();

beginShape();
vertex(0, 352);
bezierVertex(86, 355, 333, 357, 500, 348);
endShape();

beginShape();
vertex(0, 243);
bezierVertex(112, 250, 352, 248, 500, 239);
endShape();

beginShape();
vertex(0, 217);
bezierVertex(112, 222, 352, 219, 500, 211);
endShape();

line(112,222, 108,318);
line(491,329, 500,328);
line(235,220, 234,274);
line(352,219, 349,317);
line(365,245, 500,305);
line(481,241, 500,256);
line(73,198, 0,153);
line(73,198, 136,163);
line(144,169, 0,81);
line(79,67, 0,108);
line(99,76, 33,114);
line(149,105, 19,166);
line(105,144, 44,180);
quad(174,157, 256,158, 288,218, 156,220);
quad(282,149, 500,50, 500,109, 341,184);
line(226,136, 0,126);
line(312,135, 370,171);
line(284,92, 398,158);
line(338,69, 451,132);
line(310,81, 422,145);
line(478,119, 364,57);
line(392,45, 500,104);
line(415,34, 500,79);
line(442,22, 500,52);
line(466,12, 500,28);
line(490,1, 500,6);
line(149,105, 0,29);
line(149,105, 0,21);
line(284,92, 493,0);
line(347,69, 493,0);
line(486,3, 485,55);
line(0,55, 36,39);
line(0,33, 12,27);
line(126,70, 0,2);
line(101,16, 137,0);
line(329,16, 301,0);
line(70,94, 374,91);
line(0,46, 500,42);
line(0,53, 500,50);
line(500,55, 0,56);
line(72,65, 0,58);
line(0,67, 500,67);
line(99,78, 0,79);
line(40,88, 0,86);
line(165,11, 166,93);
line(192,93, 191,0);
line(205,0, 203,93);
line(223,74, 225,19);
line(252,19, 251,74);
line(267,92, 267,29);
line(452,57, 452,85);
line(438,57, 438,80);
line(415,58, 415,90);
line(500,86, 284,81);
triangle(253,0, 302,28, 366,0);
triangle(70,0, 126,28, 191,0);
bezier(0,35, 63,36, 418,36, 500,36);
bezier(500,42, 402,43, 166,41, 0,39);
bezier(0,19, 161,27, 354,23, 500,6);
bezier(0,0, 104,15, 326,16, 382,0);

//perspective quads
noStroke();
fill(142, 135, 117);
triangle(22,100, 0,106, 0,105);
triangle(0,122, 26,110, 0,123); 
triangle(0,152, 64,113, 0,155);
fill(142, 135, 117, 180);
quad(0,219, 14,204, 18,207, 0,227);
triangle(17,201, 110,106, 20,204);
quad(0,481, 143,116, 14,500, 0,500);
triangle(287,500, 183,116, 311,500);
triangle(500,439, 203,113, 500,420);
triangle(500,277, 240,111, 500,268);
triangle(500,203, 290,113, 500,197);
triangle(500,161, 315,108, 500,157);
triangle(500,136, 334,102, 500,134);

//light blue quad
stroke(185,184,166);
strokeWeight(1);
strokeCap(SQUARE);
fill(216,230,245,185);
quad(344,0, 369,0, 488,240, 443,243);

//yellow ellipses
noStroke();
fill(246,182,50);
ellipse(183,292, 179,62);
ellipse(183,209, 104,29);
ellipse(183,162, 56,11);

//thick black lines
stroke(34,38,37);
strokeWeight(1.5);
strokeCap(SQUARE);
noFill();

line(281,150, 500,298);
line(390,168, 500,124);
line(500,235, 390,168);
line(298,182, 421,174);
line(421,174, 500,209);
line(11,144, 500,131);
line(54,146, 184,77);
line(113,469, 500,370);
line(182,135, 226,331);
line(0,446, 130,483);

bezier(298,182, 313,184, 343,186, 361,185);
bezier(361,185, 364,185, 363,189, 360,191);
beginShape();
vertex(360, 191);
bezierVertex(295, 227, 302, 234, 373, 282);
endShape();
bezier(373,282, 438,327, 447,338, 500,395);

bezier(370,203, 398,180, 317,131, 248,92);

strokeWeight(3);
line(130,483, 0,486);

strokeCap(PROJECT);
line(439,0, 434,13);

strokeWeight(3.3);
line(298,288, 500,274);
line(0,350, 500,332);

//yellow quads
noStroke();
fill(246,182,50,240);
quad(401,182, 429,182, 429,191, 400,192);
quad(431,192, 437,183, 496,181, 500,190);
fill(246,182,50);

//turquoise line
stroke(73,181,219);
strokeWeight(1.5);
noFill();
beginShape();
vertex(63, 47);
bezierVertex(71, 31, 82, 16, 112, 0);
endShape();
beginShape();
vertex(486, 86);
bezierVertex(487, 95, 489, 105, 500, 114);
endShape();
//brown line
stroke(121,107,98);
bezier(186,12, 197,12, 205,6, 205,0);
bezier(186,9, 197,9, 202,4, 202,0);
bezier(186,6, 197,6, 199,1, 199,0);
bezier(222,12, 212,12, 205,6, 205,0);
bezier(222,9, 212,9, 208,4, 208,0);
bezier(222,6, 212,6, 211,1, 211,0);

//red line
stroke(220,79,49);
strokeWeight(2);
line(0,230, 132,236);

//maroon line
stroke(184,48,52);
strokeWeight(3.3);
line(104,-1, 496,81);
//blue line
stroke(42,75,142);
noFill();
beginShape();
vertex(0, 114);
bezierVertex(25, 126, 269, 205, 500, 235);
endShape();
//bluegrey line
stroke(94, 111, 118);
bezier(84,173, -30,287, 0,419, 500,449);

//dots
noStroke();
//red
fill(220,79,49);
ellipse(275,50, 9,9);
//maroon
fill(184,48,52);
ellipse(427,45, 12,12);
//bluegreen
fill(124,157,136);
ellipse(441,111, 7,7);
ellipse(486,0, 6,6);
//darkgreen
fill(89,109,108);
ellipse(414,129, 7,7);
ellipse(428,85, 8,8);
ellipse(451,35, 8,8);
ellipse(468,1, 8,8);
//blue
fill(42,75,142);
ellipse(30,117, 16,16);
ellipse(156,167, 16,16);
ellipse(161,28, 8,8);
ellipse(356,42, 9,9);
ellipse(361,37, 9,9);

noStroke();
fill(87,84,69);
beginShape();
vertex(0,7);
vertex(4,8);
vertex(7,8);
vertex(9,9);
vertex(11,7);
vertex(15,5);
vertex(17,6);
vertex(22,10);
vertex(17,11);
vertex(14,11);
vertex(7,11);
vertex(0,9);
endShape();




