


import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;


void setup() {
  size(720, 720);
  noCursor();
}


void draw() {


  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER); 
  noStroke();
  background(mouseY, 100, 100);

  fill(360-mouseY/2, 100, 100);
  ellipse(360, 360, mouseX+10, mouseX+10);

}








