
float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 0;
 
void setup() {
  size(500, 250);
  strokeWeight(35.0);
  stroke(200, 150);
 }
   
void draw() {
  background(1000, 1000, 0000, 1000);
   
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx); 
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
  
  segment(x, y, angle1);
  ellipse(x, y, 20,20);
}
 
void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
