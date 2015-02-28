
import controlP5.*;

ControlP5 controlP5;

float BallSize=200;
float x=300;
float y=300;
float a=300;
float gelb=400;


void setup(){
  size(600,600);
  smooth();
  controlP5 = new ControlP5(this);
  controlP5.addSlider("BallSize", 50, 400, 10, 10, 200, 10);
  controlP5.addSlider("x", 100, 800, 10, 30, 200, 10);
  controlP5.addSlider("y", 100, 800, 10, 50, 200, 10);
  controlP5.addSlider("a", 100, 800, 10, 70, 200, 10);
  controlP5.addSlider("gelb", 100, 400, 10, 90, 200, 10);
  
}

void draw(){
 //stroke(20);
 background(250);
 fill(255,217,15, gelb);
 ellipse(300, 300, BallSize, BallSize);
 fill(250);
  triangle(x,y,80,a,a,100);
 //bezier(a, b, 10, 50, 250, 300, 400, 400);
}

