
import processing.pdf.*;

void setup() {
  size(400, 400);
}

void draw() {
  background(250);
  
  beginRecord(PDF, "homework16.04.pdf");
  
  noFill();
  stroke(0);
  
  for (int i = 0; i< 40; i++) {
    pushMatrix();
    
    for (int j = 0; j < 40; j++) {
      ellipse(5, 5, j, j);
      translate(20, 0);
    }
    

    popMatrix();
    
   // line(0, 0, 0, 200);
   translate(0, 20);
  }
  
  endRecord();
  
}

