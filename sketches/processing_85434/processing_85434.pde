
void setup() {
  size(480, 120);
  smooth();
  background(204, 226, 225);     // Light pink color
fill(255, 0, 0, 160);          // Red color
}
void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255); 
  }
  ellipse(mouseX, mouseY, 80, 80);
  
}
