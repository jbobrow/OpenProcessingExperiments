


import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

ArrayList lines;
float envSize = 300;
int linesep=30;


void setup(){
 background(255);
 size(600, 600,P3D);
 smooth();
 cam = new PeasyCam(this,300,300,300,1000);
 
}

void draw(){
 background(255);
for(int countx=0; countx<width/linesep;countx++){
  for(int county=0;county<width/linesep;county++){
      stroke(0);
  strokeWeight(0.5);
  line(linesep+(countx*linesep),0,linesep+(county*linesep),linesep+(countx*linesep),height,linesep+(county*linesep));
  }
}
for(int countx=0; countx<width/linesep;countx++){
  for(int county=0;county<width/linesep;county++){
      stroke(0);
  strokeWeight(0.5);
  line(0,linesep+(countx*linesep),linesep+(county*linesep),height, linesep+(countx*linesep),linesep+(county*linesep));
  }
}
for(int countx=0; countx<width/linesep;countx++){
  for(int county=0;county<width/linesep;county++){
      stroke(0);
  strokeWeight(0.5);
  line(linesep+(countx*linesep),linesep+(county*linesep),0, linesep+(countx*linesep),linesep+(county*linesep),height);
  }
}
 noFill();
  stroke(0);
  strokeWeight(0.5);
  translate(300,300,300);
  //box(envSize*2);
}

