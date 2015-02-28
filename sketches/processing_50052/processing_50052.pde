
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106; // ellipse diameter

  
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
  rect(rx, ry, rd, rd);
  if (mousePressed) {
    fill(0);
  } else{
    fill(255);
  }
  
  
  
  ellipse(ex, ey, ed, ed);
  float d = dist(mouseX, mouseY,ex,ey);
  if (d<ex){
    fill (40,77,99);}
  if (mousePressed){
    fill (84,30,52);
  } else{
    fill(255);
  }
}


