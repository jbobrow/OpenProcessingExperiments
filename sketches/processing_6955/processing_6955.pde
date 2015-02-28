
PImage paper;
PImage paper2;

void setup(){
  size(640, 480);
  colorMode(HSB, 360, 100, 100);
  paper = loadImage("Paper_05.jpg");
  paper2 = loadImage("Paper_04.jpg");
  smooth();
  noLoop();
}

void draw(){
  background(paper2);
  //background(40, 8, 93);
  
  scale(0.85);
  translate(0, 130);
  
  //right-hand lines
  strokeWeight(4);
  line(706, -62, 772, -94);
  strokeWeight(2);
  line(704, -66, 772, -101);
  line(691, -17, 772, -59);
  fill(11, 63, 85);
  strokeWeight(4);
  stroke(11, 63, 85);
  line(690, -20, 772, -63);
  
  //bottom arc

  stroke(0);
  fill(15, 14, 89);
  strokeWeight(3);
  arc(694, 397, 154, 160, PI, 2*PI);
  
  noStroke();
  fill(40, 8, 93);
  arc(694, 397, 140, 146, PI, 2*PI);

  //white semi-circle x:613 y:315
  strokeWeight(2);
  stroke(0);
  fill(247, 14, 74);
  arc(613, 313, 147, 147, PI, 2*PI);
  
  strokeWeight(2);
  stroke(0);
  fill(44, 74, 88);
  arc(772, 313, 147, 147, PI, 2*PI);
  
  strokeWeight(1);
  stroke(330, 1, 97);
  fill(330, 1, 97);
  arc(772, 313, 132, 132, PI, 2*PI);
  
  strokeWeight(1);
  fill(330, 1, 97);
  stroke(330, 1, 97);
  arc(613, 313, 132, 132, PI, 2*PI);

  //diagonal bottom right
  stroke(0);
  fill(340, 21, 17);
  beginShape();
  vertex(596, 437);
  vertex(746, -140);
  vertex(751, -140);
  vertex(600, 437);
  endShape();
  
  strokeWeight(4);
  line(502, 438, 563, 398);

  //intersecting bottom lines
  /*fill(330, 100, 2);
  beginShape();
  vertex(639, 459);
  vertex(516, 458);
  vertex(515, 460);
  vertex(638, 461);
  endShape();

  fill(340, 100, 8);
  beginShape();
  vertex(511, 479);
  vertex(524, 467);
  vertex(525, 468);
  vertex(514, 479);
  endShape();
  
  fill(348, 41, 15);
  beginShape();
  vertex(440, 479);
  vertex(563, 397);
  vertex(565, 399);
  vertex(446, 479);
  endShape();
  
  fill(327, 79, 5);
  beginShape();
  vertex(639, 313);
  vertex(375, 311);
  vertex(370, 309);
  vertex(365, 311);
  vertex(373, 313);
  vertex(639, 316);
  endShape();*/
  
  //top-left intersecting lines
  strokeWeight(2.5);
  fill(252, 17, 11);
  line(0, 71, 607, -95);
  line(101, 71, 273, -111);
  
  //thick middle line
  fill(252, 16, 13);
  beginShape();
  vertex(308, 390);
  vertex(13, 233);
  vertex(6, 244);
  vertex(292, 410);
  endShape();
  
  //left semi-circles
  fill(250, 13, 77, 180);
  stroke(250, 13, 77, 160);
  ellipse(0, 370, 60, 120);
  
  fill(203, 32, 72, 200);
  stroke(203, 32, 72, 140);
  ellipse(0, 370, 40, 95);
  
  fill(46, 78, 89);
  strokeWeight(3);
  stroke(0, 180);
  ellipse(0, 370, 30, 65);
  
  //top curve
  noFill();
  stroke(0);
  strokeWeight(8);
  beginShape();
  vertex(68, 139);
  bezierVertex(0, -20, 98, -30, 145, 65); //first hump
  bezierVertex(200, 130, 230, 60, 232, 0); //second hump
  endShape();
  
  strokeWeight(6);
  beginShape();
  vertex(232, 0);
  bezierVertex(235, -40, 300, -63, 322, -18); //third hump
  endShape();
  
  strokeWeight(4);
  beginShape();
  vertex(322, -18);
  bezierVertex(347, 18, 400, 15, 422, -47); //fourth hump
  endShape();
  
  strokeWeight(2);
  beginShape();
  vertex(422, -47);
  bezierVertex(445, -90, 613, -120, 620, -103); //fifth hump
  endShape();
  
  //middle left 5 boxes
  strokeWeight(3);
  stroke(0);
  fill(28, 69, 70);
  beginShape();
  vertex(173, 318);
  vertex(207, 233);
  vertex(269, 293);
  vertex(232, 349);
  endShape();

  fill(12, 2, 93);
  beginShape();
  vertex(207, 233);
  vertex(223, 190);
  vertex(299, 249);
  vertex(269, 293);
  endShape();
  
  fill(69, 51, 44);
  beginShape();
  vertex(223, 190);
  vertex(240, 150);
  vertex(333, 200);
  vertex(299, 249);
  endShape();
  
  fill(12, 2, 93);
  beginShape();
  vertex(240, 150);
  vertex(260, 101);
  vertex(357, 162);
  vertex(333, 200);
  endShape();
  
  fill(266, 21, 13);
  beginShape();
  vertex(260, 101);
  vertex(286, 35);
  vertex(382, 126);
  vertex(357, 162);
  endShape();
  
  //second column
  strokeWeight(3);
  stroke(0);
  fill(212, 7, 88);
  beginShape();
  vertex(232, 349);
  vertex(269, 293);
  vertex(286, 309);
  vertex(244, 354);
  endShape();
  
  fill(264, 15, 13);
  beginShape();
  vertex(269, 293);
  vertex(299, 249);
  vertex(326, 270);
  vertex(286, 309);
  endShape();

  fill(312, 2, 91);
  beginShape();
  vertex(299, 249);
  vertex(333, 200);
  vertex(372, 221);
  vertex(326, 270);
  endShape();

  fill(196, 43, 70);
  beginShape();
  vertex(333, 200);
  vertex(357, 162);
  vertex(403, 189);
  vertex(372, 221);
  endShape();

  fill(37, 3, 91);
  beginShape();
  vertex(357, 162);
  vertex(382, 126);
  vertex(424, 167);
  vertex(403, 189);
  endShape();
  
  fill(264, 17, 12);
  beginShape();
  vertex(382, 126);
  vertex(397, 101);
  vertex(445, 147);
  vertex(424, 167);
  endShape();

  fill(42, 6, 90);
  beginShape();
  vertex(397, 101);
  vertex(412, 81);
  vertex(461, 130);
  vertex(445, 147);
  endShape();
  
  fill(252, 16, 12);
  beginShape();
  vertex(412, 81);
  vertex(429, 50);
  vertex(485, 107);
  vertex(461, 130);
  endShape();

  //third column
  fill(16, 5, 91);
  beginShape();
  vertex(244, 354);
  vertex(286, 309);
  vertex(312, 333);
  vertex(277, 372);
  endShape();
 
  fill(45, 7, 93);
  beginShape();
  vertex(286, 309);
  vertex(326, 270);
  vertex(351, 290);
  vertex(312, 333);
  endShape();
  
  fill(12, 2, 93);
  beginShape();
  vertex(326, 270);
  vertex(372, 221);
  vertex(400, 236);
  vertex(351, 290);
  endShape();
  
  fill(33, 5, 92);
  beginShape();
  vertex(372, 221);
  vertex(403, 189);
  vertex(427, 205);
  vertex(400, 236);
  endShape();
  
  fill(112, 30, 41);
  beginShape();
  vertex(403, 189);
  vertex(424, 167);
  vertex(445, 185);
  vertex(427, 205);
  endShape();
  
  fill(330, 1, 91);
  beginShape();
  vertex(424, 167);
  vertex(445, 147);
  vertex(462, 163);
  vertex(445, 185);
  endShape();
  
  fill(252, 14, 15);
  beginShape();
  vertex(445, 147);
  vertex(461, 130);
  vertex(480, 146);
  vertex(462, 163);
  endShape();
  
  fill(0, 0, 92);
  beginShape();
  vertex(461, 130);
  vertex(485, 107);
  vertex(502, 123);
  vertex(480, 146);
  endShape();
  
  fill(27, 4, 89);
  beginShape();
  vertex(485, 107);
  vertex(533, 60);
  vertex(544, 75);
  vertex(502, 123);
  endShape();
  
  fill(38, 4, 89);
  beginShape();
  vertex(533, 60);
  vertex(563, 31);
  vertex(574, 44);
  vertex(544, 75);
  endShape();
  
  fill(252, 15, 13);
  beginShape();
  vertex(563, 31);
  vertex(587, 4);
  vertex(600, 16);
  vertex(574, 44);
  endShape();
  
  //last column
  fill(59, 51, 64);
  beginShape();
  vertex(277, 372);
  vertex(312, 333);
  vertex(337, 356);
  vertex(305, 390);
  endShape();
  
  fill(40, 1, 90);
  beginShape();
  vertex(312, 333);
  vertex(351, 290);
  vertex(378, 310);
  vertex(337, 356);
  endShape();
  
  fill(40, 1, 92);
  beginShape();
  vertex(351, 290);
  vertex(400, 236);
  vertex(426, 251);
  vertex(378, 310);
  endShape();
  
  fill(7, 20, 86);
  beginShape();
  vertex(400, 236);
  vertex(427, 205);
  vertex(451, 220);
  vertex(426, 251);
  endShape();
  
  fill(22, 4, 88);
  beginShape();
  vertex(427, 205);
  vertex(445, 185);
  vertex(465, 204);
  vertex(451, 220);
  endShape();
 
  fill(264, 24, 8);
  beginShape();
  vertex(445, 185);
  vertex(462, 163);
  vertex(483, 182);
  vertex(465, 204);
  endShape(); 
  
  fill(27, 4, 87);
  beginShape();
  vertex(462, 163);
  vertex(480, 146);
  vertex(498, 166);
  vertex(483, 182);
  endShape();
  
  fill(29, 72, 60);
  beginShape();
  vertex(480, 146);
  vertex(502, 123);
  vertex(519, 140);
  vertex(498, 166);
  endShape();
  
  fill(38, 3, 92);
  beginShape();
  vertex(502, 123);
  vertex(544, 75);
  vertex(559, 94);
  vertex(519, 140);
  endShape();
  
  fill(280, 8, 15);
  beginShape();
  vertex(544, 75);
  vertex(574, 44);
  vertex(589, 58);
  vertex(559, 94);
  endShape();
  
  fill(37, 3, 90);
  beginShape();
  vertex(574, 44);
  vertex(600, 16);
  vertex(613, 32);
  vertex(589, 58);
  endShape();
  
  fill(252, 23, 9);
  beginShape();
  vertex(600, 16);
  vertex(618, -7);
  vertex(635, 6);
  vertex(613, 32);
  endShape();
  
  fill(26, 3, 87);
  beginShape();
  vertex(618, -7);
  vertex(640, -32);
  vertex(652, -17);
  vertex(635, 6);
  endShape();
  
  fill(327, 18, 19);
  beginShape();
  vertex(640, -32);
  vertex(654, -50);
  vertex(667, -38);
  vertex(652, -17);
  endShape();
  
  fill(0, 3, 93);
  beginShape();
  vertex(654, -50);
  vertex(672, -69);
  vertex(685, -58);
  vertex(667, -38);
  endShape();
  
  fill(312, 19, 11);
  beginShape();
  vertex(672, -69);
  vertex(691, -92);
  vertex(705, -78);
  vertex(685, -58);
  endShape();
  
  //red-fill line
  fill(359, 70, 48);
  strokeWeight(1);
  beginShape();
  vertex(772, 179);
  vertex(326, 315);
  vertex(325, 321);
  vertex(772, 187);
  endShape();
  
  //black line above red
  fill(312, 22, 18);
  strokeWeight(1);
  beginShape();
  vertex(772, 155);
  vertex(344, 240);
  vertex(347, 250);
  vertex(772, 165);
  endShape();
  
  //line under semi-circle
  strokeWeight(2.5);
  line(377, 311, 772, 314);
  
  fill(44, 32, 83);
  stroke(44, 32, 83);
  beginShape();
  vertex(117, 287);
  bezierVertex(110, 210, 177, 150, 231, 170);
  endShape();
  
  //curve in middle
  fill(40, 8, 93);
  strokeWeight(1.8);
  stroke(0);
  beginShape();
  vertex(123, 290);
  bezierVertex(110, 217, 177, 150, 229, 175);
  endShape();
  
  noStroke();
  beginShape();
  vertex(122, 289);
  vertex(230, 175);
  vertex(172, 316);
  vertex(124, 291);
  endShape();
  
  //middle green curves
  fill(320, 9, 82, 180);
  strokeWeight(2);
  stroke(320, 9, 82);
  beginShape();
  vertex(340, 84);
  bezierVertex(330, 49, 404, 34, 410, 79);
  endShape();
  
  fill(330, 1, 94);
  strokeWeight(1);
  stroke(330, 1, 94);
  beginShape();
  vertex(342, 86);
  bezierVertex(330, 53, 404, 38, 408, 80);
  endShape();
  
  fill(122, 25, 40);
  stroke(0);
  beginShape();
  vertex(346, 91);
  bezierVertex(330, 60, 404, 45, 406, 88);
  endShape();
  
  fill(40, 1, 92);
  beginShape();
  vertex(351, 95);
  bezierVertex(330, 66, 404, 51, 403, 88);
  endShape();
  
  fill(40, 1, 92);
  beginShape();
  noStroke();
  vertex(381, 123);
  vertex(403, 88);
  vertex(351, 93);
  vertex(381, 123);
  endShape();
  
  //top-right curves
  fill(54, 23, 82);
  noStroke();
  beginShape();
  vertex(449, 69);
  bezierVertex(460, 26, 530, 40, 528, 64);
  endShape();
  
  fill(218, 3, 95);
  beginShape();
  vertex(454, 72);
  bezierVertex(460, 32, 530, 44, 523, 67);
  endShape();
  
  fill(218, 3, 95);
  beginShape();
  vertex(454, 72);
  vertex(523, 67);
  vertex(485, 103);
  vertex(454, 72);
  endShape();
  
  fill(209, 16, 81);
  beginShape();
  vertex(464, 84);
  bezierVertex(455, 63, 525, 61, 508, 83);
  endShape();
  
  fill(50, 4, 88);
  beginShape();
  vertex(467, 87);
  bezierVertex(465, 69, 511, 65, 505, 85);
  endShape();
  
  fill(40, 1, 92);
  stroke(0);
  beginShape();
  vertex(470, 89);
  bezierVertex(470, 75, 504, 71, 501, 90);
  endShape();
  
  strokeWeight(2.5);
  line(459, -140, 722, 86);
  strokeWeight(3);
  line(371, -137, 371, -90);
  
  //top mid arc
  fill(266, 21, 13);
  noStroke();
  arc(273, -139, 214, 54, 0, HALF_PI);
  
  //right-hand lines
  fill(23, 20, 16);
  strokeWeight(3);
  beginShape();
  vertex(772, -77);
  vertex(655, 85);
  vertex(657, 86);
  vertex(772, -71);
  endShape();
  
  fill(312, 21, 9);
  beginShape();
  vertex(740, 386);
  vertex(772, 361);
  vertex(772, 365);
  vertex(768, 370);
  vertex(770, 375);
  vertex(772, 373);
  vertex(772, 378);
  vertex(747, 396);
  vertex(740, 386);
  endShape();
  
  strokeWeight(2);
  stroke(0);
  line(767, 425, 772, 419);
  
  fill(35, 56, 52);
  beginShape();
  noStroke();
  vertex(772, 149);
  vertex(728, 149);
  vertex(772, 118);
  vertex(772, 149);
  endShape();
  
  //top right circles
  fill(217, 3, 98);
  stroke(0);
  strokeWeight(1);
  arc(667, -139, 100, 100, 0, PI);
  
  fill(354, 20, 20);
  arc(667, -139, 75, 75, 0, PI);
  
  fill(9, 58, 75);
  arc(667, -139, 60, 60, 0, PI);
  
  fill(0, 0, 97);
  arc(667, -139, 55, 55, 0, PI);
  
  //top-left red circle
  fill(2, 81, 76);
  noStroke();
  ellipse(127, -99, 134, 134);
  
  //top-left black circle
  fill(266, 21, 13);
  ellipse(0, -140, 194, 100);
  
  
  //saveFrame("screen.jpg");
  
}


