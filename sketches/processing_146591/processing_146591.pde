
/*
This is adapted from a Processing Example
*/

float y = 100;

void setup() {
  size(400, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}

void draw() { 
  background(0);   // Set the background to black
  y = y - 1; 
  if (y < 0) { 
    y = height; 
  } 
  
  stroke(255);
  line(0, y, y, y);
  ellipse(y,y,y/10,y/10);
  fill(128);  
  text(round(y),5,y+11);
} 
