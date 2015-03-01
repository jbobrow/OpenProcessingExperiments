

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioInput input;
FFT fft;
 
 
float brushSize;
float brushColor;
float brushSaturation;
float radius;
float radiusIncrease;
float angle;
float angleIncrease;
  float frameRate;
 
 
void setup(){
  size(1300, 800);
  colorMode(RGB);
  background(255);
  smooth();
  noStroke();
   
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 512);
 
 
  brushSize = 12;
  brushColor = 250;
  brushSaturation = 255;
  radius = 7;
  radiusIncrease = 9;
  angle = 0;
  angleIncrease = .3;
  frameRate = 10;
 
}
 
 
 
 
void draw(){
 
   
   
 
  brushColor = map(input.left.get(50), 0, 1, 0, 255);
  brushColor = map(input.right.level(), 0, .3, 235, 5);
  fill(brushColor, 12, 0, 255);
   
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  ellipse(radius, 0, brushSize, brushSize);
  popMatrix();
   
   
   
  if(angle > 2*PI){
    radius += radiusIncrease;
    radiusIncrease -= .05;
    angle = 0;
  }
   
  if(radius > 30){
    angleIncrease = .1;
  }
  if(radius > 90){
    angleIncrease = .05;
  }
  if(radius > 170){
    angleIncrease = .03;
  } 
  if(radius > 250){
    angleIncrease = .01;
  }
   
  angle += angleIncrease;
   
}
 
 





void keyPressed() {
   saveFrame("images/artwork-####.png");
}

void stop(){
  input.close();
  minim.stop();
  super.stop();
}



