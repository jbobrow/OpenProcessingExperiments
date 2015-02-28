
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Joo HEe
// ID: 201420114

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

import ddf.minim.*;

Minim minim;
AudioInput input;

float x;
float y;

void setup() {
  //size (displayWidth,displayHeight);
  smooth();

  x = 0;
  y = 40;

  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  background (0);
}


void draw() {
  if (backGround) background(#FA8B8B);
  if (!backGround) background(#8BBEFA);

  if (switchStroke) stroke(0);
  if (!switchStroke) stroke(255);

  float dia = input.mix.level() * 1500;

  x += input.mix.level() * 1000;



  noStroke();
  fill(#DBDBDB, 70);
  rectMode(CENTER);
  rect(width/2, height/2, width-dia, height-dia);
  fill(#FFCFB2,70);
  ellipse(width/2, height/2, dia, dia);
  fill(#FA8D49,70);
  ellipse(width/2, height/2, dia/2, dia/2);
  fill(#FF731C);
  ellipse(width/2, height/2, dia/3, dia/3);
  title();
}

void title() { 
  fill(127);
  textAlign(RIGHT);
  text("CHOI Joo Hee,opposite, Dynamic Media, 2014", width-50, height-20);
}

void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");

  if (key=='q') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='1') switchStroke = !switchStroke;
  if (keyCode==TAB) backGround = !backGround;
}


