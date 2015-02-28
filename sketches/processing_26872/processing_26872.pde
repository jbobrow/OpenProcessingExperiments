
import processing.pdf.*;

int angle = 0;

void setup() {
  size(640, 360);
  background(252,76,204);
  smooth();
  noStroke();
  fill(231,34,57);
}

void draw() {

  if (mousePressed == true) {
    angle += 50;
    float val = cos(radians(angle)) *10;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(245,102,24);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(243,225,35);
   quad(mouseX, mouseY, 86, 20, 69, 63, 30, 76);

  }
}

void keyPressed() {
  switch(key) {

  case 'q': 
   println("endRecord");
     endRecord();
    break;
   
   case 's': 
    println("BEGIN RECORD");
   beginRecord(PDF, "Lines.pdf"); 
    break;
  }
}

