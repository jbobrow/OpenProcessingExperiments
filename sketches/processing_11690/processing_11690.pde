
// Internet "room" Exercise

// Initialise code
void setup() {
  size(500, 500);
  background(255);
  smooth();
}

// Initialise drawing
void draw() {
}

// Left Click + Hold draws random rectangles in shades of grey
// Right Click + Hold draws random ellipses in shades of grey
void mouseDragged() {
  if (mouseButton == LEFT) {
    fill(random(255));
    rectMode(CENTER);
    rect(mouseX, mouseY, random(40, 5), random(15, 60));
  }
  else if (mouseButton == RIGHT) {
    fill(random(255));
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, random(40, 5), random(15, 60));
  }
}

// Eraser tool - no hold, just move mouse around
void mouseMoved() {
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, random(20,5), random(15,30));
}

