
/*this is a gnome drawn using irregular polygons. mouse x = 260 mouse y = 68 */
void setup() {
size(500, 500);
background(173, 172, 172);
}

void draw() {

  fill(0);
  smooth();

  triangle(260, 68, 252, 167, 289, 191);//hat
  quad(175, 403, 171, 419, 196, 427, 196, 411);//left toes

  quad(175, 403, 240, 384, 242, 404, 196, 427); //left foot

beginShape();//left leg
  vertex(175, 403);
  vertex(240, 384);
  vertex(242, 368);
  vertex(235, 373);
  vertex(195, 367);
  vertex(197, 369);
  vertex(202, 372);
  vertex(203, 374);
  vertex(205, 377);
  vertex(205, 382);
  vertex(205, 385);
  vertex(197, 392);
  vertex(183, 399);
  vertex(175, 403);
endShape(CLOSE);

beginShape(); //rightleg
  vertex(254, 434);
  vertex(261, 440);
  vertex(293, 440);
  vertex(299, 434);
  vertex(299, 426);
  vertex(287, 404);
  vertex(286, 388);
  vertex(289, 373);
  vertex(289, 369);
  vertex(239, 370);
  vertex(252, 393);
  vertex(252, 409);
  vertex(254, 413);
  vertex(254, 434);
endShape(CLOSE);

triangle(207, 321, 200, 350, 203, 354); //coat edge

beginShape(); //coat edge bottom
  vertex(195, 367);
  vertex(243, 373);
  vertex (289, 369);
  vertex(287, 362);
  vertex(195, 367);
endShape(CLOSE);

beginShape();//coat bottom right
  vertex(243, 373);
  vertex(243, 363);
  vertex(258, 342);
  vertex(258, 315);
  vertex(287, 326);
  vertex(276, 314);
  vertex(303, 302);
  vertex(306, 309);
  vertex(306, 331);
  vertex(309, 347);
  vertex(313, 353);
  vertex(290, 370);
  vertex(243, 373);
endShape(CLOSE);

 beginShape(); //right arm
  vertex(276, 314);
  vertex(304, 287);
  vertex(305, 274);
  vertex(298, 270);
  vertex(309, 244);
  vertex(322, 266);
  vertex(322, 274);
  vertex(303, 302);
endShape(CLOSE);

beginShape();//chest, beard
  vertex(310, 235);
  vertex(309, 244);
  vertex(298, 271);
  vertex(291, 284);
  vertex(282, 291);
  vertex(275, 301);
  vertex(271, 306);
  vertex(266, 303);
  vertex(250, 305);
  vertex(239, 291);
  vertex(210, 280);
  vertex(210, 271);
  vertex(219, 256);
  vertex(229, 270);
  vertex(229, 257);
  vertex(242, 235);
  vertex(241, 268);
  vertex(259, 266);
  vertex(252, 249);
  vertex(265, 245);
  vertex(262, 237);
  vertex(266, 234);
  vertex(271, 245);
  vertex(266, 247);
  vertex(275, 256);
  vertex(285, 257);
  vertex(290, 252);
  vertex(276, 229);
  vertex(284, 238);
  vertex(292, 238);
  vertex(310, 240);
endShape(CLOSE);

quad(207, 268, 207, 282, 196, 279, 196, 267);//buckle?

beginShape();//extra beard1
  vertex(206, 251);
  vertex(208, 257);
  vertex(202, 263);
  vertex(201, 267);
  vertex(194, 263);
  vertex(200, 262);
  vertex(203, 258);
endShape(CLOSE);
beginShape();//extra beard2
  vertex(189, 255);
  vertex(198, 242);
  vertex(199, 244);
  vertex(205, 244);
  vertex(209, 237);
  vertex(208, 247);
  vertex(207, 245);
  vertex(198, 246);
  vertex(198, 252);
  vertex(196, 255);
  vertex(193, 255);
  vertex(189, 256);
endShape(CLOSE);

beginShape();//mouth
  vertex(211, 236);
  vertex(211, 230);
  vertex(212, 227);
  vertex(213, 219);
  vertex(215, 220);
  vertex(216, 214);
  vertex(220, 214);
  vertex(225, 211);
  vertex(229, 213);
  vertex(230, 210);
  vertex(231, 212);
  vertex(237, 213);
  vertex(241, 215);
  vertex(246, 219);
  vertex(237, 218);
  vertex(227, 219);
  vertex(225, 218);
  vertex(232, 218);
  vertex(237, 216);
  vertex(230, 215);
  vertex(224, 216);
  vertex(224, 218);
  vertex(221, 219);
  vertex(218, 221);
  vertex(215, 225);
endShape(CLOSE);

beginShape();//nose
  vertex(250, 205);
  vertex(245, 200);
  vertex(242, 202);
  vertex(240, 200);
  vertex(241, 196);
  vertex(258, 178);
  vertex(243, 180);
  vertex(235, 193);
  vertex(228, 195);
  vertex(230, 197);
  vertex(228, 201);
  vertex(224, 202);
  vertex(221, 203);
  vertex(216, 204);
  vertex(223, 207);
  vertex(231, 207);
endShape(CLOSE);

ellipse(252, 188, 10, 8);//eye
triangle(228, 188, 218, 180, 229, 183);//browshadow
ellipse(223, 189, 11, 8);//eye2
strokeWeight(3);
line(218, 181, 243, 181);//brow

}



