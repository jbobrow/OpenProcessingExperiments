
void setup() {
  size (450, 450);
  smooth();
}

void draw () {



  for (int x = 0; x < width; x += 10) {
    for (int y = 0; y < height; y+= 10) {
      stroke (5);
      strokeWeight(5);
      fill(1, 200, 200);
      rect(x, y, 15, 15);
    }
  }

  for (int x = 0; x < width; x += 37.999) {
    for (int y = 0; y < height; y+= 37.999) {
      stroke (5);
      strokeWeight(1);
      fill(200, 200, 14);
      ellipseMode(RADIUS);
      ellipse(x, y, 10, 10);
    }
  }
}


