
/* Weston Tate 
CSC 103
Assignment 3
September 16,2014
*/
 
 
float x1 = 90;
float y1 = 50;
float y3 = 20;
float x3 = 10;

float y1Speed = +2;
float x1Speed = -1;
float x2 = 400;
float y2  = 350;
float y2Speed = -2;
float x2Speed = 2;
float y3Speed= 1;
float x3Speed = 4;



 
void setup() {
  size(500,500);
}


void draw() {
  
  background(26, 9, 227);

  rect(100,150,300,200);
  
  float stripeHeight = 200/13;
  fill(255,0,0);
  noStroke();
  rect(100, 150, 300, stripeHeight);
  rect(100, 150 + 2*stripeHeight, 300, stripeHeight);
  rect(100, 150 + 4*stripeHeight, 300, stripeHeight);
  rect(100, 150 + 6*stripeHeight, 300, stripeHeight);
  rect(100, 150 + 8*stripeHeight, 300, stripeHeight);
  rect(100, 150 + 10*stripeHeight, 300, stripeHeight);
    rect(100, 150 + 12*stripeHeight, 300, stripeHeight);
    
 

  fill(255, 255, 255);
  rect(100,150,140,85);
  
  
  star(x1, y1, 12.5, 25, 5);
  star(x1 + random(-30, 30), y1 + random(-30, 30), 6, 12, 5);
  y1 = y1 + y1Speed;
  if (y1 > 450) { y1Speed = -y1Speed; }
  if (y1 < 10) { y1Speed = -y1Speed; }
  
  x1 = x1 + x1Speed;
  if (x1 < 10) { x1Speed = -x1Speed; }
  if (x1 > 450) { x1Speed = -x1Speed; }
  
  
  star(x2, y2, 12.5, 25, 5);
    star(x2 + random(-30, 30), y2 + random(-30, 30), 6, 12, 5);

    y2 = y2 + y2Speed;
  if (y2 > 450) { y2Speed = -y2Speed; }
  if (y2 < 10) { y2Speed = -y2Speed; }
  
  x2 = x2 + x2Speed;
  if (x2 < 10) { x2Speed = -x2Speed; }
  if (x2 > 450) { x2Speed = -x2Speed; }
  
    star(x3, y3, 12.5, 25, 5);
    star(x3 + random(-30, 30), y3 + random(-30, 30), 6, 12, 5);
    
    y3 = y3 + y3Speed;
  if (y3 > 450) { y3Speed = -y3Speed; }
  if (y3 < 10) { y3Speed = -y3Speed; }
  
  x3 = x3 + x3Speed;
  if (x3 < 10) { x3Speed = -x3Speed; }
  if (x3 > 450) { x3Speed = -x3Speed; }
  
  
  

  

  
  
  
}

















void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


