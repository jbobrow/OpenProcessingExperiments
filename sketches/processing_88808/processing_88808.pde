
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
  background(0);
   
  if ((mouseX > rx) && (mouseX < 261.2) && (mouseY > ry) && (mouseY< 231)) {
     if (mousePressed == true) {
    fill(0,246,252);
     }else{
  fill(247,50,202);
     }}else{
       fill(3,255,12);
  }
    rect(rx, ry, rd, rd);
   
 
  
  //ellipse
 distance = dist(mouseX, mouseY, ex, ey);
 if(distance < rad){
   fill(255,146,3);
   ellipse(ex, ey, ed, ed);
 }else{
   fill(250,255,3);
   ellipse(ex, ey, ed, ed);
 }
  
   if (mousePressed && distance < rad) {
   fill(255,3,3);
   ellipse(ex, ey, ed, ed);
 }
}



