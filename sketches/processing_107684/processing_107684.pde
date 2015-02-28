
float x = 0;
float y = 0;
float angle1 = 0.0;
float segLength = 0;

void setup() {
  size(500, 280);
  strokeWeight(40.0);
  stroke(255, 110);
}

void draw() {
  background(255, 200, 0);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  segment(x, y, angle1); 
  ellipse(x, y, 20, 20);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  popMatrix();
}
