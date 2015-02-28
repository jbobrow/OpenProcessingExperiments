

float x1 = 20;
float y1 = 0;
float targetX1;
float targetY1;
float accX1 = 20;
float accY1;
float x2 = 0;
float y2 = 100;
float targetX2;
float targetY2;
float accX2 = 0;
float accY2 = 0;
float easing = 0.0025;

//I like apples and bananas

void setup() 
{
  size(500, 500); 
  noStroke();
}

void draw() 
{ 
  background(50,50,50,0.0005);
  
  targetX1 = mouseX;
  float dx1 = targetX1 - x1;
  if(abs(dx1) > 1) {
    accX1 += dx1 * easing;
  }
  
  targetY1 = mouseY;
  float dy1 = targetY1 - y1;
  if(abs(dy1) > 1) {
    accY1 += dy1 * easing;
  }
  
  x1 += accX1;
  y1 += accY1;
  x1 *= 0.99;
  x1 *= 0.99;
  
  
  
    targetX2 = (x1 + mouseX) / 2;
  float dx2 = targetX2 - x2;
  if(abs(dx2) > 1) {
    accX2 += dx2 * easing;
  }
  
  targetY2 = (y1 + mouseY) / 2;
  float dy2 = targetY2 - y2;
  if(abs(dy2) > 1) {
    accY2 += dy2 * easing;
  }
  
  x2 += accX2;
  y2 += accY2;
  x2 *= 0.96;
  y2 *= 0.96;
  
  fill(255, 0, 255);
  ellipse(x1, y1, 22, 22);
  fill(0, 255, 255);
  ellipse(x2, y2, 30, 30);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  fill(255, 255, 0);
  ellipse((x1 + mouseX) / 2, (y1 + mouseY) / 2, 26, 26);
}

