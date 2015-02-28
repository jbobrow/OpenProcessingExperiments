

import processing.opengl.*;
import javax.media.opengl.GL; 

import controlP5.*;

ControlP5 controlP5;
int alphared = 0;
int alphablue = 0;
int alphagreen = 0;


GL gl;  

void setup() {
  size(300, 600, OPENGL); 

  controlP5 = new ControlP5(this);
  // add a vertical slider
  controlP5.addSlider("alphared", 0, 255, 0, width/2-80, 400, 10, 100);
  Slider s1 = (Slider)controlP5.controller("alphared");
  s1.setNumberOfTickMarks(10); 

  controlP5.addSlider("alphablue", 0, 255, 0, width/2, 400, 10, 100);
  Slider s2 = (Slider)controlP5.controller("alphablue");
  s2.setNumberOfTickMarks(10);

  controlP5.addSlider("alphagreen", 0, 255, 0, width/2+80, 400, 10, 100);
  Slider s3 = (Slider)controlP5.controller("alphagreen");
  s3.setNumberOfTickMarks(10);

  gl=((PGraphicsOpenGL)g).gl;      
  noStroke();
}

void draw() { 
  background(0);

  float x = 0;    
  x = 0;

  ellipseMode(CENTER);

  //  additive blending
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);    
  fill(255, 0, 0, alphared);
  ellipse(width/2-50, 250, 150, 150);

  fill(0, 255, 0, alphagreen);
  ellipse(width/2+50, 250, 150, 150);

  fill(0, 0, 255, alphablue);
  ellipse(width/2, 175, 150, 150);
}


