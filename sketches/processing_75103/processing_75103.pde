
import processing.opengl.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

int numTimes = 2000;
float incSteps = 360;
float anginc = TWO_PI/incSteps;
float rad = 50;
float p = 0.5;
float q = -0.5;
float lastx=0;
float lasty=0;

void setup(){
  size(600, 600, OPENGL);
  smooth();
  stroke(250);
  //fill(200);
  noFill();
  cam = new PeasyCam(this, 0, 0, 0, 200);
}

void draw(){
  background(0);
  noFill();
  box(100);
  //pushMatrix();
  //translate(width/2, height/2);
  p = map(mouseX, 0, width, -5, 5);
  q = map(mouseY, 0, height, -5, 5);
  beginShape();
  for (int i=0; i<numTimes; i++){
    float xpos = cos(i*anginc) * sin(p*i*anginc);
    float ypos = sin(i*anginc) * cos(q*i*anginc);
    float zpos = sin(p*i*anginc) * cos(q*i*anginc);
    curveVertex(xpos*rad, ypos*rad, zpos*rad);
    //ellipse(xpos*rad, ypos*rad, 1,1);
  }
  endShape();
  //popMatrix();
  cam.beginHUD();
  fill(250);
  text("p= " + p, 120, 130);
  text("q= " + q, 120, 150);
  cam.endHUD();
}

