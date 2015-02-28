
import processing.pdf.*;
boolean record;
void setup() {
  size(400, 400);
  background(0,0,0,255);
  noStroke();
  smooth();
  fill(0,0,255);
  beginRecord(PDF,"frame.pdf");
}
int value = 0;
void draw() {
}
// Use a keypress so thousands of files aren't created
void keyPressed() {
  endRecord();
}
void mousePressed() {
  fill(random (255),random (255),0,50);
  float x1=(random(200));
  float x2=(random(200));
  float x3=(random(200));
  ellipse(mouseX,mouseY,x1,x1  ); 
  ellipse(mouseX,mouseY,random( 200),random(200)); 
  ellipse(mouseX,mouseY,random( 200),random(200));
}


