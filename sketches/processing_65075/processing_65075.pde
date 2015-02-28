

// Pressing Control-R will render this sketch.
  
  
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
float d;

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
  background(189, 115, 238);
  d = dist(mouseX, mouseY, ex, ey);
  
  if ((mousePressed == true) &&
      (mouseX > rx) && (mouseX < rx+rd) &&
      (mouseX > ry) && (mouseY < ry+rd)) {
      fill(60, 60, 255);
      } else if
      ((mouseX > rx) && (mouseX < rx+rd) &&
       (mouseY > ry) && (mouseY < ry+rd)) {
       fill(0, 0, 196);
       } else {
       fill(0, 0, 100);  
       }
       rect(rx, ry, rd, rd);
  
  if ((mousePressed == true) &&
      (d < ed/2)) {
      fill(60, 255, 60);
      } else if
      (d < ed/2) {
      fill(0, 196, 0);
      } else {
        fill(0, 140, 0);
      }
      ellipse(ex, ey, ed, ed);
}

