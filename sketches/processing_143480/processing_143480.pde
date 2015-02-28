
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Moon Ye Lin
// ID: 201420077

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  noStroke();
  rect(0, 0, width, height);

  for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
      stroke(255);
      strokeWeight(2);
      noFill();
      ellipse(i, j, 50, 50);
      rectMode(CENTER);
      rect(i, j, 50, 50);
    }
  }
}

