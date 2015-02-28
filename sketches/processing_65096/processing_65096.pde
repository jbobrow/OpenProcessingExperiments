
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
 background(0, 0, 0);
  strokeWeight(1);
  color(0);
      if ((mouseX>=rx)&&(mouseX<=rx+100)&&(mouseY>height * 0.5 - rd/2)&&(mouseY<height * 0.5 + rd/2)){background(239, 101, 68);}
      if ((mouseX<=ex+53)&&(mouseX>ex-53)&&(mouseY<=ey+53)&&(mouseY>ey-53)){background(61, 139, 214);}
  rect(rx, ry, rd, rd); ellipse(ex, ey, ed, ed);
  }


