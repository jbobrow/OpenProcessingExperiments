
import processing.pdf.*;

float angle;

void setup() {
  size(500,500);
  smooth();
  background(50);
    colorMode(HSB,100);
}

void draw() {
//  ellipse(mouseX,mouseY,10,10);

  
  if (mousePressed) {
 
  float abstand = dist(pmouseX,pmouseY,mouseX,mouseY);
//  ellipse(mouseX,mouseY,abstand,abstand);
 
 float dicke = 50-abstand;
 
 if (dicke < 1) { dicke = 1; }
 
 strokeWeight(dicke);
 
  line(pmouseX,pmouseY,mouseX,mouseY);
 
  }
  
}


void mousePressed() {
  colorMode(HSB, 100);
//  stroke(random(255),random(255),random(255));
  stroke(random(20,80),random(60,10),80);
}



void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.tif");}
  
  if (key == 'p') {
    beginRecord(PDF, "zeichnung.pdf");
  background(#ffffff);
//  colorMode(HSB,100);
  }
  
  if (key == 'e') {endRecord(); }
}



