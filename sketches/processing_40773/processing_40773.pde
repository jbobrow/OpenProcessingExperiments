
void setup() {
  size(400, 400);
  smooth();
  background(255);
}

// initialize the random variable
float r = 0;
float r2 = 0;

void mouseDragged() {
  // add a random movement to the points
  r = random(3);
  r2 = random(5);
}

void draw() {
  // draw according to mouse status
  if (mousePressed) { 
    stroke(0, 80);
    point(mouseX, mouseY);
    point(mouseX, mouseY+r);
    point(mouseX, mouseY-r);
    point(mouseX+r, mouseY);
    point(mouseX-r, mouseY);
    point(mouseX+r, mouseY+r);
    point(mouseX-r, mouseY-r);
    point(mouseX+r, mouseY-r);
    point(mouseX-r, mouseY+r);
    
    stroke(0, 40);
    point(mouseX, mouseY+r2);
    point(mouseX, mouseY-r2);
    point(mouseX+r2, mouseY);
    point(mouseX-r2, mouseY);
    point(mouseX+r2, mouseY+r2);
    point(mouseX-r2, mouseY-r2);
    point(mouseX+r2, mouseY-r2);
    point(mouseX-r2, mouseY+r2);
  }
}
