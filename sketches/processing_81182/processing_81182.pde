
// Robot 3: Response from "Getting Started with Processing"
// by Reas & Fry. O'Reilly / Make 2010
// re-coded by Programming AtTemp 2012
 
float x = 80;          // X-coordinate
float y = 600;         // Y-coordinate
int radius = 30;       // Head Radius
int bodyHeight = 200;  // Body Height
int neckHeight = 70;   // Neck Height
 

float easing = 1;
 
void setup() {
  size(600, 600);
  smooth(5);
  strokeWeight(7);
  ellipseMode(RADIUS);
 

}
 
void draw() {
   
  int targetX = mouseX;
  x += (targetX - x) * easing;
     
  if (mousePressed) {
    neckHeight = 350;
    bodyHeight = 350;
  } else {
    neckHeight = 80;
    bodyHeight = 160;
  }
   
  float ny = y - bodyHeight - neckHeight - radius;
// int ny = y - bodyHeight - neckHeight - radius;  // Neck Y 
  background(#562120);
// background(#990000);                            //Templeton Maroon
   
  // Neck
  stroke(#eedd11);                 // Set stroke to Templeton Gold
  line(x+2, y-bodyHeight, x+2, ny);
  line(x+12, y-bodyHeight, x+12, ny);
  line(x+22, y-bodyHeight, x+22, ny);
 

 
  // Antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
 

  
  // Body
  noStroke();
  fill(102);
  ellipse(x, y-33, 33, 33);
  fill(0);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill(102);
  rect(x-45, y-bodyHeight+17, 90, 6);
   

  
 
  // Head
  fill(0);
  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3);
  

 }
