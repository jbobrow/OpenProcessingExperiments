
float x = 0;
float y = 0;
float angle1 = 0.0;
float segLength = 0;

void setup() {
  size(500, 300);
  strokeWeight(40);
  stroke(255,100);
}

void draw() {
  background(255,220,20);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  segment(-30, -30, 0); 
  ellipse(x, y, 20, 20);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, 0, 0);
  popMatrix();
}
