
float angle = 0.0;
float offset = 60;
float scalar = 50;
float speed = 0.05;
float easing = 0.06;
float x;
float y;

void setup() {
  size(1200, 1200);
  smooth();
}

void draw() {
  fill(0,0,0,40);
  rect(0,0,width,height);
//  float targetX = mouseX;
//  float targetY = mouseY;
//  float x += (targetX - x) * easing;
  float scalar = 300 + 5*dist(mouseX, mouseY, pmouseX, pmouseY);
  float targetX = mouseX + sin(angle) * scalar;
  float targetY = mouseY + cos(angle) * scalar;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  fill(255,0,0,255);
  ellipse( x, y, 40, 40);
  angle += .5;
}


