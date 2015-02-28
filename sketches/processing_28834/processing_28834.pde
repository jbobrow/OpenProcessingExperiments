
import controlP5.*;
import processing.pdf.*;

ControlP5 controlP5;

float cyan;
float magenta;
float yellow;

void setup() {

  size(500,500);
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("cyan", 0,400,10,10, 400,20);
  controlP5.addSlider("magenta", 0,400,10,40, 400,20);
  controlP5.addSlider("yellow", 0,400,10,70, 400,20);

}

void draw() {

  background(0);
  noFill();
  
  stroke(0,158,224,mouseX);
  ellipse(240,235, cyan, cyan);
  
  stroke(226,0,122,mouseX);
  ellipse(260, 255, magenta, magenta);
  
  stroke(255,237,0,mouseX);
  ellipse(235, 260, yellow, yellow);
  
}

void mousePressed() {
  
  strokeWeight(random(1,50));
  
}


void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.tif");}
  
  if (key == 'p') {
    beginRecord(PDF, "zeichnung-####.pdf");
  background(#ffffff);
  }
  
  if (key == 'e') {endRecord(); }
}



