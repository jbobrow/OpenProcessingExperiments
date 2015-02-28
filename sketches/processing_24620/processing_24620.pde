
import processing.pdf.*;

float angle = 0;

void setup() {
   size(400,400);
   smooth();
   colorMode(HSB, 100);
}

void draw() {

  angle += 0.03;

  if (mousePressed) {
    float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);

    translate(mouseX, mouseY);
    rotate(angle);
    line(0,0,abstand*20,0);
    
  }
  
}

void mousePressed() {
   //println("mouse pressed");
   stroke(random(40,60),random(60,100),80);
}

void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.tif"); }
  
  if (key == 'p') {
    println("Starting PDF Recording");
    beginRecord(PDF, "zeichnung-####.pdf");
    colorMode(HSB, 100);
    background(0,0,100);
  }
  if (key == 'e') { endRecord(); }

}



