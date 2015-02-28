
float x = 100;
float y = 100;

void setup() {
  size(501, 293);
  strokeWeight(40);
  stroke(255, 100);
}
  void draw() { 
  background(252,205,33);
 
  x = mouseX;
  y = mouseY;
  ellipse(x, y, 20, 20); 
}
