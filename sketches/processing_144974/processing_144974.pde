
/* Shim Sang Joon
 201420086
 
 -WHAT TO DO
 
 1. change color
 2. add another speed ex) xSpeed2, ySpeed2
 3. add some black line ( don't make it BLUR!)
 4. don't constrain at the edge
 
 */

float c1 = 255; 
float c2 = 50;     
float c1a = 0;   
float c2b = -1;  


int x = 1;
int y = 2;
int x2 = 3;
int y2 = 4;

int xSpeed = 1;
int ySpeed = 1;
int xSpeed2 = -1;
int ySpeed2 = -2;

void setup() {
  size(1024, 768);
  background(0);
}

void draw() {
  x = x + xSpeed;
  y = y + ySpeed;
  x2 = x2 + xSpeed2;
  y2 = y2 + ySpeed2;

  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }
  if ((y > height) ||(y < 0)) {
    ySpeed = ySpeed * -1;
  }
  if ((x2 > width) ||(x2 < 0)) {
    xSpeed2 = xSpeed2 * -1;
  }
  if ((y2 > height) || (y2 < 0)) {
    ySpeed2 = ySpeed2 * -1;
  }

  c1 = c1 + c1a; 
  c2 = c2 + c2b;

  if (c1 < 0 || c1 > 255) { 
    c1a *= -1;
  } 
  if (c2 < 0 || c2 > 255) { 
    c2b *= -1;
  } 

  noFill();
  stroke(c1, 50, c2, 50);
  quad(x, height, width, y, x2, y2, x, y);
  
  
}

