
// Yeonju Cho
 
// Pressing Control-R will render this sketch.
 
   
 
   
 
float rx, ry;    // rectangle x- and y-coordinate
 
float rd = 100;  // rectangle width
 
   
 
float ex, ey;    // ellipse x- and y-coordinate
 
float ed = 106;  // ellipse diameter
 
   
 
void setup() {
 
  size(640, 360);
 
  smooth();
 
    
 
  // Set the x- and y-coordinates for the rectangle
 
  rx = width * 0.33 - rd/2;
 
  ry = height * 0.5 - rd/2;
 
    
 
  // Set the x- and y-coordinates for the ellipse
 
  ex = width * 0.66;
 
  ey = height * 0.5;
 
}
 
   
 
void draw() {
 
  background(255,193,193);
 
  rect(rx, ry, rd, rd);
 
  ellipse(ex, ey, ed, ed);
 
  noStroke();
 
   
 
  // if the mouse is over the circle
 
  if (dist(ex, ey, mouseX, mouseY) < ed/2) {
 
    ellipse(ex, ey, ed+mouseX/4, ed+mouseY/4);
 
 
 
 
    // if the circle is clicked
 
     if(mousePressed == true) {
 
      ellipse(ex, ey, ed+10+mouseX/4, ed+10+mouseY/4);
 
     }
 
    }
 
  // if the mouse is over the rectangle
 
  if((rx < mouseX) && (mouseX < rx+rd) && (ry < mouseY) && (mouseY < ry+rd)) {
 
    fill(mouseX+mouseY, mouseX, mouseY);
 
    rect(rx, ry, rd, rd);
 
    fill(mouseX, mouseY, mouseX+mouseY);
 
    ellipse(ex, ey, ed, ed);
 
    // if the rectangle is clicked
 
    if(mousePressed == true) {
 
      rect(rx-5, ry-5, rd+10, rd+10);
 
    }
 
  }
 
}


