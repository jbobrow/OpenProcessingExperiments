
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

float circ= random(floor(100), floor(250));

void draw() {
  // Start with a circle
  ellipseMode(CORNER);
  noFill();
  stroke(255);
  ellipse(circ, circ, circ, circ);

  // Add regulating lines using trace
  if (mousePressed) {
    noStroke();
    fill(250, 255, 124, 100);
    rect(circ, 0, circ, width);
    fill(250, 255, 124, 30);
    rect(0, circ, height, circ);
  }

  // Create white figure based on the positioning of the circle
  if (mousePressed) {
    stroke(200, 0, 0);
    line(circ/2, 0, circ/2, height);
    line(0, circ+circ/2, width, circ+circ/2);
    noStroke();
    fill(255);
    rect(0, 0, circ/2, circ+circ/2);
  }
}


