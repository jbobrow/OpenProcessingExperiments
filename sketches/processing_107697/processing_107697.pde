
float x = 100;
float y = 100;
float angle1 = 20.0;
float segLength = 1;

void setup() {
  size(640, 360);
  strokeWeight(20.0);
  stroke(250,230,128);
}

void draw() {
  background(255,200,0);
  float dx = mouseX;
  float dy = mouseY;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 

  ellipse(x, y, 40, 40);




}
