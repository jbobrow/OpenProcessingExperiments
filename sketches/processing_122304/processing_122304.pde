
//
// Vector Series
// Started: 28 November 2013
// Written by Izel Maras
// Date : 28 November 2013
// Name : Lying Paper

color[] kenzozine = new color[17];


PImage bitLine;  
int papColor = 0;

void setup() {
  size(500, 335);
  background(255);
  frameRate(20);
  noFill();
  noStroke();
  colorMode(RGB, 280);
  bitLine = loadImage("bitmaptextfile.png");
  kenzozine[0] = color(255); //White
  kenzozine[1] = color(0);   //Black
  kenzozine[2] = color(209, 78, 89); //Rose
  kenzozine[3] = color(207, 74, 142); //Dark Pink
  kenzozine[4] = color(218, 133, 172); //Light Pink
  kenzozine[5] = color(205, 53, 96);//Rouge Pink
  kenzozine[6] = color(25, 154, 220); //Blue
  kenzozine[7] = color(169, 212, 205);
  kenzozine[8] = color(22, 171, 189);
  kenzozine[9] = color(31, 51, 237);
  kenzozine[10] = color(1, 130, 66);
  kenzozine[11] = color(219, 129, 71);
  kenzozine[12] = color(221, 47, 54);
  kenzozine[13] = color(225, 213, 95);
  kenzozine[13] = color(214, 180, 16);
  kenzozine[14] = color(148, 46, 228);
  kenzozine[15] = color(245, 239, 213);
  kenzozine[16] = color(215, 7, 29);
}

void draw() {
  mainVec();
  //image(bitLine, 80, 100);
}

void mainVec() {
  //Mega Background
  fill(155, 171, 169);
  rect(0, 0, 500, 375);
  //Upper Wall
  fill(197, 208, 202);
  beginShape();
  vertex(0, 0);
  vertex(500, 0);
  vertex(501, 219);
  vertex( 0, 100);
  vertex(0, 0);
  endShape(CLOSE);
  //Lower Wall
  fill(246, 249, 248);
  beginShape();
  vertex(0, 102);
  vertex(0, 377);
  vertex(500, 377);
  vertex( 500, 220);
  vertex( 0, 102);
  endShape(CLOSE);
  //Upper Wall Shadow
  fill(197, 208, 208);
  beginShape();
  vertex(149, 0);
  vertex( 500, 0);
  vertex( 503, 219);
  vertex(288, 168);
  vertex(157, 86);
  vertex( 149, 0);
  endShape();
  //Side Shadow
  fill(187, 203, 211);
  beginShape();
  vertex(355, 326);
  vertex(359, 327);
  vertex( 439, 204);
  vertex( 434, 202);
  vertex( 355, 326);
  endShape(CLOSE);
  //Shadow Down
  fill(195, 193, 192, 5);
  beginShape();
  vertex(63, 237);
  vertex( 87, 204);
  vertex( 198, 279);
  vertex( 193, 283);
  vertex( 63, 237);
  endShape(CLOSE);
  //Shadow Up
  fill(123, 68, 65, 5);
  beginShape();
  vertex(79, 235);
  vertex(96, 213);
  vertex(193, 283);
  vertex(79, 235);
  endShape(CLOSE);
  //Right Leaf Shadow
  fill(161, 173, 181);
  beginShape();
  vertex(190, 284);
  vertex( 355, 326);
  vertex( 437, 202);
  bezierVertex( 437, 202, 337, 175, 316, 168);
  bezierVertex( 295, 161, 286, 168, 286, 168);
  vertex(190, 284);
  endShape(CLOSE);
  //Right Leaf
  fill(249, 251, 254);
  beginShape();
  vertex(193, 283);
  bezierVertex( 193, 283, 235, 286, 290, 306);
  bezierVertex( 345, 326, 355, 324, 355, 324);
  vertex( 434, 202);
  bezierVertex( 434, 202, 315, 165, 303, 165);
  bezierVertex( 303, 165, 292, 164, 286, 168);
  bezierVertex( 280, 171, 193, 283, 193, 283);
  endShape(CLOSE);
  //Right Leaf Shadow
  fill(208, 218, 232);
  beginShape();
  vertex(190, 284);
  bezierVertex( 190, 284, 103, 216, 70, 204);
  bezierVertex( 37, 192, 49, 192, 49, 192);
  vertex(157, 86);
  bezierVertex( 157, 86, 277, 134, 287, 166);
  vertex(191, 284);
  endShape(CLOSE);
  //Left Lil Shadow
  fill(155, 163, 199);
  beginShape();
  vertex(193, 283);
  bezierVertex( 193, 283, 186, 262, 170, 252);
  bezierVertex(154, 242, 87, 211, 87, 211);
  bezierVertex( 87, 211, 161, 256, 176, 268);
  bezierVertex( 191, 281, 193, 283, 193, 283);
  endShape(CLOSE);
  //Left Leaf
  fill(243, 245, 251);
  beginShape();
  vertex(193, 283);
  bezierVertex( 189, 256, 49, 192, mouseX, mouseY);
  int m = mouseX+100;
  int n = mouseY-100;
  vertex( m, n);
  vertex( 229, 122); 
  bezierVertex( 276, 147, 285, 163, 288, 168);
  vertex( 193, 283);
  endShape(CLOSE);
  m = constrain(m, 100, 150);
  n = constrain(n, -30, 90);
}

