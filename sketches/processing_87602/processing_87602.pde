
void setup() {
  size(200, 200);
}

int colorZone = 0;

void draw() {
  for (int x = 0; x < width; x += 9) {
    for (int y = 0; y < height; y += 5) {
      fill(0, 0, 0, random(mouseY, mouseX));
      ellipse(x + random(0,2), y + random(0,2), 10, 10);
    }
  }
  for (int j = 0; j < width; j += 9) {
    for (int k = 0; k < height; k += 5) {
      fill(255,255,255,50);
      ellipse(j, k, 10, 5);
    }
  }
}



