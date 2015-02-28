
size(400, 374);
background(#F3EBD6);
//smooth();

// draw solid shape
noStroke();
fill(0);

//ellipse 01
beginShape();
bezier(73, 25, 67, 20, 80, 0, 92, 12);
bezier(73, 25, 90, 34, 97, 14, 92, 12);
endShape();

//circ 01
ellipse(58, 126, 20, 20);

//circ 02
ellipse(57, 171, 30, 22);

//circ 03
ellipse(78, 316, 18*2, 30);

//circ 04
ellipse(165, 2, 12*2, 10*2);

//circ 05
ellipse(165, 54, 30, 21);

//circ 06
ellipse(209, 147, 14*2, 13*2);

//circ 07
ellipse(204, 77, 26, 22);

//circ 08
ellipse(207, 197, 26, 22);

//circ 09
ellipse(249, -2, 18, 18);

//circ 10
ellipse(251, 79, 20, 18);

//circ 11
ellipse(259, 190, 24, 24);

//circ 12
ellipse(268, 259, 18, 14);

//circ 13
ellipse(270, 339, 16, 16);

//circ 14
ellipse(297, 0, 16, 18);

//circ 15
ellipse(323, 176, 36, 2*(193-176));

//circ 16
ellipse(317, 257, 18, 14);

//circ 17
ellipse(310, 375, 20, 22);

//circ 18
bezier(400, 33, 393, 35, 389, 47, 400, 54);

//circ 19
bezier(400, 70, 391, 81, 376, 127, 400, 165);

//circ 20
ellipse(393, 95, 2*(393-367), 2*(95-77));

//circ 21
beginShape();
fill(#E04305);
vertex(400, 77);
vertex(396, 79);
vertex(388, 111);
vertex(400, 111);
endShape(CLOSE);

beginShape();
bezier(396, 79, 393, 79, 387, 94, 388, 111);
endShape();

fill(0);
//circ 22
beginShape();
curveVertex(400, 168);
curveVertex(400, 168);
curveVertex(382, 178);
curveVertex(374, 198);
curveVertex(382, 215);
curveVertex(400, 224);
curveVertex(405, 224);
curveVertex(405, 224);
endShape();

//circ 23
beginShape();
curveVertex(400, 247);
curveVertex(400, 247);
curveVertex(391, 252);
curveVertex(390, 257);
curveVertex(393, 265);
curveVertex(397, 267);
curveVertex(400, 267);
curveVertex(400, 267);
endShape();

//cirve 24
ellipse(396, 298, 24, 18);

triangle(77, 230, 139, 148, 207, 241);

//ellipse 02 red
stroke(1);
fill(#E04305);
beginShape();
bezier(38, 51, 34, 42, 52, 26, 60, 42);
endShape();

//ellipse 03 red/half black
fill(0);
beginShape();
bezier(38, 51, 39, 63, 64, 62, 60, 42);
endShape();

//ellipse 04 red at bottom
fill(#E04305);
beginShape();
bezier(17, 345, 6, 352, 17, 381, 36, 356);
endShape();

//ellipse 05 red bott half black
fill(0);
beginShape();
bezier(17, 345, 19, 337, 48, 338, 36, 356);
endShape();

//crescent
beginShape();
vertex(193, 299);
bezierVertex(180, 312, 172, 344, 180, 374);
bezierVertex(180, 374, 235, 374, 235, 374);
bezierVertex(224, 364, 192, 305, 193, 299);
endShape(CLOSE);

//blob blob
beginShape();
vertex(228, 300);
bezierVertex(225, 300, 220, 299, 220, 288);
bezierVertex(220, 278, 227, 279, 217, 273);
bezierVertex(208, 266, 206, 250, 219, 247);
bezierVertex(232, 244, 237, 254, 234, 264);
bezierVertex(232, 273, 225, 275, 228, 278);
bezierVertex(231, 282, 237, 284, 237, 290);
bezierVertex(237, 296, 235, 300, 228, 300);
endShape(CLOSE);

// draw line from top to bottom, left to right
stroke(1);
strokeWeight(2);
noFill();
// curve 1
beginShape();
curveVertex(14, 100);
curveVertex(14, 100);
curveVertex(19, 70);
curveVertex(35, 52);
curveVertex(65, 41);
curveVertex(101, 41);
curveVertex(130, 64);
curveVertex(139, 153);
curveVertex(135, 156);
curveVertex(135, 156);
endShape();

//curve 2
beginShape();
curveVertex(50, 37);
curveVertex(50, 37);
curveVertex(50, 17);
curveVertex(62, 7);
curveVertex(72, 8);
curveVertex(77, 16);
curveVertex(78, 20);
curveVertex(78, 20);
endShape();

//curve 3
line(102, 104, 181, 105); 

//curve 4
line(58, 131, 58, 164);

//curve 5
line(42, 143, 71, 146);

//curve 6
beginShape();
curveVertex(43, 225);
curveVertex(43, 225);
curveVertex(41, 239);
curveVertex(35, 256);
curveVertex(15, 287);
curveVertex(5, 312);
curveVertex(10, 337);
curveVertex(38, 356);
curveVertex(76, 364);
curveVertex(100, 363);
curveVertex(125, 351);
curveVertex(130, 331);
curveVertex(130, 326);
curveVertex(127, 295);
curveVertex(128, 280);
curveVertex(138, 263);
curveVertex(147, 253);
curveVertex(147, 253);
endShape();

//curve 7
beginShape();
curveVertex(77, 327);
curveVertex(77, 327);
curveVertex(81, 345);
curveVertex(76, 365);
curveVertex(70, 375);
curveVertex(70, 375);
endShape();

//curve 8
line(166, 50, 165, 0);

//curve 9
line(207, 75, 233, 37);
line(233, 37, 252, 76);

//curve 10
line(210, 155, 209, 190);

//curve 11
line(219, 361, 265, 339);

//curve 12 *
line(292, 54, 343, 56);
line(292, 25, 338, 84);
line(317, 26, 317, 89);
line(343, 28, 288, 89);

//curve 13
beginShape();
bezier(265, 191, 248, 136, 325, 85, 325, 164);
endShape();

//curve 14
beginShape();
bezier(271, 257, 277, 198, 325, 217, 319, 254);
endShape();

//curve 15
line(310, 289, 367, 356);
line(315, 321, 370, 326);
line(324, 346, 372, 295);
line(343, 282, 340, 351);

//curve 16
line(399, 262, 399, 295);

