
float xPos = 0;
float diameter = 30;
float angle;


import ddf.minim.*;

Minim minim;
 AudioInput input;

void setup() {
  size(600, 240, P3D);
  background(0);
  colorMode(HSB,width,100,100);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {
  //background (#325A7D);
  float dia = input.mix.level() * 1000;
  
  xPos = xPos + 1;
  
  if (xPos > width + diameter) xPos =-diameter;
  
  translate(xPos,height/2,0);
  rotateX(radians(angle));
  rotateY(radians(mouseY));
  noFill();
  stroke(xPos,100, 100, 30);
  box(200);
  
  translate(0,100,0);
  box(20);
  
  angle++;
  
}  
