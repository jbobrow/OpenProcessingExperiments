
import processing.pdf.*;

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com


boolean record;

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(200,200);
  background(255);
  smooth();    
}

void draw() {
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf"); 
  }

  // Draw something good here
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);

  if (record) {
    endRecord();
  record = false;
  }
}

// Use a keypress so thousands of files aren't created
void mousePressed() {
  record = true;
}





