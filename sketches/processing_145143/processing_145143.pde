
import processing.pdf.*;

boolean record;

void setup() {
  size(800, 400);
}

void draw() {
  if(record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  
  background(255);
  if(mousePressed) {
    beginShape();
    float a= random(500);
    float b= random(500);
    float t= 0.05;
  
  for (int p=0;p<1000;p++) {
    float l = random(10,50);
    stroke(a/9, b/9, 72);
    strokeWeight(t);
    //line( mouseX, mouseY, a, b);
    line(mouseX, mouseY, pmouseX, pmouseY);
    //quad(mouseX, mouseY + l, a, b, a + l, b + l, 20, 20);
    line(mouseX, mouseY+ l,pmouseX,pmouseY+l);
    triangle(mouseX, mouseY + l, pmouseX, mouseY, pmouseX, pmouseY);
    
    if(record) {
      endRecord();
      record = false;
    }
  }
}
saveFrame("images/export-"+"-#####.jpeg");
  if ( frameCount >= 100 ) {
    exit();}
}

void mousePressed() {
  record = true;
  }
  





