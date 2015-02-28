
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
  background(102);
  float d = dist(mouseX, mouseY, ex, ey);
  
  //rectangle rollover

  if ((mouseX > rx) && (mouseY > ry) && (mouseX < rx + rd) && (mouseY < ry + rd)) {
   fill(0); 
  } else {
   fill(255); 
   }
   
     rect(rx, ry, rd, rd); 

 
   //ellipse rollover
    
    if (d < ed/2) {
    fill(255);
    fill(255,0,0);
  } else {
    fill(255);
  }
    ellipse(ex, ey, ed, ed);

}



