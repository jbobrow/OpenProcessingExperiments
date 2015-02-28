
float xoff = 0.0;

void setup() {
  size(500, 500);
  background(255);
  frameRate(5);
}

void draw() {
  background(255);
  for (int j=0; j<33; j++) {
    translate(j, 0);
    xoff = xoff + .01;
    float n = noise(xoff) * width;
    noStroke();
    fill(0, random(66, 165), random(66, 165));
    if (mousePressed) {
      fill(0, n/2, n/1.5);
    }
    rectMode(CENTER);
    rect(0, 250, 50, n, 5);
  }
}

