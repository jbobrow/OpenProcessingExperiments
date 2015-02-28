
import processing.pdf.*;

void setup() {
  size(400,400);
  smooth();
  colorMode(HSB, 100);
}

void draw() {
  
  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);

  if(mousePressed == true) {
    if (abstand > 20) {
      abstand = 20;
    }
    strokeWeight(20-abstand);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

}


void mousePressed() {
 println("mouse gedrückt");
 stroke(random(255),100,50);
}

void keyPressed() {
   if (key ==  's') {
     println("Frame abspeichern");
     saveFrame("screenshot-####.tif");
   }
   if (key == 'b') {
     background(100); 
   }
   if (key == 'p') {
     beginRecord(PDF, "zeichnung.pdf");
     colorMode(HSB, 100);
     background(100);
   }
   if (key == 'e') {
     endRecord();
   }
}



