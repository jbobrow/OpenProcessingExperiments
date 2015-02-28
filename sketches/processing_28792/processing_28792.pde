
import controlP5.*;
import processing.pdf.*;

ControlP5 controlP5;

float variable;
float variable2;
float farbe;
float variable3;
float variable4;
float variable5;
float variable6;

void setup() {
  size(400, 400);
  smooth();
 // fill(random(155),random(255),random(255));

  controlP5 = new ControlP5(this);
  
  controlP5.addSlider("variable", 10, 390, 80, 10,10, 200, 10);
  controlP5.addSlider("variable2", 50, 350, 80, 10,25, 200, 10);
  controlP5.addSlider("variable3", 100, 200, 80, 10,40, 200, 10);
  controlP5.addSlider("variable4", 200, 350, 80, 10,55, 200, 10);
  controlP5.addSlider("variable5", 150, 390, 80, 10,70, 200, 10);
  controlP5.addSlider("variable6", 30, 350, 80, 10,85, 200, 10);
   
}

void draw() {
  background(0);
  fill(190);
  stroke(0);
  beginShape(TRIANGLES);
  vertex(height/2, width/2);
  vertex(variable3, variable4-100);
  vertex(variable5, variable6);
  
  vertex(height/2, width/2);
  vertex(variable4, variable3);
  vertex(variable2+50, variable);
  
  vertex(height/2, width/2);
  vertex(variable2, variable5/2);
  vertex(variable/3, variable4);
  endShape();

 // ellipse(width/2, height/2, variable2, variable2);
 // triangle(variable, variable2+20, width/2, height/2, variable2, variable-50);
 // triangle(variable3, variable4/2, width/2, height/2, variable4, variable3*2);
 // triangle(variable5, variable6*2, width/2, height/2, variable6, variable5/2);
}


void keyPressed() {
  if (key == 's') { 
    saveFrame("bild-####.png");
  }
  
  if (key == 'p') { 
   println("start recording");
   beginRecord(PDF,"zeichnung.pdf");
   //colorMode(HSB, 100);
   background(0,0,0);
  }
  
  if (key == 'e') { 
    endRecord();
  }
}

