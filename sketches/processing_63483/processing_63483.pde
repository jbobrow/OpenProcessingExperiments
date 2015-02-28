
/**
 * Easing. 
 * 
 * Move the mouse across the screen and the symbol will follow.  
 * Between drawing each frame of the animation, the program
 * calculates the difference between the position of the 
 * symbol and the cursor. If the distance is larger than
 * 1 pixel, the symbol moves part of the distance (0.05) from its
 * current position toward the cursor. 
 */
 
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float x5;
float y5;
float x6;
float y6;
float targetX1, targetY1;
float targetX2, targetY2;
float targetX3, targetY3;
float targetX4, targetY4;
float targetX5, targetY5;
float targetX6, targetY6;
float easing = 0.05;

void setup() 
{
  size(600, 400); 
  smooth();
  noStroke();  
}

void draw() 
{ 
  background( 51 );
  
  targetX1 = mouseX;
  float dx1 = targetX1 - x1;
  if(abs(dx1) > 1) {
    x1 += dx1 * easing * 0.2;
  }
  
  targetY1 = mouseY;
  float dy1 = targetY1 - y1;
  if(abs(dy1) > 1) {
    y1 += dy1 * easing * 0.2;
  }
  
  ellipse(x1, y1, 11, 11);
  
  targetX2 = mouseX;
  float dx2 = targetX2 - x2;
  if(abs(dx2) > 1) {
    x2 += dx2 * easing * 0.4;
  }
  
  targetY2 = mouseY;
  float dy2 = targetY2 - y2;
  if(abs(dy2) > 1) {
    y2 += dy2 * easing * 0.4;
  }
  
  ellipse(x2, y2, 22, 22);
 
   
  targetX3 = mouseX;
  float dx3 = targetX3 - x3;
  if(abs(dx3) > 1) {
    x3 += dx3 * easing * 0.6;
  }
  
  targetY3 = mouseY;
  float dy3 = targetY3 - y3;
  if(abs(dy3) > 1) {
    y3 += dy3 * easing * 0.6;
  }
  
  ellipse(x3, y3, 33, 33);
  
    
  targetX4 = mouseX;
  float dx4 = targetX4 - x4;
  if(abs(dx4) > 1) {
    x4 += dx4 * easing * 0.8;
  }
  
  targetY4 = mouseY;
  float dy4 = targetY4 - y4;
  if(abs(dy4) > 1) {
    y4 += dy4 * easing * 0.8;
  }
  
  ellipse(x4, y4, 44, 44);
  
    
  targetX5 = mouseX;
  float dx5 = targetX5 - x5;
  if(abs(dx5) > 1) {
    x5 += dx5 * easing * 1.0;
  }
  
  targetY5 = mouseY;
  float dy5 = targetY5 - y5;
  if(abs(dy5) > 1) {
    y5 += dy5 * easing * 1.0;
  }
  
  ellipse(x5, y5, 55, 55);
  
    
  targetX6 = mouseX;
  float dx6 = targetX6 - x6;
  if(abs(dx6) > 1) {
    x6 += dx6 * easing * 1.2;
  }
  
  targetY6 = mouseY;
  float dy6 = targetY6 - y6;
  if(abs(dy6) > 1) {
    y6 += dy6 * easing * 1.2;
  }
  
  ellipse(x6, y6, 66, 66);
  
  
}

