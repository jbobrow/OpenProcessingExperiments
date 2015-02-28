
void setup() {
  size(500, 500);
}
void draw() {
  fill(mouseX/2, 0, mouseY/2, 10);
  stroke(0);
 if (mousePressed) { 
 triangle(0, 0, 500, 0, 500, 500);
 triangle(0, 500, 0, 0, 500, 500);
 } else { 
 
 triangle(0, 0, 500, 0, mouseX, mouseY);
 triangle(0, 500, 0, 0, mouseX, mouseY);
 }
  
  
}

