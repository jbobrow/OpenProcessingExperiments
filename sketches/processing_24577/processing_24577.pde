
float abstand;
import processing.pdf.*;

void setup() {
  size (600,600);
  smooth();
  noFill();
  stroke(0, 50);
  
}


void draw() {
  if(mousePressed == true) {
  abstand = dist(pmouseX,pmouseY,mouseX,mouseY);
    ellipse(mouseX,mouseY,abstand,abstand);
  }

  if(abstand > 20) {
  abstand = 20;
}

strokeWeight(20-abstand);
line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed () {
if(key=='b'){
  background (100);
}

if (key == 'p'){
  beginRecord (PDF,"zeichnung.pdf");
  if (key == 'e'){
    endRecord();
  }
}
}
