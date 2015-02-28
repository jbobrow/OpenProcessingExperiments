
void setup() {
  size(200, 200);
}

void draw() {
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y ++) {
      float start = random(0, width);
      float end = random(0, height);
      if ( start > end ) {
        stroke(0, 0, 0);
      }
      else {
        stroke(245, 245, 245);
      }
      line(x, y, start, end);
    }
  }
}


