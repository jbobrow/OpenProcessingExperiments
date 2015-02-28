
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Min Kyung Kim 
// ID:201420065 

void setup () {
  size (600, 600);
  smooth();
  background(0);
}

void draw () {
  for (int i = 0; i < 600; i = i + 60) {
    for (int j = 0; j < 600; j = j + 90) {
      fill(#5c5869);
      rect (i, j, 20, 50);
    }
  }
  for (int v = 40; v < 600; v = v + 60) {
    for (int m = 40; m < 600; m = m + 90) {
      fill(255);
      rect (v, m, 20, 50);
    }
  }
  for (int b = 20; b < 600; b = b + 60) {
    for (int k = 70; k < 600; k = k + 90) {
      strokeWeight(0);
      fill(#f5a196);
      ellipse(b, k, 30, 30);
    }
  }
}

