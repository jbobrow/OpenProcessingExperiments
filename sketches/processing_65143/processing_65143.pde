
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65064*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
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
    if ((mouseX > rx) && (mouseX < rx + rd) &&
       (mouseY > ry) && (mouseY < ry + rd)) {
         fill (255, 20, 147);
    } else {
         fill(255);
    } 
  
    if ((mouseX > rx + rd/2) && (mouseX < rx + rd) &&
       (mouseY > ry) && (mouseY < ry + rd) && (mousePressed)) {
         rx++;
    }
  
    if ((mouseX > rx) && (mouseX < rx + rd/2) && 
       (mouseY > ry) && (mouseY < ry + rd) && (mousePressed)) {
         rx--;
    }
  rect(rx, ry, rd, rd);
  float d = dist(mouseX, mouseY, ex, ey);
    if (d < ed/2) {
       ey++;
    } else {
       fill (255);
    }

    if ((d < ed/2) && (mouseY > ey) &&
       (mousePressed)) {
          ed--;
    }
  
    if ((d < ed/2) && (mouseY < ey) &&
       (mousePressed)) {
          ed++;
    }
    
  ellipse(ex, ey, ed, ed);
  
}


