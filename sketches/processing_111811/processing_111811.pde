

import processing.pdf.*;
float x, y;
float angle = 0; 
float diff = 0.2; 
float r = 200;
float col = 0;

void setup() {
  size(600, 600);
  beginRecord(PDF, "every.pdf");
  background(255);
  smooth();
}

void draw() {
  float rand = random(-10, 10);
  float colrand1 = random(0, 250);
  float colrand2 = random(0, 250);
  float colrand3 = random(0, 250);

  println(rand);
  x = r * cos(angle); 
  y = r * sin(angle);
  // background(255);
  translate(width/2, height/2);
  rotate(r);
  noFill();
  stroke(col);
  strokeWeight(0.2);
  line(-width/2, -height/2, x, y);
   line(width/2, -height/2, x, y);
   line(-width/2, height/2, x, y);
   line(width/2, height/2, x, y);
    stroke(255);
  ellipse(x,y,400,400);
  line(x, y, 0, 0);
  r = r - diff;
  angle += 1;
  if ( r == 0 || r == 200) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
  col = 255;
  }
   if (key == 'w') {
  col = 0;
  }
}



