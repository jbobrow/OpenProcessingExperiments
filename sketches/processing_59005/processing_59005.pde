
PShape s;
PImage bg;
import processing.pdf.*;
float bewegung =-200;
float radius=0;


void setup() {
 size (600,600);
 bg = loadImage("bg.png");
  background(bg);
  
}

void draw() {
 s = loadShape("OWL.svg");
 float d = dist(pmouseX, pmouseY, mouseX, mouseY);

  
if (mousePressed == true) {
      
      translate(mouseX, mouseY);
    
    stroke(255);
    strokeWeight(15);
    radius = radius + bewegung;
    rotate (radians(radius));
    shape(s, 0,0,100,100);   
  }

  
}







void keyPressed() {
    if (key == 'b') {
    beginRecord(PDF, "exercise###.pdf");
    }
  
  if (key == 'e') {
    endRecord();
  }
}


