
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072

int x = 1; 
int y = 2; 
int xSpeed = 2; 
int ySpeed = 1; 

void setup() {
  colorMode(RGB, 255);
  size (1024,768);
  smooth();
  background(0);
}

void draw() {
  background(0);
  x = x + xSpeed; 
  y = y + ySpeed;
  if ((x > width) || (x < 0)) { 
    xSpeed = xSpeed * -1;
  } 
  if ((y >height) || (y < 0)) { 
    ySpeed = ySpeed * -1;
  } 
 
  //draw a quad
  strokeWeight(6);
  stroke(240);
  
  fill(x, y, 20); 
  quad(width-x, 0, 100, height, 100, y, width-x, height-y);
  
  fill(x, y, 100); 
  quad(width-y, x, height-x, width-x, 30, width, 200, width);
  
  fill(x, 50, y); 
  quad(height, 0, 0, width-x, height, width-x, 10, width); 
  quad(x, 0, 100, height-x, 0, y, width-y, height-x);
  rect(width, height-y, 50, 30);
}

