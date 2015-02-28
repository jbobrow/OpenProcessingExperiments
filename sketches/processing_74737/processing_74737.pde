
int x = 0;
int y = 0;

void setup() {
  size(400, 400, P2D);
  smooth();
}



void draw() {

  background(255);

  for (int x = 0; x <= width; x = x + 40) {
    for (int y = 0; y <= height; y = y + 40) {

      noStroke();
      fill(208, 68, 106, 20);

      quad(x, y, 180, 200, x, y, 220, 200);
    }
  }
}



