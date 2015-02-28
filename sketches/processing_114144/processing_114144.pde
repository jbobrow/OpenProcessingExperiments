
// the Rotating Miro, little pet, 2013/10/08
// Stella Wang, tainan

/* refer to Processong.org/Example/Reach 1, the code from Keith Peters:
 The arm follows the position of the mouse by calculating the angles with atan2().
 */

//float segLength = 40;
float x, y, x2, y2;

void setup() {
  size(560, 600);
  //strokeWeight(2.0);
  //stroke(255, 100);

  x = width/2;
  y = height/2;
  //  x2 = x;
  //  y2 = y;
}

void draw() {
  //  background(140);
  background(155-mouseX/8);

  float dx = mouseX - x;
  float dy = mouseY - y;
  float angle1 = atan2(dy, dx);  

  //float tx = mouseX - cos(angle1) * segLength;
  //float ty = mouseY - sin(angle1) * segLength;
  //dx = tx - x2;
  //dy = ty - y2;
  //float angle2 = atan2(dy, dx);  
  //x = x2 + cos(angle2) * segLength;
  //y = y2 + sin(angle2) * segLength;

  segment(x, y, angle1); 
  //segment(x2, y2, angle2);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  //  line(0, 0, segLength, 0);

  //line 1
  noFill();
  stroke(mouseX/10 * mouseY/120 + 30);
  smooth();
  strokeWeight(1);
  beginShape();
  curveVertex(23, 199);
  curveVertex(10, 215);    //start point
  curveVertex(8, 239);
  curveVertex(18, 249);
  curveVertex(26, 242);
  curveVertex(30, 226);
  curveVertex(36, 206);
  endShape();

  //line 2
  noFill();
  stroke(mouseX/10 * mouseY/120 + 30);
  strokeWeight(1);
  beginShape();
  curveVertex(29, 235);
  curveVertex(30, 226);
  curveVertex(33, 218);
  curveVertex(39, 211);
  curveVertex(47, 209);
  curveVertex(59, 209);
  curveVertex(78, 216);
  endShape();

  //line 3m
  noFill();
  stroke(mouseX/10 * mouseY/120 + 30);
  strokeWeight(1);
  beginShape();
  curveVertex(34, 210);
  curveVertex(59, 209);
  curveVertex(67, 211);
  curveVertex(78, 216);
  curveVertex(86, 222);
  curveVertex(96, 234);
  curveVertex(101, 247);
  endShape();

  //line 4m
  noFill();
  stroke(mouseX/10 * mouseY/120 + 30);
  strokeWeight(1);
  beginShape();
  curveVertex(94, 222);
  curveVertex(96, 234);
  curveVertex(111, 249);
  curveVertex(126, 244);
  curveVertex(130, 233);    //bbrightoutpoint
  curveVertex(124, 217);    //bbcore
  curveVertex(103, 205);
  endShape();

  //line 5m
  noFill();
  stroke(mouseX/10 * mouseY/120 + 30);
  strokeWeight(1);
  beginShape();
  curveVertex(128, 225);
  curveVertex(124, 217);    //bbcore
  curveVertex(117, 208);
  curveVertex(104, 199);
  curveVertex(91, 193);  
  curveVertex(73, 189);
  curveVertex(53, 188);
  endShape();

  //line 6
  noFill();
  stroke(mouseX/10 * mouseY/120 + 30);
  strokeWeight(1);
  beginShape();
  curveVertex(94, 199);
  curveVertex(73, 189);   
  curveVertex(57, 188);    //butterrightcross
  curveVertex(40, 190);    //butterflycore
  curveVertex(22, 201);
  curveVertex(10, 215);    //start point
  curveVertex(6, 244);
  endShape();

  //shapeR2a
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(7, 227);
  curveVertex(15, 210); 
  curveVertex(17, 206);
  curveVertex(21, 201);
  curveVertex(29, 195);
  curveVertex(40, 190);    //butterflylefttop
  curveVertex(61, 185);
  endShape();
  //R2b
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(0, 217);
  curveVertex(15, 210); 
  curveVertex(18, 211);
  curveVertex(24, 207);
  curveVertex(32, 199);
  curveVertex(40, 190);    //butterflylefttop
  curveVertex(52, 173);
  endShape();
  //R2c
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(38, 198);
  curveVertex(40, 190);    //butterflylefttop
  curveVertex(46, 185);
  curveVertex(50, 183);
  curveVertex(53, 184);
  curveVertex(56, 188); 
  curveVertex(62, 204);
  endShape();
  //line
  noFill();
  stroke(mouseX/10 * mouseY/120 + 30);
  line(56, 188, 65, 204);


  //shapeR1
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(30, 226);
  curveVertex(10, 214);    //start point
  curveVertex(5, 207);
  curveVertex(8, 201);
  curveVertex(15, 198);
  curveVertex(21, 201);    //butterflylefttop
  curveVertex(31, 218);
  endShape();
  //red
  fill(213, 44, 5);
  stroke(213, 44, 5);
  beginShape();
  curveVertex(4, 199);
  curveVertex(10, 214);    //start point
  curveVertex(19, 215);
  curveVertex(22, 213);
  curveVertex(24, 208);
  curveVertex(21, 201);    //butterflylefttop
  curveVertex(12, 196);
  endShape();
  //cutcircleline
  noFill();
  stroke(0);
  beginShape();
  curveVertex(7, 224);
  curveVertex(10, 214);    //start point
  curveVertex(12, 210);
  curveVertex(14, 206);
  curveVertex(17, 204);
  curveVertex(21, 201);    //butterflylefttop
  curveVertex(28, 197);
  endShape();


  //shapeR3
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(50, 237);
  curveVertex(109, 202);
  curveVertex(127, 199);
  curveVertex(141, 207);
  curveVertex(142, 222);
  curveVertex(130, 233);    //bbrightoutpoint
  curveVertex(104, 227);
  endShape();
  //red
  fill(213, 44, 5);
  stroke(213, 44, 5);
  beginShape();
  curveVertex(105, 219);
  curveVertex(119, 210);  
  curveVertex(126, 209);
  curveVertex(132, 212);
  curveVertex(133, 218);
  curveVertex(128, 224);  
  curveVertex(106, 233);
  endShape();
  //blue
  fill(43, 56, 148);
  stroke(43, 56, 148);
  beginShape();
  curveVertex(135, 194);
  curveVertex(109, 202);
  curveVertex(103, 213);
  curveVertex(109, 226);
  curveVertex(119, 232);
  curveVertex(130, 233);    //bbrightoutpoint
  curveVertex(148, 229);
  endShape();
  //blue2
  fill(43, 56, 148);
  stroke(0);
  beginShape();
  curveVertex(94, 193);
  curveVertex(109, 202);
  curveVertex(118, 210);
  curveVertex(126, 219);
  curveVertex(129, 226);
  curveVertex(130, 233);    //bbrightoutpoint
  curveVertex(125, 249);
  endShape();
  //blacksmall
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(126, 209);
  curveVertex(119, 210);  
  curveVertex(115, 217);
  curveVertex(117, 222);
  curveVertex(122, 225);
  curveVertex(128, 224);  
  curveVertex(134, 218);
  endShape();
  //cutcircleline

    popMatrix();
}

