

/************************************************************
 *                                                          *
 *    Recreation of tha '67 Aspen Winter Jazz Poster        *
 *              Created by Colin WIllson                    *
 *    Image originally created by Roy Lichtenstein          *
 *                                                          *
 ************************************************************/



void setup() {
 
  size(540, 800);
  background(0, 0, 0);
  smooth();

}


void draw() {
  smooth();
  stroke(0, 0, 0);

  waveMaker(90);

  waveMaker(60);

  stroke(0, 0, 0);
  //start music staff
  strokeWeight(5);
  fill(255, 255, 255);
  rect(0, 127, 540, 116);
  line(0, 156, 540, 156);
  line(0, 185, 540, 185);
  line(0, 214, 540, 214);

  line(267, 127, 267, 243);
  strokeWeight(15);
  line(285, 127, 285, 243);

  fill(0, 0, 0);
  strokeWeight(0);
  ellipse(252, 170, 8, 8);// Dot 1
  ellipse(252, 199, 8, 8);// Dot 2

  //end music staff

  waveMaker(30);

  stroke(0, 0, 0);
  strokeWeight(20);
  fill(196, 117, 112);
  ellipse(144, 585, 505, 505);

  waveMaker(0);// Wave 1

  // Shirt

  beginShape();

  fill(255, 255, 255);

  vertex(426, 471);
  vertex(540, 471);
  vertex(540, 145);
  vertex(446, 145);
  vertex(365, 255);
  vertex(426, 471);

  endShape();


  strokeWeight(8);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  triangle(0, 800, 540, 315, 540, 800);

  strokeWeight(11);
  fill(255, 255, 255);
  quad(485, 0, -55, 800, 0, 800, 540, 0);

  strokeWeight(0);
  fill(215, 0, 0);
  triangle(144, 585, 0, 483, 0, 800);


  fill(0, 0, 0);
  triangle(365, 255, 446, 145, 316, 100);

  stroke(0, 0, 0);
  strokeWeight(7); // Yellow bar
  fill(249, 190, 0);
  rect(0, 0, 540, 127);


  // Bow Tie

  beginShape();

  fill(0, 0, 0);
  strokeWeight(0);

  vertex(432, 167);
  vertex(478, 167);
  vertex(510, 145);//right
  vertex(510, 217);
  vertex(478, 195);
  vertex(432, 195);
  vertex(400, 217);//left
  vertex(400, 145);
  vertex(432, 167);

  endShape();

  fill( 255, 255, 255);
  triangle(400, 203, 400, 145, 425, 163);

  //Buttons
  fill(0, 0, 0);
  ellipse(450, 225, 8, 8);
  ellipse(448, 330, 8, 8);

  // Start sax body**************************************
  int x1 = 270;
  int y1 = 553;
  int x2 = 390;
  int y2 = 670;
  int x3 = 380;
  int y3 = 770;
  int x4 = 430;
  int y4 = 800;


  int x5 = 285;
  int y5 = 800;
  int x6 = 270;
  int y6 = 730;
  int x7 = 205;
  int y7 = 690;
  int x8 = 165;
  int y8 = 698;

  int x9 = 290;
  int y9 = 132;
  int x10 = 282;//ctrl
  int y10 = 106;
  int x11 = 305;//ctrl
  int y11 = 85;
  int x12 = 330;
  int y12 = 95;

  int x13 = 354;
  int y13 = 129;
  int x14 = 331;//ctrl
  int y14 = 124;
  int x15 = 326;//ctrl
  int y15 = 128;
  int x16 = 330;
  int y16 = 146;


  fill(249, 190, 0);
  beginShape();

  strokeWeight(8);
  stroke(0, 0, 0);
  vertex(x1, y1);
  bezierVertex(x2, y2, x3, y3, x4, y4);
  vertex(x9, y9);
  bezierVertex(x10, y10, x11, y11, x12, y12);
  vertex(455, 127);
  vertex(540, 127);
  vertex(540, 145);
  vertex(446, 145);
  vertex(x13, y13);
  bezierVertex(x14, y14, x15, y15, x16, y16);
  vertex(525, 800);// Lower right corner
  vertex(x5, y5);
  bezierVertex(x6, y6, x7, y7, x8, y8);
  vertex(x1, y1);


  endShape();



  fill(255, 255, 255);
  ellipse(144, 585, 252, 252);//temp!  
  /*
strokeWeight(0);
   fill(0, 0, 255);
   ellipse(x1, y1, 8, 8);
   ellipse(x2, y2, 8, 8);
   ellipse(x3, y3, 8, 8);
   ellipse(x4, y4, 8, 8);
   
   ellipse(x5, y5, 8, 8);
   ellipse(x6, y6, 8, 8);
   ellipse(x7, y7, 8, 8);
   ellipse(x8, y8, 8, 8);
   
   ellipse(x9, y9, 2, 2);
   ellipse(x10, y10, 2, 2);
   ellipse(x11, y11, 2, 2);
   ellipse(x12, y12, 2, 2);
   
   ellipse(x13, y13, 2, 2);
   ellipse(x14, y14, 2, 2);
   ellipse(x15, y15, 2, 2);
   ellipse(x16, y16, 2, 2);
   */

  strokeWeight(5);
  fill(255, 255, 255);
  ellipse(293, 697, 58, 58);
  ellipse(436, 639, 40, 40);
  ellipse(387.5, 445, 34, 34);
  ellipse(345, 280, 23, 23);
  ellipse(323, 191, 17, 17);

  strokeWeight(6);
  line(291, 702, 348, 800);

  // End sax body**************************************

  // Start hand_________________________________________


  beginShape();

  strokeWeight(5);

  fill(196, 117, 112);
  vertex(482, 471);//upper right
  vertex(426, 471);
  bezierVertex(438, 500, 432, 507, 418, 508);
  //vertex(436, 508);
  vertex(323, 508);//finger 1
  bezierVertex(315, 516, 315, 525, 323, 533);
  vertex(410, 533);
  bezierVertex(415, 536, 415, 540, 410, 543);
  vertex(284, 543);//finger 2
  bezierVertex(276, 551, 276, 560, 284, 568);
  vertex(410, 568);
  bezierVertex(415, 574, 415, 572, 410, 578);
  vertex(314, 578);//finger 3
  bezierVertex(306, 586, 306, 595, 314, 603);
  vertex(410, 603);
  bezierVertex(415, 609, 415, 607, 410, 613);
  vertex(338, 613);//finger 4
  bezierVertex(330, 621, 330, 630, 338, 638);
  vertex(482, 638);//back

  endShape();

  fill(255, 255, 255);
  rect(489, 470, 46, 210);

  strokeWeight(0);
  fill(0, 0, 0);

  ellipse(520, 660, 17, 17);

  fill(255, 0, 0);
  strokeWeight(0);

  // End hand_________________________________________

  //start sax opening
  strokeWeight(7);

  fill(249, 190, 0);
  arc(144, 585, 252, 252, radians(215), radians(305));
  fill(215, 0, 0);
  arc(144, 585, 210, 210, radians(215), radians(305));
  fill(255, 255, 255);
  arc(144, 585, 145, 145, radians(215), radians(305));

  fill(255, 255, 255);
  arc(144, 585, 252, 252, radians(125), radians(215));
  fill(0, 0, 0);
  arc(144, 585, 210, 210, radians(125), radians(215));
  fill(215, 0, 0);
  arc(144, 585, 145, 145, radians(125), radians(215));

  //end sax opening

  // Bottom red shape

  beginShape();

  stroke(0, 0, 0);
  strokeWeight(8);
  //noStroke();
  fill(215, 0, 0);

  vertex(0, 800);
  vertex(285, 800);
  bezierVertex(215, 665, 150, 727, 112, 700);
  //vertex(112, 700);
  vertex(0, 800);

  endShape();

  stroke(0, 0, 0);
  strokeWeight(18);
  line(144, 585, 0, 483);

  strokeWeight(7);
  fill(0, 0, 0);
  arc(144, 585, 252, 252, radians(-55), radians(125));
  fill(255, 255, 255);
  arc(144, 585, 210, 210, radians(-55), radians(125));
  arc(144, 585, 145, 145, radians(-55), radians(125));

  strokeWeight(11);
  line(0, 800, 215, 482);


  // Outside Border
  strokeWeight(0);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  rect(0, 0, 20, 800);//left bar
  rect(520, 0, 20, 800);//right bar
  rect(0, 0, 540, 15);//top bar
  rect(0, 780, 540, 20);//bottom bar

  // TITLE++++++++++++++++++++++++++++++++++++++++

  stroke(215, 0, 0);
  strokeWeight(3);
  noFill();

  line(33, 34, 33, 87);
  arc(44, 34, 22, 22, radians(180), radians(270));
  line(44, 23, 50, 23);
  line(50, 23, 50, 87);
  line(27, 53, 50, 53);

  arc(88, 56, 22, 22, radians(220), radians(305));
  line(79, 49, 37, 106);
  arc(28, 99, 22, 22, radians(40), radians(105));

  ellipse(105, 70, 34, 34);
  line(88, 53, 88, 110);

  arc(147, 70, 34, 34, radians(35), radians(360));
  line(130, 70, 164, 70);

  line(172, 53, 172, 87);
  line(188, 61, 188, 87);
  arc(179, 61, 18, 18, radians(216), radians(360));

  line(213, 23, 225, 87); 
  line(225, 87, 237, 23); 
  line(228, 23, 240, 87); 
  line(240, 87, 252, 23); 

  line(259, 53, 259, 87);

  line(272, 53, 272, 87);
  line(288, 61, 288, 87);
  arc(279, 61, 18, 18, radians(216), radians(360));

  line(303, 38, 303, 81);
  line(296, 53, 310, 53);
  arc(309, 81, 12, 12, radians(20), radians(180));


  arc(338, 70, 34, 34, radians(35), radians(360));
  line(321, 70, 355, 70);

  line(364, 53, 364, 87);
  arc(371, 61, 18, 18, radians(216), radians(295));

  fill(215, 0, 0);
  noStroke();
  ellipse(395, 70, 7, 7);

  noFill();
  stroke(215, 0, 0);
  line(415, 23, 415, 90);
  arc(402, 90, 26, 26, radians(0), radians(150));

  ellipse(445, 70, 34, 34);
  line(462, 53, 462, 87);

  line(491, 53, 511, 53);
  line(511, 53, 486, 87);
  line(486, 87, 511, 87);

  line(470, 30, 513, 30);
  line(513, 30, 457, 110);
  line(457, 110, 511, 110);
  /*
  strokeWeight(1);
   stroke(0, 0, 0);
   line(0, 23, 540, 23);
   line(0, 45, 540, 45);
   line(0, 53, 540, 53);
   line(0, 87, 540, 87);
   line(0, 110, 540, 110);
   */
}


void waveMaker(int offset) {

  int X1 = 18;
  int X2 = 52;

  X1 += offset;
  X2 += offset;

  beginShape();
  fill(0, 0, 0);
  strokeWeight(7);
  stroke(0, 0, 0);

  vertex(0, 10);
  vertex(X1, 10);
  bezierVertex(X1, 40, X2, 63, X2, 93);
  //vertex(55, 93);//1
  bezierVertex(X2, 123, X1, 146, X1, 176);// dip 2
  //vertex(10, 176);
  bezierVertex(X1, 206, X2, 229, X2, 259);// hump 2
  //vertex(55, 259);//2
  bezierVertex(X2, 289, X1, 302, X1, 332);// dip 2
  //vertex(10, 332);
  bezierVertex(X1, 362, X2, 385, X2, 415);// hump 3
  //vertex(55, 415);//3
  bezierVertex(X2, 445, X1, 468, X1, 498);// dip 3
  vertex(0, 498);
  //vertex(10, 0);


  endShape();

  beginShape();
  fill(108, 83, 87);
  strokeWeight(4);
  stroke(255, 255, 255);

  vertex(0, 10);
  vertex(X1, 10);
  bezierVertex(X1 - 5, 40, X2 - 5, 63, X2 - 5, 93);
  //vertex(55, 93);//1
  bezierVertex(X2 - 5, 123, X1 - 5, 146, X1 - 5, 176);// dip 2
  //vertex(10, 176);
  bezierVertex(X1 - 5, 206, X2 - 5, 229, X2 - 5, 259);// hump 2
  //vertex(55, 259);//2
  bezierVertex(X2 - 5, 289, X1 - 5, 302, X1 - 5, 332);// dip 2
  //vertex(10, 332);
  bezierVertex(X1 - 5, 362, X2 - 5, 385, X2 - 5, 415);// hump 3
  //vertex(55, 415);//3
  bezierVertex(X2 - 5, 445, X1 - 5, 468, X1 - 5, 498);// dip 3
  vertex(0, 498);
  //vertex(10, 0);


  endShape();
}


