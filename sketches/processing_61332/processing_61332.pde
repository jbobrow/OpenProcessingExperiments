

import controlP5.*;
import processing.pdf.*;

float rad = 0;
ControlP5 controlP5;

float speed=5;
float radius=45;
float angle=450;
float size=10;

float xpos = 0;
float ypos = 0;


void setup() {
  size(1000, 1000);
  smooth();

  controlP5 = new ControlP5(this);
  controlP5.addSlider("speed", 0, 10, 5, 10, 10, 200, 10);
  controlP5.addSlider("radius", 0, 360, 180, 10, 30, 200, 10);
  controlP5.addSlider("size", 0, 100, 50, 10, 50, 200, 10);
}

void draw() {
  stroke(205, 0, 20);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < speed; i++) {
    xpos = cos(radians(angle))*radius;
    ypos = sin(radians(angle))*radius;
    ellipse(xpos, ypos, size, size);
    fill(231, 177, 93);
    angle += 360/speed;
  }
  popMatrix();
}

void keyPressed() {
  if (key== 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  }

  if (key=='b'||key=='B')
  {
    beginRecord(PDF, "zeichnung.pdf");
  }

  if (key=='e'||key=='E')
  {
    endRecord();
    exit();
  }
} 


