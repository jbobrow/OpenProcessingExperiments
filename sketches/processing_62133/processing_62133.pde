
void setup() {
  size(400, 400);
  smooth();
  noCursor();
  background(0);
}

void draw() {

  for (int i = 200; i < width; i = i + 50) {
    for (int j = 20; j < height; j = j + 20) {
      stroke(255, 10);
      noFill();
      bezier(mouseX, mouseY, i, i, 0, 200, j, 400);
      if (mousePressed) {
              stroke(255, 90);
        bezier(mouseX, mouseY, i, i, 100, 200, j, 0);
        noStroke(); // keine kontur
        fill(0, 5); // 200: grauwert, 20% transparenz
        rect(0, 0, width, height); // so groß wie der hintergrund
        stroke(0); // folgende rects haben schwarzen rahmen
      }
    }
  }
}


