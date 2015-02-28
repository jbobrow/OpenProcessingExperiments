
float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 50;

void setup() {
  size(500, 500);
  smooth(); 
  strokeWeight(5.0);
  stroke(0);
}

void draw() {
  background(0,70,30);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  ellipse(x, y, 160, 160);
  ellipse(x, y, 100, 100);
 ellipse(x, y, 60, 60);
 ellipse(x, y, 20, 20);
 ellipse(x, y, 10, 10);
  
  
  
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

