
//GLOBAL VARIABLES
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
   
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106/2;  // ellipse diameter
float distance;
int rad;
int radius;
 
//setup
void setup() {
  size(640, 360);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
    
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2; //161.2
  ry = height * 0.5 - rd/2; //130
    
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66; //422.4
  ey = height * 0.5; //180
  rad = 60;
}
   
void draw() {
  background(102);
   
  if ((mouseX > rx) && (mouseX < 261.2) && (mouseY > ry) && (mouseY< 231)) {
     if (mousePressed == true) {
    fill(126);
     }else{
  fill(30,208,85);
     }}else{
       fill(0);
  }
    rect(rx, ry, rd, rd);
   
 
  
  //ellipse
 distance = dist(mouseX, mouseY, ex, ey);
 if(distance < rad){
   fill(255);
   ellipse(ex, ey, ed, ed);
 }else{
   fill(246,255,0);
   ellipse(ex, ey, ed, ed);
 }
  
   if (mousePressed && distance < rad) {
   fill(89, 23, 12);
   ellipse(ex, ey, ed, ed);
 }
}
 
/*
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
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
}
*/


