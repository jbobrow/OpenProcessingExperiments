
//Problem Set 2.2 by Nathan Smofsky
//Drawing with the mouse

void setup() {
  size(400, 400);
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
  fill(random (0), random (255), 0 );
  ellipse(mouseX, mouseY, 10, 60);
  ellipse(mouseX, mouseY, 60, 10);
}


