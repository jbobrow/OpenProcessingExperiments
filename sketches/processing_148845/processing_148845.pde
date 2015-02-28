
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Joo HEe
// ID: 201420114


boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

float xLast, yLast;
float x, y;
float a, b; 
float dia;

import ddf.minim.*;
Minim minim;
AudioInput input;



void setup() {
  size(600,600);
  smooth();
  background(#EADDC9);
  x = 0;
  y = 40;

  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {
  float dim = input.mix.level() * 100;
  dia = dia*0.9 + dim*0.9;

  if (switchStroke) fill(255-dia, 0, 0);
  if (!switchStroke) fill(255);

  x=lerp(x, pmouseX, 0.1);
  y=lerp(y, mouseY, 0.1); 

  pushMatrix();
  translate(x, y);
  rotate(float(mouseX)/200);
  //rotate(radians(dia));
  //fill(#FA785D, 80);
  noStroke();
  for(int i=-150; i<150; i+=30){
    ellipse(i,0,i/5,i/5);
  }

  popMatrix();
  
  xLast=x;
  yLast=y;

  title();
  

}

void title() {
  fill(127);
  textAlign(RIGHT);
  text("CHOI Joo Hee, circle, Dynamic Media, 2014", width-50, height-20);
}

void keyPressed() {
   if (key=='s') saveFrame("images/frame_#####.jpg");
  if (backGround) background(#EADDC9);
  if (!backGround) background(#555555);
 
  if (key=='q') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
  if (key=='1') switchStroke = !switchStroke;
  if (keyCode==TAB) backGround = !backGround;
}

