
//using if (H-18>0||H-6<0)control starshine in the night.(shineStars)
//using 12-H>0 means A.M,12-H<0 means P.M (dutriangle)
//using m*1.6 control transparency of midle component,in the late of every hours,they will be seen.
//by Xinhan Yen,E-mail:archi730@hotmail.com
float bstarX1, bstarY1, bstarX2, bstarY2, bstarX2, bstarY2;
float m1, m2, m3;
float centerX, centerY;
int a, S, M, H, T;
int S=second();
int M=minute();
int H=hour();
//test interger
int T=22;
void setup() {
  size(295, 295);
  background(202, 198, 196);
  smooth();
  drawshineStars();
  strokeWeight(2);
  bstarX1 =265;
  bstarY1 =271;
  bstarX2 =267;
  bstarY2 =11;
  bstarX3 =110;
  bstarY3 =191;
  //center(X,Y)
  centerX =(min(bstarX1, bstarX2, bstarX3)+max(bstarX1, bstarX2, bstarX3))/2;
  centerY =(min(bstarY1, bstarY2, bstarY3)+max(bstarY1, bstarY2, bstarY3))/2;
  //find m of starting angle
  m1= atan2(271-centerY, 265-centerX);
  m2= atan2(11-centerY, 267-centerX);
  m3= atan2(110-centerY, 191-centerX);
  int S=second();
  int M=minute();
  int H=hour();
}
void draw() {
  background(202, 198, 196);
  fill();
  strokeWeight(1);


  float ta =2*PI/60*second();
  int a=random(1, 3);

  drawLittleStar();

  strokeWeight(1);
  //
  int a=random(1, 3);

  //longcurve component MID
  beginShape();
  fill(32, 33, 37);
  strokeWeight(1);
  vertex(91, 106);
  bezierVertex(91, 138, 84, 148, 75, 168);
  vertex(75, 168);
  bezierVertex(44, 150, 51, 104, 91, 106);
  endShape();



  beginShape();
  fill(40, 31, 150, M*1.6);
  strokeWeight(1);
  vertex(91, 105);
  bezierVertex(91, 138, 84, 148, 75, 168);
  vertex(75, 168);
  bezierVertex(137, 177, 136, 119, 91, 105);
  endShape();

  beginShape();
  fill(163, 189, 60, M*1.6);
  strokeWeight(1);
  vertex(117, 121);
  bezierVertex(132, 87, 204, 92, 185, 159);
  vertex(185, 159);
  bezierVertex(153, 221, 88, 172, 117, 121);
  endShape();

  fill(40, 31, 150, M*1.6);
  strokeWeight(0);
  ellipse(184, 205, 94, 88);


  beginShape();
  fill(32, 33, 37);
  strokeWeight(1);
  vertex(185, 159);
  bezierVertex(171, 184, 166, 188, 142, 186);
  bezierVertex(146, 172, 162, 158, 185, 159);
  endShape();

  beginShape();
  fill(32, 33, 37);
  strokeWeight(1);
  vertex(117, 122);
  bezierVertex(126, 131, 127, 149, 112, 162);
  bezierVertex(112, 154, 104, 142, 117, 122);
  endShape();

  beginShape();
  fill(32, 33, 37);
  strokeWeight(1);
  vertex(184, 116);
  bezierVertex(172, 125, 174, 140, 189, 146);
  bezierVertex(188, 135, 187, 120, 184, 116);
  endShape();
  strokeWeight(1);
  noFill();
  bezier(184, 116, 187, 112, 190, 110, 196, 110);
  bezier(189, 146, 202, 148, 202, 146, 210, 142);
  fill(32, 33, 37);
  arc(198, 246, 14, 14, -0.14, 2.83);
  fill(215, 205, 111);
  arc(198, 246, 14, 14, 2.83, 6);
  beginShape();
  fill(186, 37, 30);
  strokeWeight(1);
  vertex(180, 295);
  bezierVertex(193, 278, 257, 279, 270, 295);
  vertex(270, 295);
  vertex(180, 295);
  endShape(CLOSE);
  line(207, 282, 198, 246);
  fill(32, 33, 37);
  arc(207, 282, 14, 14, -0.14, 2.83);
  fill(75, 95, 201);
  arc(207, 282, 14, 14, 2.83, 6);
  //
  line(110, 75, 133, 79);
  line(119, 279, 128, 260);
  line(80, 0, 45, 5);
  line(80, 0, 81, 25);
  line(271, 166, 295, 166);
  //dutriangle
  fill(12-H);
  beginShape();
  vertex(11, 89);
  vertex(27, 89);
  vertex(21, 105);
  endShape(CLOSE);
  beginShape();
  vertex(21, 105);
  vertex(12, 123);
  vertex(31, 120);
  endShape(CLOSE);
  beginShape();
  vertex(37, 191);
  vertex(30, 181);
  vertex(43, 174);
  endShape(CLOSE);
  beginShape();
  vertex(37, 192);
  vertex(37, 192);
  vertex(29, 209);
  vertex(46, 204);
  endShape(CLOSE);
  beginShape();
  vertex(35, 256);
  vertex(31, 245);
  vertex(42, 244);
  endShape(CLOSE);
  beginShape();
  vertex(35, 256);
  vertex(27, 272);
  vertex(44, 268);
  endShape(CLOSE);
  beginShape();
  vertex(229, 148);
  vertex(229, 136);
  vertex(217, 141);
  endShape(CLOSE);
  beginShape();
  vertex(229, 148);
  vertex(231, 173);
  vertex(248, 162);
  endShape(CLOSE);
  //circle
  fill(1);
  ellipse(162, 277, 26, 24);
  //longcurve II
  noFill();
  strokeWeight(1);
  beginShape();
  curveVertex(295, 0);
  curveVertex(295, 0);
  curveVertex(285, 37);
  curveVertex(280, 65);
  curveVertex(279, 72);
  curveVertex(279, 110);
  curveVertex(281, 127);
  curveVertex(282, 147);
  curveVertex(284, 156);
  curveVertex(287, 166);
  curveVertex(295, 180);
  curveVertex(295, 180);
  endShape();
  //longcurve II component
  fill(134, 40, 32);
  strokeWeight(1);
  beginShape();
  vertex(295, 0);
  vertex(295, 36);
  vertex(285, 37);
  vertex(295, 0);
  endShape(CLOSE);
  fill(35, 25, 123);
  strokeWeight(1);
  beginShape();
  vertex(295, 68);
  vertex(264, 60);
  vertex(295, 84);
  endShape(CLOSE);
  fill(224, 213, 52);
  strokeWeight(1);
  beginShape();
  vertex(280, 64);
  vertex(264, 60);
  vertex(279, 72);
  endShape(CLOSE);
  fill(196, 208, 124);
  strokeWeight(1);
  arc(280, 118, 14, 16, -HALF_PI, HALF_PI);
  fill(38, 34, 35);
  strokeWeight(1);
  arc(280, 118, 14, 16, HALF_PI, 3*HALF_PI);
  fill(38, 46, 143);
  strokeWeight(0);
  arc(283, 147, 14, 14, -HALF_PI, HALF_PI);
  fill(226, 221, 104);
  strokeWeight(1);
  arc(283, 147, 14, 14, HALF_PI, 3*HALF_PI);
  //spiral line
  beginShape();
  strokeWeight(1);
  noFill();
  curveVertex(231, 8);
  curveVertex(231, 8);
  curveVertex(202, 41);
  curveVertex(191, 70);
  curveVertex(191, 70);
  endShape();
  //beziercurve
  beginShape();
  strokeWeight(1);
  noFill();
  vertex(191, 70);
  bezierVertex(186, 115, 221, 103, 225, 106);
  vertex(225, 106);
  bezierVertex(273, 105, 268, 58, 226, 51);
  vertex(226, 51);
  bezierVertex(202, 55, 193, 83, 220, 88);
  vertex(220, 88);
  bezierVertex(252, 84, 238, 75, 227, 72);
  endShape();
  beginShape();
  strokeWeight(1);
  noFill();
  curveVertex(231, 8);
  curveVertex(231, 8);
  curveVertex(258, 31);
  curveVertex(285, 37);
  curveVertex(285, 37);
  endShape();
  //spiral component
  fill(131, 157, 143);
  strokeWeight(1);
  arc(231, 8, 24, 24, -QUARTER_PI, QUARTER_PI);
  fill(25, 25, 27);
  strokeWeight(0);
  arc(231, 8, 24, 24, QUARTER_PI, 3*QUARTER_PI);
  fill(224, 228, 141);
  strokeWeight(1);
  arc(231, 8, 24, 24, 3*QUARTER_PI, 5*QUARTER_PI);
  fill(25, 25, 27);
  strokeWeight(1);
  arc(231, 8, 24, 24, 5*QUARTER_PI, 7*QUARTER_PI);
  //longcurve componentDN
  beginShape();
  fill(163, 189, 60);
  strokeWeight(1);
  vertex(64, 226);
  bezierVertex(93, 193, 121, 249, 76, 257);
  endShape();
  beginShape();
  fill(40, 31, 124);
  strokeWeight(1);
  vertex(64, 226);
  bezierVertex(51, 247, 70, 258, 76, 257);
  endShape();

  //longcurve component TOP (71, 53)
  noFill();
  bezier(71, 53, 80, 63, 95, 65, 95, 64);
  beginShape();
  fill(40, 31, 150);
  strokeWeight(1);
  vertex(95, 64);
  bezierVertex(120, 66, 152, 27, 155, 3);
  vertex(155, 3);
  bezierVertex(131, 15, 110, 10, 80, 0);
  endShape();
  //dutriangle (152,20)
  fill(1);
  strokeWeight(2);
  beginShape();
  vertex(152, 20);
  vertex(156, 0);
  vertex(140, 0);
  endShape();
  beginShape();
  vertex(152, 20);
  vertex(175, 54);
  vertex(175, 54);
  bezierVertex(163, 63, 148, 70, 134, 62);
  endShape();
  fill(172, 76, 51);
  strokeWeight(0);
  beginShape();
  vertex(152, 20);
  vertex(157, 3);
  vertex(145, 8);
  endShape();
  line(156, 4, 162, 0);
  //else component
  noFill();
  strokeWeight(1);
  bezier(50, 295, 54, 281, 72, 270, 81, 279);
  bezier(70, 295, 78, 290, 80, 290, 84, 295);
  //blanc
  endShape();
  beginShape();
  fill(202, 198, 196);
  stroke(202, 198, 196);
  vertex(80, 0);
  bezierVertex(95, 27, 96, 38, 95, 64);
  vertex(95, 64);
  endShape(CLOSE);
  //longcurve I
  noFill();
  strokeWeight(1);
  beginShape();
  stroke(2);
  curveVertex(80, 0);
  curveVertex(80, 0);
  curveVertex(95, 31);
  curveVertex(95, 64);
  curveVertex(95, 86);
  curveVertex(91, 105);
  curveVertex(86, 137);
  curveVertex(75, 168);
  curveVertex(66, 190);
  curveVertex(64, 224);
  curveVertex(70, 241);
  curveVertex(76, 256);
  curveVertex(98, 295);
  curveVertex(98, 295); 
  endShape();
  //MLS1  ,S is for mark.
  float tr = dist(bstarX1, bstarY1, centerX, centerY);
  float tx = tr*cos(m1+ta)+centerX;
  float ty = tr*sin(m1+ta)+centerY;
  drawMLS(tx, ty, S, S);
  //MLS2
  float tr = dist(bstarX2, bstarY2, centerX, centerY);
  float tx = tr*cos(m2+ta)+centerX;
  float ty = tr*sin(m2+ta)+centerY;
  drawMLS(tx, ty, S, S);
  //MLS3  
  float tr = dist(bstarX3, bstarY3, centerX, centerY); 
  float tx = tr*cos(m3+ta)+centerX;
  float ty = tr*sin(m3+ta)+centerY;

   
 
  
  drawshineStars();

 
  }
  void drawLittleStar() {
    fill(1);
    ellipse(45, 5, 5, 5);
    ellipse(81, 25, 5, 5);
    ellipse(71, 53, 5, 5);
    ellipse(110, 75, 5, 5);
    ellipse(133, 79, 5, 5);
    ellipse(128, 260, 5, 5);
    ellipse(271, 166, 5, 5);
    ellipse(119, 279, 8, 8);
    ellipse(227, 72, 7, 7);
    ellipse(162, 275, 18, 18);
    ellipse(289, 254, 26, 26);
  }
void drawMLS(int posX, int posY, int r, int r) {
  int S=second()*1.2;
  fill(196, 208, 124, 102-S/3);
  ellipse(posX, posY, S, S);
}
void drawshineStars() {
  int a=random(1, 3);
  if (H-18>0||H-6<0) {
    strokeWeight(0+a);
    stroke(30);
  }
  //mi I
  line(25, 23, 25+12, 23+46);
  line(17, 55, 17+29, 55-13);
  line(17, 40, 17+32, 40+15);
  line(37, 27, 37-11, 27+42);
  //mi II
  line(234, 122, 234+27, 122);
  line(250, 107, 250-3, 107+31);
  line(236, 111, 236+23, 111+21);
  line(257, 110, 257-21, 110+23);
  //mi III
  line(255, 169, 255+4, 169+63);
  line(234, 201, 234+48, 201-1);
  line(242, 191, 242+29, 191+24);
  line(270, 185, 270-29, 185+30);
}



