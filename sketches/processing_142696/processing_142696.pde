
void setup() {
  size(500, 500);
}
void draw() {
  fill(255, 255, 255, 10);
  stroke(0);
 
 triangle(0, 0, 500, 0, mouseX, mouseY);
 triangle(0, 500, 0, 0, mouseX, mouseY);
  
  
}

