
float x = 60; 
float y = 440; 
int radius = 50; 

float easing = 0.04;
 
void setup() {
  size(500, 500);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}
 
void draw() {
   
  int targetX = mouseX;
  x += (targetX - x) * easing;
  float ny = y  - radius;
   
   
     int targety = mouseY;
  y += (targety - y) * easing;
  float nx = x  - radius;
  background(200, 100, 0);
  
   
 
  fill(0);
  ellipse(x+12, ny, radius, radius); 
  
}


