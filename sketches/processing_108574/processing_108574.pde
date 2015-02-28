
import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(700, 700);
  cursor(HAND);
}
 
 
void draw() {
  // this line will start pdf export, if the variable savePDF was set to true
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
 
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
  background(mouseY/2, 50, 100);
 
  fill(320-mouseX/2, 100, 100);
  rect(500, 500, mouseX+50, mouseY+20);
 
  // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
 }
