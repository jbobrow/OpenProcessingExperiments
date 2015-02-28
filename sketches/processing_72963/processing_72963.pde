
float theta = 0;
int radius = 80;
float x, y, centerX, centerY;
float speedSec = 0.006;
 
void setup() {
  size(300, 300);
  centerX=width/2;
  centerY=height/2;
  smooth();
}
 
void draw() {
  background(78, 76, 90);
 
  noFill();
  stroke(255);
  ellipse(width/2, height/2, 2*radius, 2*radius);
 
  x=cos(theta)*radius + centerX;
  y=sin(theta)*radius+ centerY;
  noStroke();
  fill(238, 209, 211);
  ellipse(x-3, y-3, 10, 10);
  theta=theta+speedSec;

}
 

 



