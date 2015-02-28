
// Simone Roth - Problem Set 2 question 2 // 

void setup() {
  size(400,400);
  background(255);
  smooth();
}
void draw() {
  if (mousePressed) { 
    brush(mouseX, mouseY);
    
  }
}

void brush(int x, int y) {     
  noStroke();
  fill(random (200), random (128), 0 );
  ellipse(mouseX, mouseY, 50, 60);
  ellipse(mouseX, mouseY, 60, 20); 
}


