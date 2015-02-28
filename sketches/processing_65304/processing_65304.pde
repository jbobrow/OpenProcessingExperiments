
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
  background(102);


fill(255);
if((mouseX > rx) && (mouseX < rx+rd) && (mouseY > ry) && (mouseY < ry+rd))
{strokeWeight(25);}

else{
  strokeWeight(0);}
  
    rect(rx, ry, rd, rd);

float d = dist(mouseX, mouseY, ex, ey);
strokeWeight(0);
if (d < ed/2) {
  fill(255, 12, 100);
} else {
  fill(255);}
  ellipse(ex, ey, ed, ed);
  
}
