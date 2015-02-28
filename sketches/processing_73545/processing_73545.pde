
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
 


void setup(){
  size(600, 600);
  colorMode(HSB);
  background(0);
  smooth();
  noStroke();
  
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 512);


  brushSize = 10;
  brushColor = 100;
  brushSaturation = 255;
  radius = 0;
  radiusIncrease = 6;
  angle = 0;
  angleIncrease = .3;
  

}




void draw(){

  
  

  brushColor = map(input.left.get(50), 0, 1, 0, 255);
  brushColor = map(input.right.level(), 0, .3, 235, 5);
  fill(brushColor, 235, 250);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  ellipse(radius, 0, brushSize, brushSize);
  popMatrix();
  
  
  
  if(angle > 2*PI){
    radius += radiusIncrease;
    radiusIncrease -= .01;
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


void keyPressed(){
  if(key == ' '){
    background(0);
    radius = 0;
    radiusIncrease = 5;
    angle = 0;
    angleIncrease = .3;
  }
}

void stop(){
  input.close();
  minim.stop();
  super.stop();
}




