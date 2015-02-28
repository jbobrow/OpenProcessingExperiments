
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49691*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
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
  background(75, 125, 45);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  
    if(mouseX > rx && mouseX < rx+rd && mouseY > ry && mouseY <ry+rd){
    rect(ex-60, ey-60, rd+20, rd+20);
  }
  
  if(mouseX > ex-53 && mouseX < ex+53 && mouseY > ey-53 && mouseY <ey+53){
    ellipse(rx+rd/2, ry+rd/2, ed+35, ed+35);
  }
}

void mousePressed() 

{
 if(mouseX > rx && mouseX < rx+rd && mouseY > ry && mouseY <ry+rd){
    ellipse(ex, ey, ed, ed);
    fill(0);
 
  }
  
   if(mouseX > ex-53 && mouseX < ex+53 && mouseY > ey-53 && mouseY <ey+53){
    rect(rx, ry, rd, rd);
    fill(255);
  }
  
  }   


