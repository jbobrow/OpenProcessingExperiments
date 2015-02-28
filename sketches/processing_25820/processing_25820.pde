
import processing.pdf.*;

float rotation = 0;
boolean rotateLines = false;
boolean recordPDF = false;

void setup() {
  size(400,400);
  smooth();
  colorMode(HSB,100);
  stroke(0); // schwarze Strichfarbe
}

void draw() {

  if (recordPDF) {
    beginRecord(PDF,"pattern-####.pdf");
    colorMode(HSB,100); // wird hier nochmal benötigt für PDF
  }
  
  background(0,0,100); // weisser Hintergrund
  float stepSize = 20;

  if (rotateLines) rotation+=0.05;

  for(int x=0; x<=width; x+=stepSize) {
      for(int y=0; y<=height; y+=stepSize) {
        
        // Berechnungen für jede Position
        float angleToMouse = atan2(mouseY-y, mouseX-x);
        float distanceToMouse = dist(x,y,mouseX,mouseY);
        
        // Linie zeichnen
        pushMatrix();
        translate(x,y);
        rotate(angleToMouse + rotation);
        line(0,0,distanceToMouse/10,0);
        popMatrix();   

     }
  }
  
  if (recordPDF) {
    endRecord();
    recordPDF = false;
  }
  
}

void mousePressed() {
    rotateLines = !rotateLines;
}

void keyPressed() {

   if (key == 's') saveFrame();
 
   if (key == 'p') recordPDF = true;

}

