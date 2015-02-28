
/* Shim Sang Joon 
 201420086 
 */

float c1 = 0; 
float c2 = 0;     
float c1a = 1;   
float c2b = -1;  

int x = mouseX; 
int y = mouseY;
int x2 = 1;
int y2 = 1;
int xSpeed = 1; 
int ySpeed = 2; 
int xSpeed2 = 1;
int ySpeed2 = 1;

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
  if ((x2 > width) || (x2 < 0)) {
    xSpeed2 = xSpeed2 * -1;
  }
  if ((y2 > height) || (y2 <0 )) {
    ySpeed2 = ySpeed2 * - 1;
  } 
  noFill();
  stroke(c1, 255, c2, 3); 
  c1 = c1 + c1a; 
  c2 = c2 + c2b;
 
 // I use color bouncing for the white line 

  if (c1 < 0 || c1 > 255) { 
    c1a *= -1;
  } 
  if (c2 < 0 || c2 > 255) { 
    c2b *= -1;
  } 

  bezier(x-x2, y-y2, width-x, y2, x2, height-y, x, y );
}
