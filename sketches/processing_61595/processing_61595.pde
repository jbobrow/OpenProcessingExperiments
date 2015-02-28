
import processing.pdf.*;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  
  beginRecord(PDF, "recordedPdf.pdf");
  
  noFill();
  stroke(255);
  
  for (int i = 0; i< 40; i++) {
    pushMatrix();
    
    for (int j = 0; j < 40; j++) {
      ellipse(5, 5, 5, 5);
      translate(0, 10);
    }
    
    popMatrix();
    
   // line(0, 0, 0, 200);
   translate(10, 0);
  }
  
  endRecord();
  
}

