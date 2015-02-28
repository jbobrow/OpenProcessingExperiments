

import processing.pdf.*;

PShape e;
PShape b;

void setup () {
  size(500, 500);
  background (30,94,10);
  e = loadShape("ente.svg");
  b = loadShape("blume.svg");
  smooth();
  shape(e, 100, 100, 400, 300);
  shape(b, 60,60,200,200);
}


void draw() {
  float d = dist(pmouseX,pmouseY,mouseX,mouseY);
  translate (mouseX,mouseY);
  rotate(radians(winkel));
  winkel = winkel + 10;
  if(mousePressed) {
  shape(e);
  shape(b);
  } 
}

void mousePressed () {
  e.rotate(0.6);
  e.scale(0.4);
}

float winkel = 0;

void keyPressed() {
  if (key == 'b') {
  beginRecord(PDF, "exercise###.pdf");
  }
  if (key == 'e') {
  endRecord();
  }
}
