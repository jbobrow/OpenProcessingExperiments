
// Simone Roth - Problem Set 2 question 3 // 

void setup() {
  size(400,400);
  background(255);
  smooth();
}
void draw() {
  if (mousePressed) { 
    brush(mouseX, mouseY, frameCount*10, 10, 80);
    
  }
}

void brush(int x, int y, float rotate, float radius, float thickness) {     
  noStroke();
  translate(x, y);
  rotate(radians(rotate));
  fill(random (200), random (128), 0 );
  ellipse(thickness/2,0, radius, thickness);
  ellipse(thickness/2,0, 50, 50);
  
}


