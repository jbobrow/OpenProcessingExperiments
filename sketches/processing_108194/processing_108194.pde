
float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 0;

void setup() {
  size(600, 360);
  strokeWeight(40.0);
  stroke(100, 100);
}

void draw() {
  background(255, 204, 0);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 int r = int(random(50));
  segment(x, y, angle1); 
  //stroke(220);
  stroke(random(255), random(255), random(255));
  ellipse(x, y, 20, 20);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  //line(0, 0, segLength, 0);
  popMatrix();
}
