
void setup() {
  size(500, 500);
  smooth();
}


float x;
float y;
float targetX;
float targetY;


void draw() {
  x += (targetX/100);
  y += (targetY/100);
  targetX = mouseX - x;
  targetY = mouseY - y;
  background(255);
  fill(255);
  stroke(2);
  stroke(0, 0, 255);
  ellipse(x, y, 50, 50);
 
}



