
size(640, 480);


background(216, 214, 191);

smooth();

//red rectangle

fill(181, 47, 46);
noStroke();
quad(343,17, 383,27, 380,50, 347,36);
quad(489,82, 590,82, 587,97, 487,95);


//pink rectangles 
fill(212, 137, 178);
quad(433,43, 501,36, 501,54, 432,62);


//light brown lines
noFill();
stroke(160, 105, 66);
strokeWeight(5);

line(192,5, 167,131);
line(167,131, 180,113);

line(205,84, 321,84);
line(230,72, 245,141);
line(256,72, 271,141);
line(282,73, 295,143);
line(306,74, 320,134);

line(339,91, 343,123);
line(363,88, 369,129);
line(393,89, 397,130);
line(424,87, 422,126);
line(455,89, 453,127);
line(487,73, 484,127);
line(512,75, 511,136);
line(534,76, 539,145);
line(568,75, 563,145);


//yello shapes

fill(236, 189, 47);
noStroke();

beginShape();
vertex(0,91);
vertex(65,83);
vertex(69,95);
vertex(124,87);
vertex(139,133);
vertex(0,150);
endShape();


quad(529,99, 552,84, 578,99, 553,116);

quad(617,215, 648,215, 648,221, 617,221);

beginShape();
vertex(529,118);
vertex(640,125);
vertex(640,177);
vertex(624,175);
vertex(626,169);
vertex(529,166);
endShape();

noFill();
stroke(236, 189, 47);
strokeWeight(4);
strokeCap(SQUARE);

line(170,246, 168,250);
line(162,253, 160,257);
line(155,261, 153,266);

strokeWeight(6);
line(168,252, 166,256);
line(160,260, 158,264);
line(172,251, 171,255);
line(169,259, 165,263);

strokeWeight(8);
line(161,268, 158,272);
line(167,267, 164,271);
line(174,260, 171,263);

strokeWeight(10);
line(174,268, 171,272);
line(170,276, 167,280);


//brown  strokes
noFill();
stroke(74, 44, 29);
strokeWeight(2);

beginShape();
vertex(100, 0);
bezierVertex(100, 0, 107,7, 115,36);
bezierVertex(115,36, 120,32, 127,0);
endShape();


//brown curve horizontal strokes
strokeWeight(4);

beginShape();
vertex(0, 157);
bezierVertex(25,152, 535,150, 640,155);
endShape();

beginShape();
vertex(0, 187);
bezierVertex(25,182, 535,176, 640,183);
endShape();

beginShape();
vertex(0, 237);
bezierVertex(25,231, 545,222, 640,236);
endShape();






//white rectangles
fill(230, 230, 228);
noStroke();

quad(52,0, 70,0, 103,76, 86,76);
quad(0,115, 29,161, 14,161, 0,147);
quad(0,225, 33,245, 11,245, 0,241);
quad(99,183, 123,183, 155,246, 133,246);
quad(172,88, 208,88, 213,161, 196,166);
quad(273,182, 301,182, 303,243, 283,243);
quad(388,103, 414,103, 405,164, 384,164);
quad(489,185, 515,185, 481,249, 461,249);
quad(597,104, 621,105, 589,168, 569,168);
quad(600,256, 640,220, 640,243, 600,219);

triangle(210,470, 221,470, 217,486);
triangle(358,420, 369,420, 366,443);
triangle(319,464, 330,464, 327,487);
triangle(375,467, 386,467, 386,490);
triangle(466,416, 478,416, 478,441);
triangle(485,461, 497,461, 497,490);


//pink color ellipses
fill(212, 137, 178);
noStroke();

ellipse(585,-1.5, 13,13);
ellipse(27,24, 20,11);
ellipse(67,172, 23,13);
ellipse(445,162, 20,11);
ellipse(537,144, 5,11);
ellipse(285,223, 6,6);


//green color ellipses
fill(79, 137, 78);
noStroke();

ellipse(27,100, 23,14);
ellipse(125,50, 21,13);
ellipse(328,117, 13,13);
ellipse(423,93, 7,7);
ellipse(580,191, 21,11);


//dark dark green color ellipses
fill(101, 97, 70);
noStroke();

ellipse(471,103, 12,12);


//dark orange color ellipses
fill(219, 81, 53);
noStroke();

ellipse(167,380, 14,14);
ellipse(172,448, 8,8);
ellipse(295,377, 8,8);
ellipse(325,163, 8,8);
ellipse(365,312, 9,9);
ellipse(377,309, 11,11);
ellipse(427,17, 11,11);
ellipse(427,171, 9,9);
ellipse(419,307, 9,9);
ellipse(471,138, 12,12);
ellipse(466,270, 9,9);
ellipse(487,160, 9,9);
ellipse(514,340, 9,9);
ellipse(495,436, 7,7);
ellipse(514,340, 9,9);
ellipse(546,220, 7,7);





//light light blue color ellipses
fill(106, 155, 198);
noStroke();

ellipse(472,153, 9,9);
ellipse(544,279, 9,9);


//light light blue lines
stroke(106, 155, 198);
strokeWeight(10);

line(140,106, 165,146);

strokeCap(SQUARE);
line(279,36, 643,36);


noFill();
strokeWeight(3);
arc(505,118, 53,105, PI/2, PI);

noFill();
strokeWeight(3);
arc(570,186, 75,75, TWO_PI-PI/2, TWO_PI);

beginShape();
vertex(398,216);
bezierVertex(382,240, 382,254, 394,285);
endShape();

strokeWeight(2);
beginShape();
vertex(464,453);
bezierVertex(466,485, 453,500, 447,504);
endShape();




//black curve strokes
strokeWeight(4);
stroke(0);
noFill();

//black curve vertical strokes



//black curve rectangle
strokeWeight(2);

beginShape();
vertex(0,177);
bezierVertex(0,177, 93,203, 159,207);
bezierVertex(159,207, 161,219, 157,221);
bezierVertex(157,221,40,207, 0,195);
bezierVertex(0,195, -3,191, 0,177);
endShape();

beginShape();
vertex(87,388);
bezierVertex(50,417, 66,473, 81,480);
endShape();


beginShape();
vertex(419,53);
bezierVertex(419,53, 421,62, 429,69);
bezierVertex(429,69, 437,77, 469,88);
bezierVertex(469,88, 523,110, 508,103);
bezierVertex(508,103, 528,129, 528,125);
endShape();


beginShape();
vertex(300,253);
bezierVertex(300,253, 296,259, 300,266);
bezierVertex(300,266, 313,288, 306,321);
bezierVertex(306,321, 303,340, 315,358);
bezierVertex(315,358,  315,374, 333,387);
endShape();


beginShape();
vertex(348,322);
bezierVertex(348,322, 335,339, 333,362);
bezierVertex(333,362, 330,393, 338,409);
bezierVertex(338,409, 339,424, 357,438);
bezierVertex(357,438, 355,464, 367,480);
endShape();



strokeWeight(1);

beginShape();
vertex(548,308);
bezierVertex(548,308, 556,329, 548,340);
bezierVertex(548,340, 535,369, 544,385);
bezierVertex(544,385, 549,404, 590,446);
bezierVertex(590,446, 596,470, 592,480);
endShape();

beginShape();
vertex(547,352);
bezierVertex(547,352, 535,389, 565,413);
bezierVertex(565,413, 568,434, 588,449);
bezierVertex(590,449, 592,462, 590,480);
endShape();

beginShape();
vertex(123,164);
bezierVertex(56,197, 0,291, 0,307);
endShape();



//black long curve line
strokeWeight(4);
beginShape();
vertex(515,0);
bezierVertex(470,39 , -144,240 , 300,480);
endShape();


//black curve horizontal strokes
strokeWeight(2);
beginShape();
vertex(0,0);
bezierVertex(20,5, 455,10, 640,5);
endShape();

beginShape();
vertex(0, 284);
bezierVertex(18,294, 321,318, 640,285);
endShape();


beginShape();
vertex(0, 309);
bezierVertex(25,312, 405,322, 640,305);
endShape();






//blue color ellipses
fill(43, 81, 162);
noStroke();

ellipse(94,246, 14,14);
ellipse(96,220, 14,14);
ellipse(120,176, 15,15);
ellipse(172,145, 17,17);
//dbl
ellipse(180,255, 17,17);
ellipse(180,264, 17,17);
//
ellipse(274,134, 14,14);
ellipse(362,58, 9,9);
ellipse(400,36, 15,15);
ellipse(382,178, 12,12);
ellipse(326,324, 11,11);
ellipse(283,478, 8,8);
ellipse(336,470, 15,15);
ellipse(336,470, 15,15);
ellipse(446,414, 9,9);
ellipse(448,422, 13,13);
ellipse(450,338, 8,8);
ellipse(454,277, 8,8);
ellipse(422,216, 12,12);
ellipse(429,147, 10,10);
ellipse(435,145, 11,11);
ellipse(452,102, 13,13);
//dbl
ellipse(455,16, 8,8);
ellipse(461,13, 10,10);
//
ellipse(515,34, 8,8);
//dbl
ellipse(517,80, 8,8);
ellipse(520,77, 8,8);
//
ellipse(497,171, 8,8);
//dbl
ellipse(510,248, 9,9);
ellipse(515,252, 9,9);
//
//dbl
ellipse(568,324, 10,10);
ellipse(574,324, 9,9);
//
ellipse(545,375, 8,8);
ellipse(561,464, 9,9);

//blue color lines
stroke(43, 81, 162);
strokeCap(ROUND);

strokeWeight(8);
line(84,356, 101,356);


strokeWeight(14);
line(403,264, 395,295);

strokeWeight(14);
line(592,119, 597,142);


//blue curve shapes
beginShape();
noStroke();
vertex(606,400);
bezierVertex(606,400, 629,419, 640,424);
bezierVertex(640,424, 641,429, 640,430);
bezierVertex(640,430, 622,422, 606,400);
endShape();

beginShape();
vertex(262,460);
bezierVertex(262,460, 276,466, 287,473);
bezierVertex(287,473, 260,482, 262,460);
endShape();

beginShape();
vertex(580,233);
bezierVertex(580,233, 600,250, 595,273);
bezierVertex(595,273, 590,256, 580,233);
endShape();





//red curve & strieght lines
noFill();
stroke(181, 47, 46);
strokeWeight(2);

line(178,0, 169,22);

line(50,92, 99,57);
line(95,108, 107,62);

beginShape();
vertex(264,7);
bezierVertex(264,7, 190,25, 179,45);
bezierVertex(179,45, 167,61, 175,83);
endShape();

beginShape();
vertex(533,16);
bezierVertex(515,21, 505,40, 507,50);
endShape();

smooth();
strokeWeight(14);
line(0,367, 30,372);
line(410,420, 435,412);

strokeWeight(4);

beginShape();
vertex(188,177);
bezierVertex(191,321, 204,457, 226,480);
endShape();

beginShape();
vertex(273,447);
bezierVertex(270,464, 261,471, 257,480);
endShape();

beginShape();
vertex(467,321);
bezierVertex(467,370, 446,395, 425,405);
endShape();

beginShape();
vertex(643,380);
bezierVertex(610,437, 601,444, 575,468);
endShape();

//light orange color ellipses
fill(232, 130, 46);
noStroke();

ellipse(68,343, 4,4);
ellipse(240,70, 14,14);

//light brown color ellipses
fill(206, 141, 87);
noStroke();

ellipse(56,230, 7,13);
ellipse(141,98, 16,25);
ellipse(347,129, 14,14);
ellipse(387,222, 13,13);
ellipse(485,282, 13,13);

ellipse(558,154, 17,9);


//red color ellipses
fill(175,50, 48);
stroke(175,50, 48, 0);

ellipse(432,480, 13,13);


//black stroke shapes
strokeWeight(2);
stroke(0);
noFill();

//rectangles on the top
quad(-15,20, 44,20, 56,72, 6,75);
quad(63,24, 132,26, 132,71, 69,74);
quad(146,35, 216,33, 210,75, 145,74);
quad(227,36, 293,33, 247,79, 220,80);

//triangle on circle 3 & 4
line(298,144, 302,215);
line(236,189, 302,215);
line(227,175, 298,144);

//lines on ellipses 6
line(491,125, 492,170);
line(495,202, 495,215);

//triangle on ellips 6
line(454,148, 457,217);
line(454,148, 494,172);
line(457,217, 499,200);

//ellipses on the middile
ellipse(3,188, 48,30);
ellipse(108,188, 48,30);
ellipse(213,187, 48,30);
ellipse(309,186, 48,30);
ellipse(391,190, 48,30);
ellipse(494,186, 48,30);
ellipse(598,187, 39,30);

quad(327,222, 432,220, 432,234, 327,237);

line(0,15, 24,42);
line(0,11, 92,164);
line(0,50, 94,184);
line(0,25, 16,25);
line(52,25, 63,25);
line(60,20, 60,61);
line(127,20, 127,62);
line(144,24, 206,24);
line(192,24, 192,63);
line(244,24, 643,18);
line(320,24, 323,24);
line(298,41, 337,66);
line(338,0, 336,76);
line(367,0, 366,58);
line(378,0, 372,180);
line(385,24, 385,62);
line(396,64, 396,102);
line(460,24, 461,117);
line(522,25, 522,62);
line(396,64, 396,102);
line(568,6, 567,57);
line(568,56, 612,51);
line(587,23, 587,62);
line(595,45, 595,109);
line(476,20, 493,0);
line(445,18, 566,3);
line(635,18, 640,13);
line(0,86, 640,86);
line(8,96, 8,111);
line(34,95, 34,111);
line(88,80, 88,111);
line(81,97, 80,111);
line(134,96, 134,111);
line(329,76, 330,103);
line(0,111, 180,111);
line(0,123, 642,123);
line(92,123, 94,182);
line(92,123, 97,174);
line(200,123, 203,173);
line(302,123, 303,173);
line(311,202, 311,214);
line(392,206, 393,215);
line(494,202, 494,215);
line(26,167, 98,188);
line(98,189, 85,189);
line(98,187, 189,187);
line(98,189, 120,192);
line(119,192, 235,189);

line(333,187, 369,187);
line(415,187, 469,187);
line(518,187, 640,190);

line(511,196, 640,196);

line(600,203, 600,218);

line(0,247, 642,247);

line(497,399, 498,480);

//light blue color ellipses
fill(64, 115, 178);
noStroke();

ellipse(19,83, 12,12);
ellipse(80,267, 9,9);
ellipse(37,318, 8,8);
ellipse(261,444, 9,9);
ellipse(338,396, 11,9);
ellipse(301,121, 16,9);
ellipse(291,162, 13,8);
ellipse(378,36, 8,8);
//tripl
ellipse(403,12, 10,10);
ellipse(405,8, 10,10);
ellipse(407,4, 10,10);
//
ellipse(437,230, 8,8);
ellipse(456,199, 8,8);
ellipse(488,263, 8,8);
ellipse(505,173, 8,8);
ellipse(552,76, 12,12);
ellipse(569,343, 8,8);
ellipse(571,0, 12,12);


//green curve line
stroke(79, 137, 78);
strokeWeight(4);
noFill();

beginShape();
vertex(147,327);
bezierVertex(147,327, 165,334, 199,340);
bezierVertex(199,340, 270,387, 255,414);
endShape();


//dark blue long curve line
stroke(39, 59, 92);
strokeWeight(8);
noFill();

beginShape();
vertex(0,115);
bezierVertex(135,197, 401,277, 499,291);
endShape();


//dark blue curve lines
strokeWeight(2);

beginShape();
vertex(135,286);
bezierVertex(77,317, 114,370, 125,374);
endShape();

beginShape();
vertex(539,329);
bezierVertex(640,301, 588,423, 571,429);
endShape();

beginShape();
vertex(190,325);
bezierVertex(180,337, 183,352, 192,359);
endShape();

beginShape();
vertex(247,346);
bezierVertex(234,347, 215,364, 221,379);
endShape();

beginShape();
vertex(287,376);
bezierVertex(271,377, 264,383, 265,399);
endShape();




