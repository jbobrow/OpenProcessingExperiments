
float x;
float y;

void setup() {
  size(400,400);
  smooth();
  
}

void draw() {
  background(123,32,75);
  
  x = (mouseX - x) * 0.2 + x;
  y = (mouseY - y) * 0.2 + y;
  
  ellipse( x, y, 30,30);
  
}
