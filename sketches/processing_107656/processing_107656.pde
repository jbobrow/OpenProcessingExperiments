
float x = 1;
float y = 1;
 
void setup() {
  size(500, 300);
  strokeWeight(40.0);
  stroke(255, 100);
}
 
void draw() {
  background(255, 204, 0);;
  x = mouseX;
  y = mouseY;
  ellipse(x, y, 20, 20);
}

