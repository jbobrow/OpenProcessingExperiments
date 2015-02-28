
size(500, 500);
background(222, 215, 187);
smooth();

//////////////////////////////////////BACKGROUND
//bottom background 2
noStroke();
fill(208, 207, 186);
beginShape();
vertex(-1, 388);
vertex(500, 386);
vertex(500, 314);
vertex(-1, 308);
endShape(CLOSE);

//bottom background 3
noStroke();
fill(202, 203, 185);
beginShape();
vertex(-1, 308);
vertex(500, 316);
vertex(500, 199);
vertex(255, 194);
vertex(163, 186);
vertex(-1, 170);
endShape(CLOSE);

//bottom background 4
noStroke();
fill(228, 214, 179);
beginShape();
vertex(-1, 170);
vertex(163, 186);
vertex(255, 194);
vertex(500, 199);
vertex(500, 75);
vertex(-1, 83);
endShape(CLOSE);

noStroke();
fill(212, 215, 196);
beginShape();
vertex(-1, 85);
vertex(81, 94);
vertex(100, 91);
vertex(119, 86);
vertex(163, 84);
vertex(195, 81);
vertex(146, 79);
vertex(97, 69);
vertex(33, 64);
vertex(-3, 61);
endShape(CLOSE);


//////////////////////////////////////END BACK GROUND


//////////////////////////////////////light blue line
stroke(177, 169, 146);
strokeWeight(1);
strokeCap(SQUARE);

//box
line(67, 0, 393, 201);
line(393, 201, 454, 165);
line(464, 171, 178, 0);

//box line
line(86, 11, 115, 0);
line(106, 24, 167, 0);
line(123, 34, 204, 0);
line(143, 47, 255, 0);
line(164, 61, 289, 7);
line(186, 72, 312, 18);
line(206, 85, 332, 31);
line(224, 99, 354, 43);
line(257, 117, 310, 86);
line(317, 116, 398, 70);
line(355, 116, 419, 80);
line(340, 169, 469, 108);
line(363, 183, 424, 148);
line(261, 6, 419, 80);
line(419, 80, 281, 1);
line(43, 0, 117, 25);
//others
line(300, 70, 300, 91);
line(311, 69, 311, 94);
line(339, 65, 339, 101);
line(311, 88, 358, 92);
line(389, 97, 445, 96);
line(250, 82, 417, 79);
line(246, 19, 249, 113);
line(151, 13, 390, 27);
line(213, 31, 377, 39);
line(125, 32, 382, 42);
line(149, 16, 149, 45);
line(185, 15, 185, 45);
line(222, 0, 223, 45);
line(246, 19, 250, 113);
line(265, 20, 266, 60);
line(148, 44, 371, 46);

//topright
line(463, 0, 419, 20);
line(500, 7, 500, 32);
line(500, 32, 386, 0);

//topright base
line(257, 4, 497, 0);
line(407, 12, 500, 11);



//////////////////////////////////////END light blue line

//////////////////////////////////////red line
stroke(178, 37, 43);
strokeWeight(4);
strokeCap(SQUARE);
line(406, -5, 505, 22);
//////////////////////////////////////END red line



//////////////////////////////////////blue circles
noStroke();
fill(39, 79, 149);
ellipse(262, 19, 16, 16);

ellipse(285, 83, 16, 16);

ellipse(350, 122, 16, 16);

ellipse(477, 171, 16, 16);

ellipse(482, 33, 8, 8);
//////////////////////////////////////end blue circles


//////////////////////////////////////THICK BROWN LINES
//line middle left
noStroke();
fill(145, 144, 126);
beginShape();
vertex(73, 500);
vertex(441, 97);
vertex(52, 500);
endShape(CLOSE);

//line middle right
beginShape();
vertex(314, 500);
vertex(336, 500);
vertex(471, 98);
endShape(CLOSE);

//line left top 1
fill(180, 165, 136);
beginShape();
vertex(-1, 159);
vertex(-1, 164);
vertex(315, 100);
endShape(CLOSE);

//line left top 2
fill(165, 153, 131);
beginShape();
vertex(-1, 195);
vertex(-1, 200);
vertex(338, 105);
endShape(CLOSE);

//line left top 3
fill(150, 147, 132);
beginShape();
vertex(-1, 252);
vertex(-1, 259);
vertex(348, 113);
endShape(CLOSE);

//line left top 4
fill(161, 162, 146);
beginShape();
vertex(-1, 348);
vertex(-1, 362);
vertex(388, 112);
endShape(CLOSE);


//////////////////////////////////////END THICK BROWN LINES


////////////////////////////////////// THIN BLACK LINES
stroke(33, 38, 31);
strokeWeight(2);
strokeCap(SQUARE);
line(433, 472, 500, 455);

strokeWeight(2);
noFill();
beginShape();
vertex(-10, 359);
vertex(445, 487);
vertex(268, 491);
vertex(-10, 392);
endShape(CLOSE);

strokeWeight(4);
strokeCap(SQUARE);
line(156, 359, 500, 349);

strokeWeight(2);
strokeCap(SQUARE);
line(-1, 362, 115, 310);

strokeWeight(1);
strokeCap(SQUARE);
line(186, 274, 302, 187);

line(186, 274, 302, 187);

line(302, 187, 183, 145);

strokeWeight(2);
strokeCap(SQUARE);
line(330, 148, 500, 144);

line(373, 150, 500, 84);

//bridge, top and bottom
strokeWeight(2);
strokeCap(SQUARE);
line(-1, 72, 214, 82);

line(-1, 86, 149, 100);
//END bridge, top and bottom

//bridge support line, left to right
strokeWeight(2);
strokeCap(SQUARE);
line(15, 87, 25, 74);

line(33, 90, 29, 74);

line(68, 92, 78, 76);

line(91, 94, 86, 77);

line(149, 100, 166, 80);
//END bridge support line, left to right

//left box
strokeWeight(2);
strokeCap(SQUARE);
line(-1, 170, 63, 169);

line(63, 169, 64, 179);

line(64, 179, 0, 182);
//END left box

//squiggly line
strokeWeight(2);
strokeCap(SQUARE);
line(65, 182, 119, 135);

line(119, 135, 125, 114);

line(125, 114, 136, 91);

line(136, 91, 152, 76);

line(152, 76, 176, 53);
//END squiggly line

//squiggly line surround
strokeWeight(1);
strokeCap(SQUARE);
line(-1, 142, 67, 157);

strokeWeight(2);
strokeCap(SQUARE);
line(67, 157, 0, 128);

line(-1, 120, 146, 79);

strokeWeight(3);
strokeCap(SQUARE);
line(-2, 50, 6, 50);
//END squiggly line surround

//bottom bridge
stroke(177, 169, 146);
strokeWeight(1);
strokeCap(SQUARE);
//dot
line(8, 255, 10, 238);

line(8, 255, 10, 238);

line(10, 233, 11, 228);

line(11, 223, 11, 218);

line(12, 211, 12, 192);

//line
line(99, 202, 97, 293);
line(203, 212, 203, 278);
line(320, 220, 319, 315);
line(431, 226, 428, 320);

//curve
strokeWeight(1);
stroke(177, 169, 146);
noFill();
beginShape();
curveVertex(-3, 191);
curveVertex(-3, 191);
curveVertex(13, 193);
curveVertex(99, 201);
curveVertex(203, 212);
curveVertex(320, 220);
curveVertex(432, 226);
curveVertex(477, 224);
curveVertex(477, 224);
endShape();

strokeWeight(1);
stroke(177, 169, 146);
noFill();
beginShape();
curveVertex(11, 280);
curveVertex(11, 280);
curveVertex(36, 284);
curveVertex(84, 292);
curveVertex(113, 295);
curveVertex(201, 304);
curveVertex(320, 315);
curveVertex(428, 320);
curveVertex(446, 320);
curveVertex(446, 320);
endShape();

strokeWeight(1);
stroke(177, 169, 146);
noFill();
beginShape();
curveVertex(-3, 320);
curveVertex(-3, 320);
curveVertex(71, 329);
curveVertex(243, 346);
curveVertex(313, 354);
curveVertex(404, 359);
curveVertex(461, 361);
curveVertex(503, 361);
curveVertex(503, 361);
endShape();

strokeWeight(1);
stroke(177, 169, 146);
noFill();
beginShape();
curveVertex(-3, 362);
curveVertex(-3, 362);
curveVertex(37, 370);
curveVertex(105, 378);
curveVertex(164, 384);
curveVertex(206, 387);
curveVertex(206, 387);
endShape();
//////////////////////////////////////END black lines


//////////////////////////////////////RED LINE
strokeWeight(3);
stroke(155, 49, 53);
noFill();
beginShape();
curveVertex(-3, 69);
curveVertex(-3, 69);
curveVertex(28, 92);
curveVertex(60, 107);
curveVertex(91, 117);
curveVertex(118, 124);
curveVertex(140, 125);
curveVertex(158, 122);
curveVertex(158, 122);
endShape();

beginShape();
curveVertex(181, -3);
curveVertex(181, -3);
curveVertex(187, 12);
curveVertex(192, 22);
curveVertex(192, 22);
endShape();

//////////////////////////////////////END RED LINE


//////////////////////////////////////BLUE LINE

noStroke();
fill(16, 87, 149);
beginShape();
vertex(22, 258);
vertex(15, 267);
vertex(254, 264);
endShape(CLOSE);

//////////////////////////////////////END BLUE LINE


//////////////////////////////////////BANNERS

noStroke();
fill(248, 186, 53);
beginShape();
vertex(217, 279);
vertex(108, 268);
vertex(119, 321);
vertex(193, 332);
endShape(CLOSE);

fill(23, 29, 27);
beginShape();
vertex(79, 311);
vertex(96, 266);
vertex(29, 259);
vertex(37, 302);
endShape(CLOSE);

fill(248, 186, 53);
beginShape();
vertex(8, 296);
vertex(22, 258);
vertex(0, 253);
vertex(0, 294);
endShape(CLOSE);



//////////////////////////////////////END BANNERS

//////////////////////////////////////yellow circles
noStroke();
fill(250, 186, 54);
ellipse(500, 167, 52, 9);

ellipse(500, 213, 100, 26);

ellipse(500, 300, 172, 61);
//////////////////////////////////////END yellow circles


//////////////////////////////////////orange curve line

strokeWeight(3);
stroke(214, 113, 61);
noFill();
beginShape();
curveVertex(0, 203);
curveVertex(0, 203);
curveVertex(92, 216);
curveVertex(204, 227);
curveVertex(320, 234);
curveVertex(453, 240);
curveVertex(453, 240);
endShape();

//////////////////////////////////////END orange curve line


//////////////////////////////////////blue curve line

strokeWeight(5);
stroke(46, 68, 107);
noFill();
beginShape();
curveVertex(217, -3);
curveVertex(217, -3);
curveVertex(211, 20);
curveVertex(218, 46);
curveVertex(245, 78);
curveVertex(282, 100);
curveVertex(320, 118);
curveVertex(362, 134);
curveVertex(406, 148);
curveVertex(448, 161);
curveVertex(503, 174);
curveVertex(503, 174);
endShape();

strokeWeight(4);
stroke(73, 99, 122);
noFill();
beginShape();
curveVertex(403, 177);
curveVertex(403, 177);
curveVertex(382, 195);
curveVertex(356, 232);
curveVertex(347, 271);
curveVertex(363, 324);
curveVertex(418, 369);
curveVertex(455, 387);
curveVertex(503, 402);
curveVertex(503, 402);
endShape();

//////////////////////////////////////end blue curve line


