
import processing.pdf.*;
boolean savePDF = false;

PImage img;

void setup() {
  size(500,487);
  smooth(); 
  
  img = loadImage("pic.jpg");
  img.loadPixels();
  image(img, 0, 0,500,487);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf"); 
  
  float x = 0, y = 10;
  int counter = 0;
  
 // get current color
  color c = img.pixels[mouseY*500+mouseX];
  fill(c);
  noStroke();
  ellipse(mouseX,mouseY,10,10);
 

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}  

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png"); //save as .png
  if (key == 'p' || key == 'P') savePDF = true; // save as .pdf
}
  
 
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


















