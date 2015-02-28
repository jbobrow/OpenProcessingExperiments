
import processing.pdf.*;
boolean recording;
PGraphicsPDF pdf;
float triPoint, x, y;

void setup() {
  size(500, 500);
  background(230);
  smooth();
  frameRate(24);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");
}

void draw() {
}

void mouseDragged() {
  pushMatrix();
  fill(random(255), random(255), random(255), random(255));
  noStroke();
  translate(mouseX, mouseY);
  rotate(radians(random(360)));
  scale(random(-2.00, 3.00));
  triangle(x, y, 10, x, y, 10);
  popMatrix();
}

void mouseMoved() {
  pushMatrix();
  noFill();
  stroke(random(255));
  translate(mouseX, mouseY);
  rotate(radians(random(360)));
  scale(random(-2.00, 2.00));
  triangle(x, y, 10, x, y, 10);
  stroke(random(255), random(255), random(255), random(255));
  line(x+random(-2.00, 2.00), y+random(-2.00, 2.00), x+random(20), y+random(20));
  popMatrix();
}


void keyPressed() {
  if (key == ' ') {
    background (230);
  }

  /*Uncomment this if you want to save as pdf
   if (key == 'r') { 
   if (recording) {
   endRecord();
   println("Recording stopped.");
   recording = false;
   } else {
   beginRecord(pdf);
   println("Recording started.");
   recording = true;
   }
   } else if (key == 'q') {
   if (recording) {
   endRecord();
   }
   exit();
   }*/
}



