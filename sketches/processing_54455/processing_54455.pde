
//Problem Set 2.3 by Nathan Smofsky
//Mouse variability over time
 
void setup() {
  size(400,400);
  background(255);
  smooth();
}
void draw() {
  if (mousePressed) {
    brush(mouseX, mouseY, frameCount*6, 10, 60);
  }
}
 
void brush(int x, int y, float rotate, float radius, float thickness) {    
  noStroke();
  translate(x, y);
  rotate(radians(rotate));
  fill(random (0), random (255), 0 );
  ellipse(thickness/2, 0, radius, thickness);
  ellipse(thickness/2, 0, 60, 10);
}


