
float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 0;

void setup() {
  size(500, 200);
  strokeWeight(40.0);
  stroke(255, 100);
}

void draw() {
  background(255,200,0);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 

  ellipse(x, y, 20, 20);
}

