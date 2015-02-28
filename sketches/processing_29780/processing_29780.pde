
import controlP5.*;

ControlP5 controlP5;

float o=400;
float p=200;
float i=800;
float u=300;
float m=400;
float t=600;
float e=100;
float a=400;

void setup(){
  size(700,700);
  smooth();
  controlP5 = new ControlP5(this);
  controlP5.addSlider("o", 400, 800, 10, 10, 200, 10);
  controlP5.addSlider("p", 400, 800, 10, 30, 200, 10);
  controlP5.addSlider("i", 400, 800, 10, 50, 200, 10);
  controlP5.addSlider("u", 400, 800, 10, 70, 200, 10);
  controlP5.addSlider("m", 400, 800, 10, 90, 200, 10);
  controlP5.addSlider("t", 400, 800, 10, 110, 200, 10);
  controlP5.addSlider("e", 400, 800, 10, 130, 200, 10);
  controlP5.addSlider("a", 400, 800, 10, 150, 200, 10);
}

void draw(){
 stroke(100);
 background(250);
 fill(0,170,230,80);
 bezier(400, 400, i, u, 250, 300, 400, 400);
 fill(210,140,190,80); 
 bezier(400, 400, o, p, 100, 600, 400, 400);
  fill(120,250,0,80); 
 bezier(400, 400, m, t, 500, 400, 400, 400);
 fill(150,0,250,80); 
 bezier(400, 400, e, a, 200, 600, 400, 400);
}

