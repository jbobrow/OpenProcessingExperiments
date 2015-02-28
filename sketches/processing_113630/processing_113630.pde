
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
   
float ex, ey;    // ellipse x- and y-coordinate
float ed = 100;  // ellipse diameter
   
void setup() {
  size(640, 480);
  smooth();
  rectMode(CENTER);
  noStroke();
    
  // Set the x- and y-coordinates for the rectangle
  rx = width/3;
  ry = height/2;
    
  // Set the x- and y-coordinates for the ellipse
  ex = 2*width/3;
  ey = height/2;
}
   
void draw() {
  background(0);
  fill(255);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  
  if (mouseX>100 && mouseX<250) {
    fill(0);
    rect(rx, ry, rd, rd);
  }
if (mousePressed) {
    fill(0,255,0);
    ellipse(ex, ey, ed, ed);
  }

 
  }




