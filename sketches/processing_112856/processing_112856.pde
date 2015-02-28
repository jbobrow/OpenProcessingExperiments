
//practice with MIRO, Cat encircled by the flight of a bird 
//by Xinhan Yen, TW, archi730@hotmail.com 

void setup() {
size(295, 295);
background(202, 198, 196);
smooth();
strokeWeight(2);
}

void draw() {
stroke(1);
//mi I
line(25, 23, 25+12, 23+46);line(17, 55, 17+29, 55-13);
line(17, 40, 17+32, 40+15);line(37, 27, 37-11, 27+42);
//mi II
line(234, 122, 234+27, 122);line(250, 107, 250-3, 107+31);
line(236, 111, 236+23, 111+21);line(257, 110, 257-21, 110+23);
//mi III
line(255, 169, 255+4, 169+63);line(234, 201, 234+48, 201-1);
line(242, 191, 242+29, 191+24);line(270, 185, 270-29, 185+30);
//blackpoint
fill(1);
ellipse(45, 5, 5, 5);ellipse(81, 25, 5, 5);ellipse(71, 53, 5, 5);
ellipse(110, 75, 5, 5);ellipse(133, 79, 5, 5);ellipse(110, 190, 5, 5);
ellipse(119, 279, 8, 8);ellipse(265, 271, 5, 5);
ellipse(271, 166, 5, 5);ellipse(227, 72, 7, 7);ellipse(267, 11, 5, 5);
ellipse(162, 275, 18, 18);ellipse(289, 254, 26, 26);ellipse(128, 260, 5, 5);
line(110, 75, 133, 79);line(119, 279, 128, 260);
line(80, 0, 45, 5);line(80, 0, 81, 25);
line(271, 166, 295, 166);line(234, 122, 234+27, 122);
//dutriangle
fill(1);
beginShape();vertex(11, 89);vertex(11+16, 89);vertex(21, 105);endShape();
beginShape();vertex(21, 105);vertex(12, 123);vertex(12+19,123-3);endShape();
beginShape();vertex(37, 191);vertex(37-7, 191-10);vertex(37+6, 191-17);endShape();
beginShape();vertex(37, 192);vertex(37, 192);vertex(37-8, 192+17);vertex(37+9, 192+12);endShape();
beginShape();vertex(35,256);vertex(35-4, 256-11);vertex(35+7, 256-12);endShape();
beginShape();vertex(35,256);vertex(35-8, 256+16);vertex(35+9, 256+12);endShape();
beginShape();vertex(229, 148);vertex(229, 148-12);vertex(229-12, 148-7);endShape();
beginShape();vertex(229, 148);vertex(229+2, 148+25);vertex(229+19, 148+14);endShape();
//circle
ellipse(162, 277, 26, 24);
//longcurve II
noFill();strokeWeight(1);beginShape();
curveVertex(295, 0);
curveVertex(295, 0);curveVertex(285, 37);
curveVertex(280, 65);curveVertex(279, 72);
curveVertex(279, 110);curveVertex(281, 127);
curveVertex(282, 147);curveVertex(284,156);
curveVertex(287, 166);curveVertex(295, 180);
curveVertex(295, 180);
endShape();
//longcurve II component
fill(134, 40, 32);strokeWeight(1);beginShape();
vertex(295, 0);vertex(295, 36);
vertex(285, 37);vertex(295, 0);
endShape(CLOSE);
fill(35, 25, 123);strokeWeight(1);beginShape();
vertex(295, 68);vertex(264, 60);vertex(295, 84);
endShape(CLOSE);
fill(224, 213, 52);strokeWeight(1);beginShape();
vertex(264+16, 60+4);vertex(264, 60);vertex(279, 72);
endShape(CLOSE);
fill(196, 208, 124);strokeWeight(1);
arc(280, 118, 14, 16, -HALF_PI, HALF_PI);
fill(38, 34, 35);strokeWeight(1);
arc(280, 118, 14, 16, HALF_PI, 3*HALF_PI);
fill(38, 46, 143);strokeWeight(0);
arc(283, 147, 14, 14, -HALF_PI, HALF_PI);
fill(226, 221, 104);strokeWeight(1);
arc(283, 147, 14, 14, HALF_PI, 3*HALF_PI);
//spiral line
beginShape();strokeWeight(1);noFill();
curveVertex(231, 8);
curveVertex(231, 8);curveVertex(202, 41);
curveVertex(191, 70);curveVertex(191, 70);
endShape();
//beziercurve
beginShape();strokeWeight(1);noFill();
vertex(191, 70);
bezierVertex(186, 115, 221, 103, 225, 106);
vertex(225, 106);
bezierVertex(273, 105, 268, 58, 226, 51);
vertex(226, 51);
bezierVertex(202, 55, 193, 83, 220, 88);
vertex(220, 88);
bezierVertex(252, 84, 238, 75, 227, 72);
endShape();
beginShape();strokeWeight(1);noFill();
curveVertex(231, 8);
curveVertex(231, 8);curveVertex(258, 31);
curveVertex(285, 37);curveVertex(285, 37);
endShape();
//spiral component
fill(131, 157, 143);strokeWeight(1);
arc(231, 8, 24, 24, -QUARTER_PI, QUARTER_PI);
fill(25, 25, 27);strokeWeight(0);
arc(231, 8, 24, 24, QUARTER_PI, 3*QUARTER_PI);
fill(224, 228, 141);strokeWeight(1);
arc(231, 8, 24, 24, 3*QUARTER_PI, 5*QUARTER_PI);
fill(25, 25, 27);strokeWeight(1);
arc(231, 8, 24, 24, 5*QUARTER_PI, 7*QUARTER_PI);
//longcurve componentDN
beginShape();fill(163, 189, 60);strokeWeight(1);
vertex(64, 226);
bezierVertex(93, 193, 121, 249, 76, 257);
endShape();
beginShape();fill(40, 31, 124);strokeWeight(1);
vertex(64, 226);
bezierVertex(51, 247, 70, 258, 76, 257);
endShape();
//longcurve component MID
beginShape();fill(32, 33, 37);strokeWeight(1);
vertex(91, 106);
bezierVertex(91, 138, 84, 148, 75, 168);
vertex(75, 168);
bezierVertex(44, 150, 51, 104, 91, 106);
endShape();
beginShape();fill(40, 31, 150);strokeWeight(1);
vertex(91, 105);
bezierVertex(91, 138, 84, 148, 75, 168);
vertex(75, 168);
bezierVertex(137, 177, 136, 119, 91, 105);
endShape();
beginShape();fill(163, 189, 60);strokeWeight(1);
vertex(117, 121);
bezierVertex(132, 87, 204, 92, 185, 159);
vertex(185, 159);
bezierVertex(153, 221, 88, 172, 117, 121);
endShape();
fill(40, 31, 150);strokeWeight(0);
ellipse(184, 205, 94, 88);
beginShape();fill(32, 33, 37);strokeWeight(1);
vertex(185, 159);
bezierVertex(171, 184, 166, 188, 142, 186);
bezierVertex(146, 172, 162, 158, 185, 159);
endShape();
beginShape();fill(32, 33, 37);strokeWeight(1);
vertex(117, 122);
bezierVertex(126, 131, 127, 149, 112, 162);
bezierVertex(112, 154, 104, 142, 117, 122);
endShape();
beginShape();fill(32, 33, 37);strokeWeight(1);
vertex(184, 116);
bezierVertex(172, 125, 174, 140, 189, 146);
bezierVertex(188, 135, 187, 120, 184, 116);
endShape();
strokeWeight(1);noFill();
bezier(184, 116, 187, 112, 190, 110, 196, 110);
bezier(189, 146, 202, 148, 202, 146, 210, 142);
fill(32, 33, 37);
arc(198, 246, 14, 14, -0.14, 2.83);
fill(215, 205, 111);
arc(198, 246, 14, 14, 2.83, 6);
beginShape();fill(186, 37, 30);strokeWeight(1);
vertex(180, 295);
bezierVertex(193, 278, 257, 279, 270, 295);
vertex(270, 295);vertex(180, 295);
endShape(CLOSE);
line(207, 282, 198, 246);
fill(32, 33, 37);
arc(207, 282, 14, 14, -0.14, 2.83);
fill(75, 95, 201);
arc(207, 282 ,14, 14, 2.83, 6);
//longcurve component TOP (71, 53)
noFill();
bezier(71, 53, 80, 63, 95, 65, 95, 64);
beginShape();fill(40, 31, 150);strokeWeight(1);stroke(1);
vertex(95, 64);
bezierVertex(127, 49, 80, 63, 157, 5);
curveVertex(157, 5);
bezierVertex(131, 16, 112, 14, 80, 0);
endShape();
beginShape();fill(1);
vertex(80, 0);
bezierVertex(97, 26, 96, 32, 95, 64);
endShape(CLOSE);
beginShape();noFill();strokeWeight(1);
curveVertex(80, 0);curveVertex(95, 31);
curveVertex(95, 64);
endShape(CLOSE);
//
beginShape();fill(40, 31, 150);strokeWeight(1);
vertex(95, 64);
bezierVertex(120, 66, 152, 27, 155, 3);
vertex(155, 3);
bezierVertex(131, 15, 110, 10, 80, 0);
endShape();
//dutriangle (152,20)
fill(1);strokeWeight(2);
beginShape();vertex(152, 20);vertex(156, 0);vertex(140, 0);endShape();
beginShape();vertex(152, 20);vertex(175, 54);
vertex(175, 54);bezierVertex(163, 63, 148, 70, 134, 62);
endShape();
fill(172, 76, 51);strokeWeight(0);
beginShape();vertex(152, 20);vertex(157, 3);vertex(145, 8);endShape();
line(156, 4, 162, 0);
//else component
noFill();strokeWeight(1);
bezier(50, 295, 54, 281, 72, 270, 81, 279);
bezier(70, 295, 78, 290, 80, 290, 84, 295);
//longcurve I
noFill();strokeWeight(1);beginShape();stroke(1);
curveVertex(80, 0);
curveVertex(80, 0);curveVertex(95, 31);
curveVertex(95, 64);curveVertex(95, 86);
curveVertex(91, 105);curveVertex(86, 137);
curveVertex(75, 168);curveVertex(66, 190);
curveVertex(64, 224);curveVertex(70, 241);
curveVertex(76, 256);curveVertex(98, 295);
curveVertex(98, 295);
//blanc
endShape();
beginShape();fill(202, 198, 196);stroke(202, 198, 196);
vertex(80, 0);
bezierVertex(98, 27, 96, 38, 95, 64);
vertex(95, 64);vertex(80, 0);
endShape(CLOSE);
}

