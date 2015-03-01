
/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: MinKyung Kim
 ID: 201420065
 */

float theta1 = 0.0;
float M;
PImage img;

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

import ddf.minim.*;
Minim minim;
AudioInput input;

void setup() {
  size (600, 600, P3D);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {

  background(#eef9ff);
  lights();

  if (backGround) background(#eef9ff);
  if (!backGround) background(#b6eeef);
  if (switchStroke) stroke(0);  
  if (!switchStroke) stroke(255);

  float mic = input.mix.level() * 1000;
  M = M*0.9 + mic*0.8;  

  pushMatrix();
  translate(0, 0);
  fill(#2c3a43);
  quad(119, 300, 362, 300, 333, 260, 148, 260);
  quad(150, 170, 335, 169, 242, 128, 150, 170);
  fill(#eef0e2);
  quad(150, 170, 335, 169, 333, 260, 148, 260);
  quad(119, 300, 362, 300, 362, 422, 119, 422);
  stroke(0);
  strokeWeight(2);
  line(245, 30, 242, 128);
  popMatrix();

  pushMatrix();
  translate(243, 58);
  rotateY(theta1);
  ellipse(0, 0, 50, 50);
  popMatrix();

  theta1 += 0.04;

  pushMatrix();
  translate(200, 218);
  fill(#f7ec82);
  rotateY(radians(mouseX));
  box(50, 70, -50);
  popMatrix();

  pushMatrix();
  translate(280, 218);
  rotateY(radians(mouseX));
  box(50, 70, -50);
  popMatrix();

  pushMatrix();
  fill(255, 0, 0);
  translate(230, 311);
  rotateX(radians(M));
  rect(0, 0, 25, 25);
  popMatrix();

  pushMatrix();
  fill(#eef0e2);
  translate(0, 0);
  rect(175, 421, 35, M);
  rect(268, 421, 35, M);
  fill(#04c2d8);
  rect(450, 165, 30, M);
  rect(450, 215, 30, M);
  rect(450, 265, 30, M);
  rect(450, 315, 30, M);
  rect(450, 365, 30, M);
  rect(450, 415, 30, M);
  popMatrix();

  title();
}

void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='1') switchStroke = !switchStroke;

  /* 
   if (keyCode==UP) yPos += 0.1;
   if (keyCode==DOWN) yPos -= 0.1;
   if (keyCode==LEFT) xPos += 0.1;
   if (keyCode==RIGHT) xPos -= 0.1;
   */
  if (keyCode==TAB) backGround = !backGround;
}

void title() { 
  fill(127);
  textAlign(RIGHT);
  text("Minkyung Kim, untitled, Dynamic Media, 2014", width-50, height-20);
  textAlign(LEFT);
  text("TAB - color change", width-580, height-20);
}

