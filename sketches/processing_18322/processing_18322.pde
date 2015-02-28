
//Xuan Li
//CTIN 544

/////////////////////////////////////////
//demonstration of basic drawing commands
/////////////////////////////////////////
//beginShape, endShape
//ellipse
//rect
//basic for loops for drawing
//text font drawing
//using pushStyle, popStyle, pushMatrix, popMatrix

PFont font;

void setup() {

  size(640,480, JAVA2D);
  background(0);
  frameRate(30);

  font = loadFont("V5ProphitCell-48.vlw"); 
  textFont(font);
}

void draw() {
  background(0);

  drawFanBlades();

  structure();
  drawCheckerBoard();
  redLines();


  structure2();
  crowd();

  drawFinish();
  banner();

  //using processing to get the exact coordinates instead of
  //using photoshop/illustrator

    //println(mouseX);
  //println("y: " + mouseY);
}

void drawCheckerBoard() {
  //checkboard floor pattern

  fill(255, 255, 255);
  beginShape();
  vertex(5, 479);
  vertex(5, 448);
  vertex(71, 407);
  vertex(232, 407);
  vertex(192, 479);
  endShape(CLOSE);

  beginShape();
  vertex(138, 369);
  vertex(170, 347);
  vertex(263, 347);
  vertex(253, 369);
  endShape(CLOSE);

  beginShape();
  vertex(200, 330);
  vertex(273, 330);
  vertex(277, 321);
  vertex(213, 321);
  endShape(CLOSE);

  beginShape();
  vertex(285, 306);
  vertex(235, 306);
  vertex(227, 312);
  vertex(282, 312);
  endShape(CLOSE);

  beginShape();
  vertex(245, 301);
  vertex(287, 301);
  vertex(290, 297);
  vertex(250, 297);
  endShape(CLOSE);

  beginShape();
  vertex(256, 293);
  vertex(292, 293);
  vertex(293, 291);
  vertex(261, 291);
  endShape(CLOSE);

  fill(200,200,200);
  beginShape();
  vertex(265, 288);
  vertex(296, 288);
  vertex(305, 276);
  vertex(281, 276);
  endShape(CLOSE);

  /////////////////////////////////////////////////////////////////////////

  fill(255,255,255);
  beginShape();
  vertex(234, 405);
  vertex(394, 405);
  vertex(374, 368);
  vertex(253, 368);
  endShape(CLOSE);

  beginShape();
  vertex(264, 345);
  vertex(361, 345);
  vertex(354, 331);
  vertex(274, 331);
  endShape(CLOSE);

  beginShape();
  vertex(280, 320);
  vertex(349, 320);
  vertex(345, 312);
  vertex(284, 312);
  endShape(CLOSE);

  beginShape();
  vertex(288, 306);
  vertex(340, 306);
  vertex(338, 301);
  vertex(291, 301);
  endShape(CLOSE);

  beginShape();
  vertex(293, 297);
  vertex(337, 297);
  vertex(335, 294);
  vertex(295, 294);
  endShape(CLOSE);

  beginShape();
  vertex(296, 291);
  vertex(332, 291);
  vertex(331, 288);
  vertex(297, 288);
  endShape(CLOSE);

  beginShape();
  vertex(299, 287);
  vertex(330, 287);
  vertex(325, 276);
  vertex(305, 276);
  endShape(CLOSE);

  /////////////////////////////////////////////////////////////////////////////////////

  beginShape();
  vertex(434, 479);
  vertex(634, 479);
  vertex(634, 454);
  vertex(558, 406);
  vertex(394, 406);
  endShape(CLOSE);

  beginShape();
  vertex(374, 368);
  vertex(494, 368);
  vertex(460, 345);
  vertex(363, 345);
  endShape(CLOSE);

  beginShape();
  vertex(355, 331);
  vertex(434, 331);
  vertex(420, 320);
  vertex(349, 320);
  endShape(CLOSE);

  beginShape();
  vertex(346, 312);
  vertex(403, 312);
  vertex(397, 306);
  vertex(341, 306);
  endShape(CLOSE);

  beginShape();
  vertex(339, 301);
  vertex(385, 301);
  vertex(382, 297);
  vertex(337, 297);
  endShape(CLOSE);

  beginShape();
  vertex(336, 294);
  vertex(374, 294);
  vertex(372, 291);
  vertex(334, 291);
  endShape(CLOSE);

  beginShape();
  vertex(332, 289);
  vertex(365, 289);
  vertex(347, 276);
  vertex(325, 276);
  endShape(CLOSE);
}

void redLines() {

  pushMatrix();
  pushStyle();

  fill(254, 34, 56);
  //noStroke();
  beginShape();
  vertex(3, 447+10);
  vertex(3, 400);
  vertex(282+5, 274);
  vertex(278+5, 274);
  endShape(CLOSE);


  beginShape();
  vertex(635, 454);
  vertex(635, 406);
  vertex(282+60, 274);
  vertex(278+60, 274);
  endShape(CLOSE);



  fill(164, 119, 147);

  beginShape();
  vertex(2, 369);
  vertex(2, 344);
  vertex(269, 269);
  vertex(272, 272);
  endShape(CLOSE);

  beginShape();
  vertex(634, 372);
  vertex(634, 347);
  vertex(357, 269);
  vertex(356, 272);
  endShape(CLOSE);

  fill(244, 203, 230);
  noStroke();

  beginShape();
  vertex(2, 369-10);
  vertex(2, 344+10);
  vertex(269, 269+1);
  vertex(272, 272-2);
  endShape(CLOSE);


  beginShape();
  vertex(634, 372-10);
  vertex(634, 347+10);
  vertex(357, 269+1);
  vertex(356, 272-2);
  endShape(CLOSE);

  popStyle();
  popMatrix();
}

void crowd() {

  pushStyle();

  fill(158, 170, 134);

  beginShape();
  vertex(303, 255);
  vertex(252, 207);
  vertex(203, 170);
  vertex(125, 114);
  vertex(255, 255);
  endShape(CLOSE);

  beginShape();
  vertex(373, 258);
  vertex(499, 118);
  vertex(403, 187);
  vertex(350, 228);
  vertex(325, 255);
  endShape(CLOSE);


  popStyle();
}

void structure() {


  //top connect structure
  pushStyle();
  fill(64, 135, 204);

  beginShape();
  vertex(484, 43);
  vertex(530, 93);
  vertex(569, 53);
  vertex(553, 43);

  endShape();

  beginShape();
  vertex(144, 42);
  vertex(96, 89);
  vertex(58, 54);
  vertex(79, 43);

  endShape();

  //smaller connector
  beginShape();

  vertex(83, 43);
  vertex(118, 43);
  vertex(70, 95);
  vertex(54, 76);

  endShape();

  popStyle();


  pushStyle();
  fill(88, 154, 223);
  beginShape();
  vertex(218, 301);
  vertex(64, 134);
  vertex(76, 130);
  vertex(87, 124);
  vertex(96, 113);
  vertex(105, 103);
  vertex(272, 276);
  endShape();


  beginShape();
  vertex(412, 299);
  vertex(569, 133);
  vertex(552, 131);
  vertex(538, 121);
  vertex(530, 109);
  vertex(526, 95);
  vertex(359, 274);
  endShape();

  popStyle();


  //supporting column highlight
  pushStyle();

  fill(133,182,255);
  noStroke(); 
  beginShape();
  vertex(373, 279);
  vertex(400, 295);
  vertex(552, 131);
  vertex(542, 126);
  vertex(535, 117);
  vertex(530, 109);
  vertex(372, 279);
  endShape();

  beginShape();
  vertex(229, 296);
  vertex(259, 283);
  vertex(99+2, 108+2 );
  vertex(90, 121);
  vertex(77, 130);
  vertex(228, 295);
  endShape();

  popStyle();

  pushStyle();
  fill(88,137,227);
  ellipse(61+2, 89+2, 77, 77);

  ellipse(568-2, 89+2, 77, 77);
  popStyle();


  //end finish line structure
  pushStyle();
  fill(110, 176, 255, 200);
  noStroke();
  beginShape(QUAD_STRIP);
  vertex(254, 255);
  vertex(274, 278);
  vertex(302, 255);
  vertex(326, 255);
  vertex(352, 282);
  vertex(372, 258);

  endShape();

  popStyle();


  pushStyle();

  beginShape();
  fill(105, 115, 245);
  vertex(553, 91);
  vertex(510, 44-1);
  vertex(542, 44-1);
  vertex(571, 74);

  endShape(CLOSE);


  beginShape();

  vertex(83, 43);
  vertex(118, 43);
  vertex(70, 95);
  vertex(54, 76);

  endShape(CLOSE);


  ellipse(568, 88, 28, 28);
  ellipse(60, 89, 28, 28);

  popStyle();


  //highlight ellipse
  pushStyle();
  noStroke();
  fill(200,200,200);
  ellipse(569, 89, 8, 8);

  ellipse(60, 89, 8, 8);

  popStyle();
}

void drawFinish() {

  //finish sign bar
  pushStyle();

  fill(183, 34, 85);

  beginShape();
  vertex(169, 57);

  vertex(169+2, 62+2);
  vertex(464-2, 62+2);
  vertex(464, 57);

  endShape(CLOSE);

  popStyle();

  //finish sign bar


  pushStyle();

  beginShape();

  fill(255,10,10);
  vertex(184, 79);

  vertex(200, 90);
  vertex(200, 146);
  vertex(193, 152);
  vertex(432, 152);
  vertex(423, 146);
  vertex(423, 90);
  vertex(447, 79);

  endShape(CLOSE);

  popStyle();

  //orange text
  fill(255, 221, 0);
  text("FINISH", 226, 125); 


  //arcs
  pushStyle();
  fill(159,204,9);

  arc(198, 116, 60, 60, PI/2, 3*PI/2);

  pushMatrix();
  arc(426, 116, 60, 60, radians(-90), PI/2);
  popMatrix();

  pushStyle();
  noStroke();

  fill(116, 150, 97);
  arc(198, 116, 20, 20, PI/2, 3*PI/2);
  arc(426, 116, 20, 20, radians(-90), PI/2);
  popStyle();

  popStyle();
}

void structure2() {

  //grid pattern
  pushStyle();
  fill(147, 0, 180);
  for (int i = 0; i++ < 60;) {
    rect(232 + i*3, 153, 2, 10);
  }
  popStyle();

  pushStyle();
  fill(151, 107, 197);
  for (int i = 0; i++ < 60;) {
    rect(232 + i*3, 163, 2, 10);
  }
  popStyle();

  pushStyle();
  fill(147, 0, 180);
  for (int i = 0; i++ < 60;) {
    rect(232 + i*3, 173, 2, 10);
  }
  popStyle();

  pushStyle();
  fill(151, 107, 197);
  for (int i = 0; i++ < 60;) {
    rect(232 + i*3, 183, 2, 10);
  }
  popStyle();

  pushStyle();
  fill(147, 0, 180);
  for (int i = 0; i++ < 60;) {
    rect(232 + i*3, 193, 2, 10);
  }
  popStyle();

  pushStyle();
  fill(151, 107, 197);
  for (int i = 0; i++ < 60;) {
    rect(232 + i*3, 203, 2, 10);
  }
  popStyle();

  pushStyle();
  fill(147, 0, 180);
  for (int i = 0; i++ < 60;) {
    rect(232 + i*3, 213, 2, 5);
  }
  popStyle();


  //end grid pattern


  pushStyle();
  fill(81, 153, 255);

  beginShape();
  vertex(103, 99);
  vertex(148, 48);
  vertex(282, 217);
  vertex(273, 225);

  endShape(CLOSE);

  beginShape();
  vertex(346, 216);
  vertex(353, 225);
  vertex(524, 97);
  vertex(479, 49);

  endShape(CLOSE);

  popStyle();

  pushStyle();
  fill(44, 120, 226);

  beginShape();
  vertex(147, 46);
  vertex(150, 42);
  vertex(476, 42);
  vertex(481, 47);
  vertex(437+5, 97);
  vertex(187, 97);
  endShape(CLOSE);

  popStyle();
}
//blend color test
int inc = 0;

void drawFanBlades() {

  //fan blade shroud
  pushStyle();

  fill(13, 68, 100);
  ellipse(95, 107, 150, 150);
  ellipse(width-95, 107, 150, 150);

  fill(71, 139, 213);
  pushMatrix();


  ellipse(68, 95, 160, 160);
  ellipse(568, 98, 160, 160);

  fill(31, 89, 103);
  noStroke();
  ellipse(65, 93, 125, 125);
  ellipse(568, 95, 125, 125);



  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  fill(208, 28, 123);
  translate(68, 95);

  //rotate(radians(inc)); //for animation

  for (int i = 0; i++ < 36;) {
    rotate(radians(10));
    rect(0, 0, 60, 5);
  }
  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  fill(208, 28, 123);
  translate(568, 95);
  rotate(radians(inc));

  for (int i = 0; i++ < 36;) {
    rotate(radians(10));
    rect(0, 0, 60, 5);
  }
  popMatrix();
  popStyle();
}

void banner() {
  pushStyle();
  stroke(10, 100, 10);

  fill(30, 156, 52);
  rect(0, 0, width, 50);

  noStroke();
  fill(5, 255, 0);

  pushMatrix();


  for (int b = 0; b++<10;) {

    rect(-2, 3, 10, 42);

    translate(12, 0);
    rect(b*50, 3, 5, 42);

    rect(200 + (b*15), 3, 5, 42);

    rect(b*25, 3, 5, 42);
  }

  popMatrix();

  pushStyle();
  for (int b = 0; b++<10;) {
    fill(50, 120, 50);
    rect(132 + (b*40), 3, 10, 42);
  }
  popStyle();

  pushMatrix();
  rect(0, 48, width, 2);

  popMatrix();

  fill(5, 235, 0, 180);
  rect(5, 5, 60, 30);
  rect(72,17,40, 25);

  popStyle();
}


