
// dmb workshop 3 VARIABLES, RESPONSE  "gotta go"
  
  
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
  
void setup() {
  size(640, 360);
  smooth();
   
  // Setting the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Setting the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  // Setting up interactive circumstances
  void draw() {
  background(110,255,150);
  ellipse(200,200,20,20);
  rect(rx, ry, rd, rd);
  fill(110,255,150);
  ellipse(ex, ey, ed, ed);
  if ((mouseX>=rx)&&(mouseX<=rx+100)&&(mouseY>height * 0.5 - rd/2)
  &&(mouseY<height * 0.5 + rd/2)){background(0,0,0);}
  if ((mouseX<=ex+53)&&(mouseX>ex-53)&&(mouseY<=ey+53)
  &&(mouseY>ey-53)){background(110,255,150);}
  ellipse(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
}

