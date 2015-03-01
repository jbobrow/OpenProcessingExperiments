
void setup () {
  size(400, 300);
}

void draw () {
  for (int x = 0; x < width; x+= 20) {
    for (int y = 0; y < height; y +=20) {
      rect(x, y, 10, 10);
    }
  }
}
